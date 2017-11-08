# Path to oh-my-zsh
export ZSH=$HOME/.oh-my-zsh

# PROMPT='${debian_chroot:+($debian_chroot)}%{$bold_color$fg[green]%}%n@%m%{$reset_color%}:%{$bold_color$fg[blue]%}%~%{$reset_color%}%# '
ZSH_THEME="custom"
PROMPT='%F{green}test%f'

# Show ... while waiting on autocomplete
COMPLETION_WAITING_DOTS="true"

# Show execution time if a command takes over 5 seconds
REPORTTIME=5

# Don't count common path separators as word characters
WORDCHARS=${WORDCHARS//[&.;\/]}

# History
setopt extended_history hist_no_store hist_ignore_dups hist_expire_dups_first hist_find_no_dups inc_append_history share_history hist_reduce_blanks hist_ignore_space
export HISTFILE=~/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000

# Force a reload of completion system if nothing matched; this fixes installing
# a program and then trying to tab-complete its name
_force_rehash() {
    (( CURRENT == 1 )) && rehash
    return 1    # Because we didn't really complete anything
}

# Always use menu completion, and make the colors pretty!
zstyle ':completion:*' menu select yes
zstyle ':completion:*:default' list-colors ''

# Completers to use: rehash, general completion, then various magic stuff and
# spell-checking.  Only allow two errors when correcting
zstyle ':completion:*' completer _force_rehash _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' max-errors 2

# When looking for matches, first try exact matches, then case-insensiive, then
# partial word completion
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**'

# Turn on caching, which helps with e.g. apt
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache

# Show titles for completion types and group by type
zstyle ':completion:*:descriptions' format "$fg_bold[black]» %d$reset_color"
zstyle ':completion:*' group-name ''

zstyle :compinstall filename '/home/mowsh/.zshrc'

# Always do mid-word tab completion
setopt complete_in_word

autoload -Uz compinit
compinit

# Plugins
plugins=(git sudo tmuxinator colors)

source $ZSH/oh-my-zsh.sh

# Custom alias
export EDITOR=vim
export PAGER=less
export LESS=RSM

# Enable tmuxinator plugin completion for mux shortcut
alias mux=tmuxinator


# Bash completions
autoload bashcompinit
bashcompinit



