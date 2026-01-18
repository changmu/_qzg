#!/bin/bash
# 带时间戳的 crontab 任务执行包装脚本
# 使用 mkdir 原子操作防止同一任务并发执行（兼容 macOS）

LOG_FILE="$HOME/log/crontab.log"
LOCK_DIR="$HOME/log/locks"
CMD_NAME="$1"
shift

# 确保锁目录存在
mkdir -p "$LOCK_DIR"

# 根据任务名生成锁目录（mkdir 是原子操作）
LOCK_PATH="$LOCK_DIR/$(echo "$CMD_NAME" | tr ' ' '_').lock"

# 尝试创建锁目录，如果已存在则说明有任务在运行
if ! mkdir "$LOCK_PATH" 2>/dev/null; then
    # 检查锁是否过期（超过30分钟认为是僵尸锁）
    if [[ -d "$LOCK_PATH" ]]; then
        LOCK_AGE=$(( $(date +%s) - $(stat -f %m "$LOCK_PATH") ))
        if [[ $LOCK_AGE -gt 1800 ]]; then
            echo "$(date '+%Y-%m-%d %H:%M:%S') [WARN] $CMD_NAME 清理过期锁 (${LOCK_AGE}秒)" >> "$LOG_FILE"
            rm -rf "$LOCK_PATH"
            mkdir "$LOCK_PATH" 2>/dev/null || { echo "$(date '+%Y-%m-%d %H:%M:%S') [SKIP] $CMD_NAME (无法获取锁)" >> "$LOG_FILE"; exit 0; }
        else
            echo "$(date '+%Y-%m-%d %H:%M:%S') [SKIP] $CMD_NAME (上一次任务仍在运行)" >> "$LOG_FILE"
            exit 0
        fi
    fi
fi

# 确保脚本退出时释放锁
trap "rm -rf '$LOCK_PATH'" EXIT

START_TIME=$(date +%s)
echo "$(date '+%Y-%m-%d %H:%M:%S') [START] $CMD_NAME" >> "$LOG_FILE"
"$@" >> "$LOG_FILE" 2>&1
EXIT_CODE=$?
END_TIME=$(date +%s)
DURATION=$((END_TIME - START_TIME))
echo "$(date '+%Y-%m-%d %H:%M:%S') [END] $CMD_NAME (exit: $EXIT_CODE, 耗时: ${DURATION}秒)" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"
