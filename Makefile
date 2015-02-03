
#etc_files=etc/vim/vimrc.local
home_files=.vimrc
home_files+=.vim/syntax/c.tpl.vim
home_files+=.vim/syntax/texitpl.vim
home_files+=.vim/syntax/explog.vim
home_files+=.vim/ftdetect/texi.tpl.vim
home_files+=.vim/ftdetect/c.tpl.vim
home_files+=.vim/ftdetect/h.tpl.vim
home_files+=.vim/ftdetect/exp.log.vim
home_files+=.vim/plugin/grep.vim

home_files_diff=$(addsuffix -diff,$(home_files))
etc_files_diff=$(addsuffix -diff,$(etc_files))
home_files_clean=$(addsuffix -clean,$(home_files))

all: $(home_files) $(etc_files) fugitive

.PHONY:$(home_files)
$(home_files):
	mkdir -p $(dir ~/$@)
	cp home/$@ ~/$@

.PHONY:$(etc_files)
$(etc_files):
	sudo cp $@ /$@

diff: $(home_files_diff) $(etc_files_diff)

$(home_files_diff):
	diff home/$(@:%-diff=%) ~/$(@:%-diff=%)

$(etc_files_diff):
	diff $(@:%-diff=%) /$(@:%-diff=%)

fugitive: pathogen 
	git clone git://github.com/tpope/vim-fugitive.git ~/.vim/bundle/vim-fugitive
	vim -u NONE -c "helptags ~/.vim/bundle/vim-fugitive/doc" -c q

pathogen:
	mkdir -p ~/.vim/autoload ~/.vim/bundle
	curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim	

clean: pathogen-clean $(home_files_clean)

pathogen-clean: fugitive-clean 
	rm ~/.vim/autoload/pathogen.vim
	rmdir ~/.vim/autoload ~/.vim/bundle

fugitive-clean:
	rm -rf ~/.vim/bundle/vim-fugitive

$(home_files_clean):
	echo rm ~/$(@:%-clean=%)
