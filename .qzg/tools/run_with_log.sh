#!/bin/bash
# 带时间戳的 crontab 任务执行包装脚本

LOG_FILE="$HOME/log/crontab.log"
CMD_NAME="$1"
shift

echo "$(date '+%Y-%m-%d %H:%M:%S') [START] $CMD_NAME" >> "$LOG_FILE"
"$@" >> "$LOG_FILE" 2>&1
EXIT_CODE=$?
echo "$(date '+%Y-%m-%d %H:%M:%S') [END] $CMD_NAME (exit: $EXIT_CODE)" >> "$LOG_FILE"
echo "----------------------------------------" >> "$LOG_FILE"
