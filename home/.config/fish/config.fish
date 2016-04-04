# Path to Oh My Fish install.
set -gx OMF_PATH "/home/martin/.local/share/omf"

# Customize Oh My Fish configuration path.
#set -gx OMF_CONFIG "/home/martin/.config/omf"

# Set path to z script
[ -x /home/martin/bin/z.sh ]; and set -g Z_SCRIPT_PATH /home/martin/bin/z.sh

# Load oh-my-fish configuration.
source $OMF_PATH/init.fish
