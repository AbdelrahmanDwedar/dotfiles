# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE
HISTFILE=~/.history
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory
setopt hist_expire_dups_first
setopt hist_ignore_dups      
setopt hist_ignore_space     
setopt hist_verify           
