
etc_files=etc/vim/vimrc.local
home_files=.vim/syntax/c.tpl.vim
home_files+=.vim/syntax/texitpl.vim
home_files+=.vim/syntax/explog.vim
home_files+=.vim/ftdetect/texi.tpl.vim
home_files+=.vim/ftdetect/c.tpl.vim
home_files+=.vim/ftdetect/h.tpl.vim
home_files+=.vim/ftdetect/exp.log.vim

home_files_diff=$(addsuffix -diff,$(home_files))
etc_files_diff=$(addsuffix -diff,$(etc_files))

all: $(home_files) $(etc_files)

.PHONY:$(home_files)
$(home_files):
	cp home/$@ ~/$@

.PHONY:$(etc_files)
$(etc_files):
	sudo cp $@ /$@

diff: $(home_files_diff) $(etc_files_diff)

$(home_files_diff):
	diff home/$(@:%-diff=%) ~/$(@:%-diff=%)

$(etc_files_diff):
	diff $(@:%-diff=%) /$(@:%-diff=%)

