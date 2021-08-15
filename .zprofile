# ZSH Profile
# Patrick Nisble
# github.com/acereca
#
# Version: 2

[ -f ~/.zprofile.local ] && source ~/.zprofile.local

# PATH setup {{{
export PATH="/opt/cuda/bin/:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$HOME:/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin:/home/patrick/github/kicad-tools/bin"
# }}}

# Default programs {{{
export EDITOR=/usr/local/bin/nvim
export TERMINAL=/usr/bin/alacritty
export BROWSER=/usr/bin/brave
export READER=/usr/bin/zathura
export MANPAGER='nvim +Man!'
# }}}

# TEX {{{
export BIB=$HOME/github/ubib/ubib.bib
export TEXINPUTS=$TEXINPUTS:$HOME/github/DND5eTeX//
# }}}

# PYTHON {{{
export PYTHONPATH=$PYTHONPATH:$HOME/electronicvisions/labcontrol
#export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
# }}}

# SSH {{{
export SSH_KEY_PATH="~/.ssh/rsa_id"
export SSH_AUTH_SOCK="/tmp/.ssh-agent"
# }}}

# Clean-up {{{
export LESSHISTFILE="-"
export ZDOTDIR="$HOME/.config/zsh"
export SSB_HOME="$HOME/.config"
# }}}

# QT / GTK {{{
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_THEME=Nordic
# }}}

# KiCAD Tools
export KICAD_SYMBOL_DIR=/usr/share/kicad/library:/home/patrick/gitea/PCBs/neochain/hardware/lib
export KICAD_FOOTPRINT_DIR=/home/patrick/gitea/PCBs/neochain/hardware/lib
export KISYSMOD=/usr/share/kicad/modules
export DOCKER_NEEDS_SUDO=1

export ZDOTDIR=$HOME
