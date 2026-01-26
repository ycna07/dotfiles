#!/usr/bin/env bash
# wsctl.sh  usage: ./wsctl.sh  toggle|play|pause|next|prev
set -e

HOST="ws://localhost:25885"
CMD="$1"

# 参数检查
case "$CMD" in
  toggle|play|pause|next|prev) ;;
  *) echo "用法: $0  toggle|play|pause|next|prev" >&2; exit 1;;
esac

# 构造 JSON（无换行）
json="{\"type\":\"control\",\"data\":{\"command\":\"$CMD\"}}"

# 发送并实时打印服务端回包
printf '%s' "$json" | websocat "$HOST"

