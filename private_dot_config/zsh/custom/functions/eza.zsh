if command -v "eza" &>/dev/null; then
    alias l='eza -lha --icons=auto' \
        ll='eza -lh --icons=auto --sort=name --group-directories-first' \
        ld='eza -lhD --icons=auto' \
        lt='eza --icons=auto --tree'\
        ls='eza --icons=auto'
fi
