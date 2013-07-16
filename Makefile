all:
	ln -fs `pwd`/vim ${HOME}/.vim
	ln -fs `pwd`/vim/vimrc ${HOME}/.vimrc
	git clone https://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/vundle
