source ~/.config/fish/functions/*.fish

# Workaround for fish <2.3.0. See https://github.com/fisherman/z#notes
for file in ~/.config/fish/conf.d/*.fish
  source $file
end
