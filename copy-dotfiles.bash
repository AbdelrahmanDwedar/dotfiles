for dotfiles_file in $(ls -A .)
do
  if [[ -f $dotfiles_file ]]
  then
    if [[ $dotfiles_file != ".gitmodules" && $dotfiles_file != "README.md" && $dotfiles_file != "copy-dotfiles.bash" && $dotfiles_file != "update-dotfiles.bash" && $dotfiles_file != ".git" ]] 
    then
      cp $dotfiles_file ~
    elif [[ $dotfiles_file == ".gitmodules" ]]
    then
      echo "Please input your git user.name"
      read username
      echo "Enter your git user.email"
      read useremail

      echo "[user]
    name = $username
    email = $useremail" > ~/.gitconfig

      cat ./.gitconfig >> ~/.gitconfig
    fi
  elif [[ -d $dotfiles_file ]] 
  then
    if [[ $dotfiles_file != ".git" && $dotfiles_file != "config" ]]
    then
      cp -r ./$dotfiles_file ~/
    elif [[ $dotfiles_file == "config" ]]
    then
      cp -r ./config/* ~/.config/
    fi
  fi
done
