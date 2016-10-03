install:
	@echo "Completed installation of dotfiles"

python_packages:
	sudo pip install powerline-status

install: $(HOME)/.tmux.conf
$(HOME)/.tmux.conf: tmux.conf
	-rm $@
	ln -s $(shell pwd)/$< $@

install: $(HOME)/.vimrc
$(HOME)/.vimrc: vimrc ~/.vim/bundle/Vundle.vim python_packages
	-rm $@
	ln -s $(shell pwd)/$< $@
	vim +PluginInstall +qall
	cd $(HOME)/.vim/bundle/YouCompleteMe && ./install.py --clang-completer --tern-completer --gocode-completer
	cd $(HOME)/.vim/bundle/tern_for_vim && npm i

$(HOME)/.vim/bundle/Vundle.vim:
	mkdir -p $(@D)
	git clone https://github.com/VundleVim/Vundle.vim.git $@

install: $(HOME)/.tern-config
$(HOME)/.tern-config: tern-config
	-rm $@
	ln -s $(shell pwd)/$< $@
