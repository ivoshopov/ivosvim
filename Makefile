
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
home_files+=.vim/plugin/yaifa.vim

home_files_diff=$(addsuffix -diff,$(home_files))
etc_files_diff=$(addsuffix -diff,$(etc_files))
home_files_clean=$(addsuffix -clean,$(home_files))

all: $(home_files) $(etc_files) vundle

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


vundle:
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

clean: vundle-clean $(home_files_clean)

vundle-clean:
	-rm -rf ~/.vim/bundle/

$(home_files_clean):
	-rm ~/$(@:%-clean=%)
