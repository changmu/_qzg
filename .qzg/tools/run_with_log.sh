#!/bin/bash
# 带时间戳的 crontab 任务执行包装脚本
# 使用 flock 防止同一任务并发执行

LOG_FILE="$HOME/log/crontab.log"
LOCK_DIR="$HOME/log/locks"
CMD_NAME="$1"
shift

# 确保锁目录存在
mkdir -p "$LOCK_DIR"

# 根据任务名生成锁文件
LOCK_FILE="$LOCK_DIR/$(echo "$CMD_NAME" | tr ' ' '_').lock"

# 使用 flock 尝试获取锁，-n 表示非阻塞，获取不到立即退出
exec 200>"$LOCK_FILE"
if ! flock -n 200; then
    echo "$(date '+%Y-%m-%d %H:%M:%S') [SKIP] $CMD_NAME (上一次任务仍在运行)" >> "$LOG_FILE"
    exit 0
fi

echo "$(date '+%Y-%m-%d %H:%M:%S') [START] $CMD_NAME" >> "$LOG_FILE"
"$@" >> "$LOG_FILE" 2>&1
EXIT_CODE=$?
echo "$(date '+%Y-%m-%d %H:%M:%S') [END] $CMD_NAME (exit: $EXIT_CODE)" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"
