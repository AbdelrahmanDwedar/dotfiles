# fixing cursor
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)
source /etc/zsh_command_not_found

# I made this as the box cursor bothers me all the time after using vim or neovim
