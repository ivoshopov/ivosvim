
home_files=.vim/syntax/c.tpl.vim
home_files+=.vim/syntax/texitpl.vim
home_files+=.vim/syntax/explog.vim


all: $(home_files)

$(home_files):
	cp home/$@ ~/$@
