alias vi=nvim
alias ch=chezmoi
alias che=chezmoi edit

# 交互式终端中用 bat 代替 cat
if [ -t 1 ]; then

  alias cat='bat --paging=never --style=plain'

  fi

#yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

