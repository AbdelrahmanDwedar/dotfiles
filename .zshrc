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

# set the prompt if powerline doesn't exist
source ~/.zsh/prompt.zsh

# Powerline configuration
if [ -f /usr/share/powerline/zsh/powerline.zsh ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  source /usr/share/powerline/zsh/powerline.zsh
fi

# Add Flutter to the $PATH
export PATH="$PATH:$HOME/flutter/bin"

# Load Angular CLI autocompletion.
source <(ng completion script)

export PATH="$PATH:$HOME/.config/composer/vendor/bin"

export PATH=$PATH:$HOME/.emacs.d/doom/bin

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
if [ -d "$HOME/.emacs.d/bin" ] ; then
    PATH="$HOME/.emacs.d/bin:$PATH"
fi

