autoload -Uz colors && colors
autoload -Uz add-zsh-hook

# history
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=10000
SAVEHIST=10000

setopt hist_ignore_dups
setopt inc_append_history

# completion
autoload -Uz compinit
zmodload zsh/complist
compinit

# git
autoload -Uz vcs_info
add-zsh-hook precmd vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' formats '%F{white}(%s:%f%F{magenta}%B%b%f%F{red}%u%c%m%f%%b%F{white})%f'

+vi-git-untracked() {
    if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
        hook_com[misc]+='?'
    fi
}

# prompt
setopt prompt_subst

local prompt_id_part='%F{green}%n@%m%f'
local prompt_dir_part='%F{yellow}%2~%f'

PROMPT="%B${prompt_id_part}:${prompt_dir_part}%b %# "
RPROMPT='${vcs_info_msg_0_}'

# set title
set_title() {
    print -Pn "\e]0;%n@%m:%~\a"
}

add-zsh-hook precmd set_title

# plugins
source $ZDOTDIR/zsh-completions/zsh-completions.plugin.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

source $ZDOTDIR/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# aliases
if [[ `uname` == "Darwin" ]]; then
    alias ls="ls -av --color=auto"
else
    alias ls="ls -av --group-directories-first --color=auto"
fi

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
    alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"
fi

# vim/nvim
alias vi="vim"

if type "$nvim" > /dev/null; then
  echo "NOT INSTALLED"
  alias vim="nvim"
fi
