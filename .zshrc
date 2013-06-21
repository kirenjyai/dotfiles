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
HISTSIZE=50000
SAVEHIST=50000
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

# prompt setting
PROMPT="%F{cyan}%n%#%f "
PROMPT2="[31m%n[m> "
RPROMPT="[%F{green}%~%f]"
# for SSH
[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && PROMPT="%F{white}${HOST%%.*}%f ${PROMPT}"

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
if [ -f ~/.dircolors ]; then
  eval "$(dircolors ~/.dircolors)"
else
  eval "$(dircolors -b)"
fi
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias ls='ls -F --color'
