all:
	ln -fs vim .vim
	ln -fs vim/vimrc .vimrc
	git submodule init
	git submodule update
	sudo aptitude install ruby1.9.1-dev ruby-dev #For command-t plugin
