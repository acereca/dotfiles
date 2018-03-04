# AcerecA's dotfiles
# make install

DOTFILESDIR = ${PWD}
HOMEDIR     = ~

DIRECTLINKS = .bashrc \
	      .gitconfig \
	      .livestreamerrc \
	      .vimrc \
	      .Xdefaults \
	      .zshrc \
	      .zprofile \
	      .pinerc

CONFIGLINKS = i3 \
	      ranger \

# TODO: .rofirc ssh/config

install:
	@echo linking dotfiles from ${DOTFILESDIR} to ${HOMEDIR}
	@echo 
	@printf " $(foreach file,$(DIRECTLINKS),ln ${DOTFILESDIR}/${file} ${HOMEDIR}/${file}\n)"
	
	@$(foreach file,$(DIRECTLINKS),ln ${DOTFILESDIR}/${file} ${HOMEDIR}/${file}\n)
