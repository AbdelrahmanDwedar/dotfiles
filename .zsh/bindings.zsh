# ctrl+backspace to delete a word
bindkey '^H' backward-kill-word
bindkey '5~' kill-word

# ctrl+right && ctrl+left
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# history substring search keys
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

