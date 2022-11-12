<h1 align=center>i3 Window Manager Config</h1>

---

## General info

This configuration uses the [vim](www.vim.org) keymaps instead of the default kaymaps for navigation

## Variables

**Terminal**: [Kitty](../kitty)
**Topbar**: [Polybar](../polybar)
**Modifier key**: `super`
**Browser**: Google Chrome
**Background**: `feh` & [picom](../picom)
**App launcher**: [rofi](../rofi)

## Keymaps

|:  keymap                                   :|:  Action                                     :|:  state  :|
| Mod+Return                                  | Open terminal                                 |    [x]    |
| Mod+Space                                   | Open Browser                                  |    [x]    |
| Mod+q                                       | Kill current app                              |    [x]    |
| Mod+{h,j,k,l}                               | move focus between windows                    |    [x]    |
| Mod+Shift+{h,j,k,l}                         | Move the focused window                       |    [x]    |
| Mod+z                                       | Split toggle                                  |    [x]    |
| Mod+f                                       | Toggle fullscreen                             |    [x]    |
| Mod+s                                       | Set layout to stacking                        |    [x]    |
| Mod+t                                       | Set layout to tabbed                          |    [x]    |
| Mod+n                                       | Set layout to split and toggle splits         |    [x]    |
| Mod+Ctrl+Space                              | Toggle between tiling and floating modes      |    [x]    |
| Mod+a                                       | Focus the parent container                    |    [x]    |
| Mod+Ctrl+{{h,Left,Shift+tab},{l,Right,Tab}} | Move backwards and forward between workspaces |    [x]    |
| Mod+Shift+r                                 | Restarts i3                                   |    [x]    |
| Mod+r                                       | Change to resize mode                         |    [x]    |
| Mod+e                                       | Opens [doom emacs](../../.doom.d)             |    [x]    |
| Mod+Ctrl+r                                  | Open [ranger](../ranger) file manager         |    [x]    |
| Mod+Ctrl+s                                  | Open Spotify                                  |    [x]    |

