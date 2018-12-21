DOTFILES_DIR := $(shell pwd)
DIRLIST := .vim/autoload .vim/ftplugin 
.vim/after .config/rofi .config/ranger .config/i3 .config/kitty
FILELIST := \
	.bashrc \
	.gitconfig \
	.pinerc \
	.vimrc \
	.Xdefaults \
	.zprofile \
	.zshrc \
	.oh-my-zshrc \
	.oh-my-zsh/themes/bgnoster.zsh-theme


all: $(DIRLIST)

$(DIRLIST):
	@echo $(DIRLIST)
	ln -sfvi "$(DOTFILES_DIR)/$@" $$HOME/$(dir $@)

