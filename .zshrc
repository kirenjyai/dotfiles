# .zshrc
###############################################################################
stty stop undef
export LANG=ja_JP.UTF-8
export EDITOR=vim

# Set up the prompt

autoload -Uz promptinit; promptinit
prompt walters

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -v
bindkey -e

# Keep 50000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=500000
SAVEHIST=500000
HISTFILE=~/.zsh_history
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# Use modern completion system
autoload -Uz compinit; compinit
autoload -Uz colors; colors

setopt auto_cd
setopt auto_pushd
setopt correct
setopt list_packed
setopt nolistbeep

setopt pushd_ignore_dups
setopt extended_glob

# prompt setting
PROMPT="%F{cyan}%n%#%f "
PROMPT2="[31m%n[m> "
RPROMPT="[%F{green}%~%f]"
# for SSH
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%F{white}${HOST%%.*}%f ${PROMPT}"

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
if [ -f ~/.dircolors ]; then
  eval "$(dircolors ~/.dircolors)"
else
  eval "$(dircolors -b)"
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}' 'r:|[._-]=**'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:*:*:processes' menu yes select=2
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# alias設定
alias ls='ls -F --color'
alias less='less -i -R'
alias gitvimdiff='git difftool --tool=vimdiff --no-prompt'
alias grep='grep --color=auto'
alias grep-noobj='grep -Ev "\.(Po|o|a|dep|depend)$"'

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# python
if [ -f ~/.pythonrc.py ]; then
  export PYTHONSTARTUP=$HOME/.pythonrc.py
fi

# Virtualenvwrapper
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    source /usr/bin/virtualenvwrapper.sh
fi

# Pythonz
if [ -s $HOME/.pythonz/etc/bashrc ]; then
    source $HOME/.pythonz/etc/bashrc
fi

# EOF
