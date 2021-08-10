install:
	@echo "Completed installation of dotfiles"

# VIM
install: $(HOME)/.vimrc
$(HOME)/.vimrc: vimrc
	echo source $(shell pwd)/$< >> $@

# ZSH
install: $(HOME)/.zshrc
$(HOME)/.zshrc: zshrc
	echo source $(shell pwd)/$< >> $@