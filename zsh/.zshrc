# 设置历史文件路径
HISTFILE=$ZDOTDIR/.zsh_history  # 这里可以替换为你想要的路径，如 ~/Documents/zsh_history

# 可选：设置历史记录相关的其他参数
HISTSIZE=20000          # 内存中保存的历史命令数量
SAVEHIST=20000          # 保存到历史文件的命令数量
setopt appendhistory    # 退出时追加历史，而不是覆盖
setopt sharehistory     # 多个终端共享历史记录
setopt HIST_SAVE_NO_DUPS     # 写入历史文件时也去重
setopt HIST_EXPIRE_DUPS_FIRST # 当历史满时，优先删除重复项
setopt HIST_REDUCE_BLANKS    # 忽略只包含空格的命令
#开启拓展匹配
setopt extended_glob

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zmodload zsh/zprof
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$ZDOTDIR/.oh-my-zsh"
export ZSH_CUSTOM="$ZDOTDIR/custom"
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
ZVM_INIT_MODE=sourcing
plugins=(git zsh-autosuggestions zsh-syntax-highlighting zsh-completions vi-mode zsh-fzf-history-search  zoxide eza )
source $ZSH/oh-my-zsh.sh


# 加载carapace-bin补全
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)


export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8 
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export VISUAL='vim'
  export EDITOR='vim'
else
  export VISUAL='nvim'
  export EDITOR='nvim'
fi



$ZSH_CUSTOM/aliases.zsh



# dotnet env
export PATH="$PATH:$HOME/.dotnet/tools"
# go env
# electron mirror
export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
#nvm
# source /usr/share/nvm/init-nvm.sh
# fvm and flutter
export FVM_FLUTTER_URL="https://mirrors.tuna.tsinghua.edu.cn/git/flutter-sdk.git"
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
export PATH="$PATH:$HOME/fvm/default/bin"
export PATH="$PATH":"$HOME/.pub-cache/bin"
# py env
# export PYENV_ROOT="$HOME/.pyenv"
# eval "$(pyenv init -)"
export LIBVIRT_DEFAULT_URI="qemu:///system"


# if [[ -o interactive ]] && [[ "$TERM" == "xterritory-kitty" || "$TERM" == "xterm-kitty" ]]; then
#   fastfetch &
# fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

. ~/.x-cmd.root/X
# keybind
bindkey '^F' autosuggest-accept
