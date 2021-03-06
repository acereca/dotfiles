# ZSH Profile
# Patrick Nisble
# github.com/acereca
#
# Version: 2

[ -f ~/.zprofile.local ] && source ~/.zprofile.local

# PATH setup {{{
export PATH="/opt/cuda/bin/:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:$HOME:/bin:$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin"
# }}}

# Default programs {{{
export EDITOR=/usr/bin/nvim
export TERMINAL=/usr/bin/alacritty
export BROWSER=/usr/bin/brave
export READER=/usr/bin/zathura
# }}}

# TEX {{{
export BIB=$HOME/github/ubib/ubib.bib
export TEXINPUTS=$TEXINPUTS:$HOME/github/DND5eTeX//
# }}}

# PYTHON {{{
export PYTHONPATH=$PYTHONPATH:$HOME/electronicvisions/labcontrol
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
export GTK_THEME=Matcha-dark-azul
# }}}

export ZDOTDIR=$HOME
