all:
	ln -fs vim .vim
	ln -fs vim/vimrc .vimrc
	git submodule init
	git submodule update
