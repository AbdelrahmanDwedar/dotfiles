# Emacs
if [[ -e ~/.emacs.d ]]; then
  alias emacs="emacs -nw"
fi

# laravel => lv
if [ -f $(which laravel) ]
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
if [ -e $(which flutter) ]
then
  alias fl=flutter
fi

# ranger => ra
if [[ -e $(which ranger) ]]
then
  alias ra=ranger
  alias lr=ranger
fi

# neofetch
if [[ -e $(which neofetch) ]]
then
  alias nf=neofetch
fi

# cpufetch
if [[ -e $(which cpufetch) ]]
then
  alias cf=cpufetch
fi

# lsd => ls
if [ -e $(which lsd) ]; then
  alias ls='lsd -F'
  alias l='lsd -F'
  alias la='lsd -AF'
  alias ll='lsd -lF'
  alias lt='lsd --tree'
  alias lla='lsd -lFA'
  alias lta='lsd --tree -A'
  alias li='lsd -Fi'
  alias lli='lsd -Fli'
  alias llia='lsd -FAli'
fi

# cd shortcuts
# alias ..='cd ..'
# alias ...="cd ../.."
# alias ....="cd ../../.."
# alias .....="cd ../../../.."
# alias ......="cd ../../../../..."
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

# confirmation for rm mv cp commands
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# auto open
alias -s conf=nvim
alias -s txt=nvim
alias -s cfg=nvim
alias -s bash=nvim
alias -s zsh=nvim
