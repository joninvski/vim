 .PHONY : all basic spell


all: basic spell

basic:
	ln   -fs   `pwd`         ${HOME}/.vim
	ln   -fs   `pwd`/vimrc   ${HOME}/.vimrc
	git clone https://github.com/gmarik/vundle.git ${HOME}/.vim/bundle/vundle
	vim +BundleInstall +qall

spell:
	wget "http://natura.di.uminho.pt/download/sources/Dictionaries/hunspell/LATEST/hunspell-pt_PT-latest.tar.gz" -O hunspell-pt_PT-latest.tar.gz
	mkdir -p hunspell_temp
	tar -xvzf hunspell-pt_PT-latest.tar.gz --directory=hunspell_temp
	@echo "############################################################"
	@echo "Creating pt spell file. This may take a few minutes!"
	cd hunspell_temp/hunspell*; vim -c "silent mkspell! pt pt_PT" -c q >&- 2>&-
	mv hunspell_temp/hunspell-pt_PT-20130622/pt.utf-8.spl spell/pt.utf-8.spl
	rm -rf hunspell_temp hunspell-pt_PT-latest.tar.gz
	echo "Finished creating the spell file"
