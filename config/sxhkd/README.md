<h1 align=center>SXHKD</h1>

---

## About

The best keymap deamon for [bspwm](../bspwm/), in this configrations it's only used in it as well.

## keymaps

| Keymap                       | Command                                                                                             | Description                                     |
|:----------------------------:|:---------------------------------------------------------------------------------------------------:|:------------------------------------------------|
| `super+shift+r`              | bspc wm -r                                                                                          | Reloads the configrations of bspwm              |
| `super+shift+q`              | qkill bspwm                                                                                         | Quits out of bspwm                              |
| `super+i`                    | bspc node -R 90                                                                                     |                                                 |
| `super+shift+i`              | bspc node -R -90                                                                                    |                                                 |
| `super+f`                    | bspc node -t {tiled, fullscreen}                                                                    | Toggle fullscreen mode                          |
| `super+ctrl+space`           | bspc node -t {tiled, fullscreen}                                                                    | Toggle fullscreen mode                          |
| `super+shift+{h,j,k,l}`      | dir={west,south,north,east}; \ bspc node -s "$dir.local" --follow \ || bspc node -m "$dir" --follow | Move window to another workspace                |
| `super+{h,j,k,l}`            | bspc node -f {west,south,north,east}                                                                | Change focus between windows                    |
| `super+shift+1-9`            | bspc {desktop --focus,node --to-desktop} 'focused:^{1-9,10}'                                        | Move focused window to a specific workspace     |
| `super+ctrl+{h,j,k,l}`       | bspc node -z {left -80 0,bottom 0 80,top 0 -80,right 80 0}                                          | Resize the windows (increase)                   |
| `super+ctrl+shift+{h,j,k,l}` | bspc node -z {right -80 0,top 0 80,bottom 0 -80,left 80 0}                                          | Resize the windows (decrease)                   |
| `super+{1-9}`                | bspc desktop -f {1, 2, 3, 4, 5, 6, 7, 8, 9}                                                         | Change the workspace to specific one            |
| `super+{Tab,shift+Tab}`      | bspc desktop -f { next, prev }                                                                      | cycle through the workspaces                    |
| `super+ctrl+d`               | discord                                                                                             | Opens discord                                   |
| `super+ctrl+w`               | $BROWSER                                                                                            | Opens the browser choised in [env](../../.env)  |
| `super+Return`               | $TERM                                                                                               | Opens the terminal choised in [env](../../.env) |
| `super+shift+Return`         | rofi -show run                                                                                      | Launch rofi for running apps                    |
| `super+ctrl+e`               | $TERM -e ranger                                                                                     | Run ranger in a terminal                        |


