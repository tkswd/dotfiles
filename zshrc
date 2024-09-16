# Enable auto-completion
autoload -Uz compinit
compinit
# Enable better tab completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Enable cd without typing cd
setopt AUTO_CD

# Allow some regex when globbing
# setopt EXTENDED_GLOB

# auto-correction
# setopt CORRECT
# setopt CORRECT_ALL

## Directory treversal
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# History settings
setopt EXTENDED_HISTORY
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

HISTORY_IGNORE="(ls|cd|pwd|exit|cd ..)"

bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward

bindkey -M viins '^R' history-incremental-search-backward
bindkey -M viins '^S' history-incremental-pattern-search-forward

## Vim-style keybind
bindkey -v

# Make mode switching more responsive
export KEYTIMEOUT=1

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

## Colors
autoload -U colors && colors

## Set up the prompt
setopt PROMPT_SUBST
PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$ '

alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lg='lazygit'

