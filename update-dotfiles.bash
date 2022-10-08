#!/bin/bash

for home_file in $(ls -A ~)
do
  for dotfiles_file in $(ls -A .)
  do
    if [[ -f $dotfiles_file ]]
    then
      if [[ $dotfiles_file == $home_file && $home_file != ".gitconfig" ]]
      then
        cp ~/$home_file .
      elif [[ $home_file != ".gitconfig" ]]
      then
        sed -n '4, 100p' ~/.gitconfig > ./.gitconfig
      fi
    else
      if [[ $dotfiles_file == $home_file && $home_file != ".config" && $home_file != ".zsh" ]]
      then
        cp -r ~/$home_file .
      elif [[ $dotfiles_file == "config" ]]
      then
        for dotfiles_config_file in $(ls -A ./config)
          do
            if [[ -d $dotfiles_config_file ]]
            then
              if [[ $dotfiles_config_file == $home_config_file ]]
              then
                cp ~/.config/$home_config_file ./config/
              fi
            else
              if [[ $dotfiles_config_file == $home_config_file && $dotfiles_config_file != "nvim" ]]
              then
                cp -r ~/.config/$home_config_file ./config
              fi
            fi
        done
      elif [[ $dotfiles_file == ".zsh" ]]
      then
        cp -r ~/.zsh/history.zsh ./.zsh
        cp -r ~/.zsh/aliases.zsh ./.zsh
        cp -r ~/.zsh/bindings.zsh ./.zsh
        cp -r ~/.zsh/plugins.zsh ./.zsh
        cp -r ~/.zsh/vim.zsh ./.zsh
        # TODO: make the plugins of zsh handler
      fi
    fi
  done
done

git submodule init
