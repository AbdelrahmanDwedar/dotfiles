# Emacs
if [[ -e ~/.emacs.d ]]; then
  alias emacs="emacs -nw"
fi

# NeoVim => vim || vi
if [[ -e $(which nvim) ]]
then
  # alias vim=nvim
  # alias vi=nvim
fi

# laravel => lv
if [[ -e $(which laravel) ]]
then
  alias lv=laravel
fi

# Python3 => py
# pip3 => pip
if [[ -e $(which python3) ]]
then
  alias py=python3
  alias pip=pip3
fi

# flutter => fl
if [[ -e $(which flutter) ]]
then
  alias fl=flutter
fi

# bashtop => top
if [[ -e $(which bashtop) ]]
then
  alias top=bashtop
fi

# ranger => ra
if [[ -e $(which ranger) ]]
then
  alias ra=ranger
fi

# neofetch
if [[ -e $(which neofetch) ]]
then
  alias nf=neofetch
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

