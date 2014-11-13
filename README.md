This repository can be used with [Homesick](https://github.com/technicalpickles/homesick).

## Software needed

* For the ZSH config to work to work, [Antigen](http://antigen.sharats.me/) needs to be installed.
* For Powerline support in ZSH, tmux and Vim, [Powerline](https://github.com/Lokaltog/powerline) needs to be installed (including the fonts).
* For the VIM plugins to work, you need to install [NeoBundle](https://github.com/Shougo/neobundle.vim).

On Arch Linux, the requirements can be installed easily using [yaourt](https://wiki.archlinux.org/index.php/Yaourt):

    yaourt -S antigen-git
    yaourt -S python2-powerline-git

Install NeoBundle:

     mkdir -p ~/.vim/bundle
     git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
