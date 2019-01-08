## dotfiles

Managed using [GNU Stow](http://www.gnu.org/software/stow/) with inspiration from [xero's dotfiles](https://github.com/xero/dotfiles).

#### Things

1. powerline fonts
2. zsh completion for `conda`
3. zsh theme showing which `conda env` you are on

#### Installation

1. Fork
2. Clone your fork to `~/dotfiles`
3. `git submodule update`
4. Install `stow`
5. Edit configs as needed

The `dotfiles` require that you already have `stow`, `pygmentize`, and `oh-my-zsh` installed. The `oh-my-zsh` theme requires Powerline fonts:

```
cd ~/dotfiles
stow fonts
sudo fc-cache -fv
```

The `zsh` config requires that the `conda` plugin for `zsh` is installed:

```
cd ~/dotfiles
stow conda
```

Then go ahead and get crazy:

```
cd ~/dotfiles
stow zsh
stow tmux
```

That is probably all you want to do without customizing the other `dotfiles` for your own environment.

## Rofi

`stow rofi`
`stow check`
`cd ~/check`
`firefox https://github.com/libcheck/check#installation`
`cd ~/rofi`
`firefox https://github.com/DaveDavenport/rofi/blob/next/INSTALL.md#install-a-checkout-from-git`

## Polybar

Requires:

* https://github.com/acrisci/playerctl

`cd polybar/polybar`
`git submodule init`
`git submodule update`
`cd ..`
`cd ..`
`git stow polybar`
`cd ~/polybar`
`mkdir build`
`cd build`
`cmake ..`
`sudo make install`


## tmux

Uses [tpm](https://github.com/tmux-plugins/tpm) for plugin management

Install: `prefix + I`
Update: `prefix + U`


## nvim

Uses [vim-plug](https://github.com/junegunn/vim-plug) for plugin management

Install: `:PlugInstall`
Update: `:PlugUpdate`
