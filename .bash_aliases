# ██████╗  █████╗ ███████╗██╗  ██╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║
# ██████╔╝███████║███████╗███████║
# ██╔══██╗██╔══██║╚════██║██╔══██║
# ██████╔╝██║  ██║███████║██║  ██║
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

#  █████╗ ██╗     ██╗ █████╗ ███████╗███████╗███████╗
# ██╔══██╗██║     ██║██╔══██╗██╔════╝██╔════╝██╔════╝
# ███████║██║     ██║███████║███████╗█████╗  ███████╗
# ██╔══██║██║     ██║██╔══██║╚════██║██╔══╝  ╚════██║
# ██║  ██║███████╗██║██║  ██║███████║███████╗███████║
# ╚═╝  ╚═╝╚══════╝╚═╝╚═╝  ╚═╝╚══════╝╚══════╝╚══════╝


# Python3 => py
# pip3 => pip
if [[ -f $(which python3) ]]
then
  alias py=python3
  alias pip=pip3
fi

# ranger => ra
if [[ -f $(which ranger) ]]
then
  alias ra=ranger
fi

# lsd => ls
if [ -e /bin/lsd ]; then
  alias ls='lsd -F'
  alias l='lsd -F'
  alias la='lsd -AF'
  alias ll='lsd -lF'
  alias lt='lsd --tree'
  alias lla='lsd -lFA'
  alias lta='lsd --tree -A'
fi

# cd shortcuts
alias ..='cd ..'
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../..."
alias .1="cd .."
alias .2="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."

# mkdir to mkdir -p
alias mkdir="mkdir -p"

# kitty kittens
if [[ -e $(which kitty) ]]
then
  alias icat='kitty +kitten icat'
  alias unicode='kitty +kitten unicode_input'
  alias keys='kitty +kitten show_key'
fi

# confirmation
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
