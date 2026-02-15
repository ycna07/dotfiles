alias vi=nvim
alias ch=chezmoi
alias che=chezetc
alias cd=z

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

