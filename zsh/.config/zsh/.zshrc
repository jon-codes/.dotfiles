# autoload -U colors && colors

PROMPT="%n@%m:%~ %# "

# plugins
source $ZDOTDIR/zsh-defer/zsh-defer.plugin.zsh
zsh-defer source $ZDOTDIR/zsh-completions/zsh-completions.plugin.zsh
zsh-defer source $ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
zsh-defer source $ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh

# history
HISTFILE=$ZDOTDIR/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt histignoredups

# completion
autoload -U compinit
zmodload zsh/complist
compinit

# ls
alias ls="ls -av --group-directories-first --color=auto"

# vi/vim/nvim
alias vim="nvim"
alias vi="nvim"

# fnm
path+=$HOME/.fnm
zsh-defer eval "`fnm env`"