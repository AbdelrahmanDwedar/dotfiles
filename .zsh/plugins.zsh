source ~/.zsh/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting

antigen bundle zpm-zsh/check-deps

antigen bundle sobolevn/wakatime-zsh-plugin

antigen bundle sineto/web-search

antigen bundle zsh-users/zsh-autosuggestions

antigen bundle zsh-users/zsh-completions

antigen bundle guillaumeboehm/zsh-copybuffer

antigen bundle shaunsauve/zsh-dirhistory

antigen bundle zsh-users/zsh-history-substring-search

antigen bundle Cloudstek/zsh-plugin-appup

antigen bundle jeffreytse/zsh-vi-mode

antigen bundle ubuntu/microk8s
antigen bundle medyagh/minikube-oh-my-zsh


antigen bundle ohmyzsh/ohmyzsh@master plugins/docker
antigen bundle ohmyzsh/ohmyzsh@master plugins/docker-compose
antigen bundle ohmyzsh/ohmyzsh@master plugins/docker-machine
antigen bundle ohmyzsh/ohmyzsh@master plugins/colored-man-pages
antigen bundle ohmyzsh/ohmyzsh@master plugins/colorize
antigen bundle ohmyzsh/ohmyzsh@master plugins/dirhistory
antigen bundle ohmyzsh/ohmyzsh@master plugins/kubectl
antigen bundle ohmyzsh/ohmyzsh@master plugins/screen


antigen apply
