install:
	rsync -avz $(PWD)/ ~/.emacs.d/ged/ --delete --exclude .git
