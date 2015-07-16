.PHONY all bash tmux git vim

all: bash tmux git vim
	@echo "Done!"

bash: 
	cd bash; make install

tmux:
	cd tmux; make install

git: 
	cd git; make install

vim: 
	cd vim; make install




