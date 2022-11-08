# fixing cursor
_fix_cursor() {
   echo -ne '\e[5 q'
}

precmd_functions+=(_fix_cursor)

# I made this as the box cursor bothers me all the time after using vim or neovim

# set neovim or vim or vi as main editor
if [[ -e $(which nvim) ]]; then
	export EDITOR="$(which nvim)"
elif [[ -e $(which vim) ]]; then
	export EDITOR="$(which vim)"
else
	export EDITOR="$(which vi)"
fi
