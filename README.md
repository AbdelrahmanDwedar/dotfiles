<h1 align=center>Dot Files</h1>

This is the configurations for most apps that I use in Linux setup.  
This configurations is simple and straightforward, nothing too crazy or hard to use.  
**There's some personal taste in this configurations like the keys moving around `(hjkl)` and some other things**

---

## Setup

This configurations can be added step by step to your device **(Recommended to be Linux)**  

You can copy the files using `cp` command like so:  
```zsh
# for adding zsh configurations
cp .zshrc .zprofile .zshenv .zsh 
```

### Config directory

For the config directory it's different than other files, I recommend not doing the approach that I mentioned for other things as it'll delete all your other configurations in the `.config` directory (that why I named it `config` not `.config` so if you did it it doesn't effect the original one)  

Recommended approach:  
```zsh
cp config/* ~/.config
```
> Warning  
> And it'll replace the configurations that you had if the configurations were also in the apps in `config` directory.  
> If you have configurations you want to keep that also were added in `config` you have to go through the `config` directory and pick the you need exactly then use `cp` command to copy them into your `.config` directory.

---

## Used apps

- bash
- tmux
- vim
- zsh
- bashtop
- cointop
- i3 (requires `polybar` & `picom`)
- kitty (requires `picom`)
- lf
- neofetch
- neovim (submodules to [repo]())
- picom
- polybar
- powerline
- qalculate
- ranger
- rofi

---

### Bash & zsh aliases

| Alias                                     |Command      | Bash | zsh |
|:------------------------------------------|:------------|:----:|:---:|
| `emacs`                                   | `emacs -nw` | [x]  | [x] |
| `vi`, `vim`                               | `nvim`      | [x]  | [x] |
| `lv`                                      | `laravel`   | [x]  | [x] |
| `py`                                      | `python3`   | [x]  | [x] |
| `pip`                                     | `pip3`      | [x]  | [x] |
| `fl`                                      | `flutter`   | [x]  | [x] |
| `top`                                     | `bashtop`   | [x]  | [x] |
| `ra`                                      | `ranger`    | [x]  | [x] |
| `ls`, `la`, `l`, `ll`, `lt`, `lla`, `lta` | `lsd`       | [x]  | [x] |

---

## zsh plugins

- [wakatime](https://github.com/sobolevn/wakatime-zsh-plugin.git)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)
- [zsh-rust](https://github.com/cowboyd/zsh-rust) `for unabling using rustc in zsh`
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
<!-- - [zsh-auto-notify](https://github.com/MichealAquilina/zsh-auto-notify) -->
- [web-search](https://github.com/sineto/web-search)
- [zsh-copybuffer](https://github.com/guillaumeboehm/zsh-copybuffer)
- [zsh-dirhistory](https://github.com/shaunsauve/zsh-dirhistory)
- [checl-deps](https://github.com/zpm-zsh/check-deps)

---

<!-- ## NeoVim plugins -->
<!---->
<!-- - [vim-surround](https://github.com/tpope/vim-surround) -->
<!-- - [NerdTree](https://github.com/preservim/nerdtree) -->
<!-- - [vim-wakatime](https://github.com/wakatime/vim-wakatime) -->
<!-- - [vim-devicons](https://github.com/ryanoasis/vim-devicons) -->
<!-- - [Lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) `only for NeoVim` -->
<!-- - [coc.nvim](https://github.com/neoclide/coc.nvim) -->
<!-- - [awesome vim colorschemes](https://github.com/rafi/awesome-vim-color-schemes) -->
<!-- - [Vim CSS color](https://github.com/ap/vim-css-color) -->
<!-- - [vim-terminal](https://github.com/tc50cal/vim-terminal) -->
<!-- - [nvim-autopairs](https://github.com/windwp/nvim-autopairs) -->
<!-- - [presence.nvim](https://github.com/andweeb/presence.nvim) `Discord Presence` -->
<!-- - [Emmet](https://github.com/mattn/emmet-vim) -->
<!---->
<!-- --- -->

## Status of the configurations

```patch
+ zsh
+ bash
+ git
+ vim
+ tmux
+ wakatime (bash)
+ wakatime (zsh)
+ NeoVim
+ i3
- lf
+ neofetch
+ ranger
- emacs
+ kitty
```
