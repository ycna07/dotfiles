alias op=xdg-open
alias vi=nvim
alias vid=neovide
alias ch=chezmoi
alias che=chezetc

alias rime-reconfig='qdbus org.fcitx.Fcitx5 /controller org.fcitx.Fcitx.Controller1.SetConfig "fcitx://config/addon/rime/deploy" ""'
alias rime-sync='qdbus org.fcitx.Fcitx5 /controller org.fcitx.Fcitx.Controller1.SetConfig "fcitx://config/addon/rime/sync" ""'

if command -v "bat" &>/dev/null; then
    #! alias -g -- h='-h 2>&1 | bat --language=help --style=plain --paging=never --color always' # <--- this is discouraged! This conflicts with posix -h test operator
    alias -g -- --help='--help 2>&1 | bat --language=help --style=plain --paging=never --color always'
    alias cat='bat --style=plain --paging=never --color auto'
fi

#yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

#WARN:!!! overwrite alias !!!
alias nslookup="dig +short"
alias nsq="resolvectl query"
alias bw=rbw
alias cd=z

# 检测是否为 kitty 终端
if [[ -n "$KITTY_WINDOW_ID" ]] || [[ "$TERM" == xterm-kitty ]]; then
    # 覆盖 ssh 命令
    alias ssh='kitten ssh'
fi
