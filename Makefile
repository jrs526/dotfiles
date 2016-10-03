install:
	@echo "Completed installation of dotfiles"

install: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf: tmux.conf
	-rm $@
	ln -s $(shell pwd)/$< $@

install: $(HOME)/.vimrc
$(HOME)/.vimrc: vimrc ~/.vim/bundle/Vundle.vim
	-rm $@
	ln -s $(shell pwd)/$< $@
	vim +PluginInstall +qall

$(HOME)/.vim/bundle/Vundle.vim:
	mkdir -p $(@D)
	git clone https://github.com/VundleVim/Vundle.vim.git $@

