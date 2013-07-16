all:
	ln   -fs   `pwd`         ${HOME}/.vim
	ln   -fs   `pwd`/vimrc   ${HOME}/.vimrc
	git clone https://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/vundle
	vim +BundleInstall +qall
