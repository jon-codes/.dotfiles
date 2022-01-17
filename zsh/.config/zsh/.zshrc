autoload -U colors && colors

# history
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt hist_ignore_dups
setopt inc_append_history

# completion
autoload -U compinit
zmodload zsh/complist
compinit

# git
autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' unstagedstr '!'
zstyle ':vcs_info:*' stagedstr '+'
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
zstyle ':vcs_info:git:*' formats '%F{white}(%s:%f%F{magenta}%b%f%F{red}%u%c%m%f%F{white})%f'

+vi-git-untracked() {
    if [[ -n "$(git ls-files --others --exclude-standard)" ]]; then
        hook_com[misc]+='?'
    fi
}

# prompt
setopt prompt_subst

local prompt_id='%F{green}%n@%m%f'
local prompt_dir='%F{yellow}%3~%f'

PROMPT="${prompt_id}:${prompt_dir} %# "

RPROMPT='${vcs_info_msg_0_}'

# plugins
source $ZDOTDIR/zsh-completions/zsh-completions.plugin.zsh
source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# aliases
alias ls="ls -av --group-directories-first --color=auto"

alias vi="nvim"
alias vim="nvim"

# fnm
path+=$HOME/.fnm
eval "`fnm env`"
