# ███████╗███████╗██╗  ██╗██████╗  ██████╗
# ╚══███╔╝██╔════╝██║  ██║██╔══██╗██╔════╝
#   ███╔╝ ███████╗███████║██████╔╝██║
#  ███╔╝  ╚════██║██╔══██║██╔══██╗██║
# ███████╗███████║██║  ██║██║  ██║╚██████╗
# ╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝


# ~/.zshrc
# run on open
if [[ -e $(which neofetch) ]]
then
  neofetch
fi

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls -CF --color=auto'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Powerline configuration
if [ -f /usr/share/powerline/bindings/zsh/powerline.zsh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/bindings/zsh/powerline.zsh
fi

########################################################################################
########################################################################################
#######################                                          #######################
##################                                                   ###################
##################                    Plugins                        ###################
##################                                                   ###################
######################                                           #######################
########################################################################################
########################################################################################

# all aliases
source ~/.zsh/aliases.zsh

# all plugins
source ~/.zsh/plugins.zsh

# bindings
source ~/.zsh/bindings.zsh

# fixing the cursor to the line cursor after closing vim or neovim
source ~/.zsh/vim.zsh

# setup the history to ~/.history and setup everything else
source ~/.zsh/history.zsh

export PATH="$PATH:$HOME/flutter/bin"
export PATH="$PATH:$HOME/.config/composer/vendor/bin"
export PATH="$PATH:$HOME/.bun/bin"

# Set neovim or vim or vi as default editor
if [[ $(which nvim) == "/snap/bin/nvim" ]]
then
  export EDITOR="/snap/bin/nvim"
elif [[ $(which nvim) == "/bin/nvim" ]]
then
  export EDITOR="/bin/nvim"
elif [[ -e $(which vim) ]]
then
  export EDITOR="/bin/vim"
else
  export EDITOR="/bin/vi"
fi
