source ~/bin/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundles <<EOBUNDLES
  archlinux
  autojump
  bundler
  capistrano
  command-not-found
  docker
  git
  github
  gitignore
  #gpg-agent
  history
  lol
  last-working-dir
  per-directory-history
  rails
  rake
  rbenv
  ruby
  sudo
  #vi-mode
  web-search
  z

  # Experimental
  dircycle
  #dirhistory
  git-remote-branch
  #history-substring-search

  # Syntax highlighting bundle.
  zsh-users/zsh-syntax-highlighting
EOBUNDLES

# Load the theme.
antigen theme agnoster
#antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# Attach to a running docker container using "dock-attach <CONTAINER ID OR NAME>^
dock_attach() {
  local name_or_cid=$1
  local pid=$(sudo docker inspect --format='{{.State.Pid}}' $name_or_cid)
  sudo nsenter --target $pid --mount --uts --ipc --net --pid /bin/bash
}
alias dock-attach=dock_attach

# Fix vim colors in tmux
alias tmux="tmux -2"
