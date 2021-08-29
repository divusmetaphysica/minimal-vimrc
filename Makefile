FTPLUGIN   := .vim/after/ftplugin
DOTVIM     := ./.vim
DOTVIMRC   := ./.vim/init.vim
FOURSPACES := $(addprefix $(FTPLUGIN)/,$(addsuffix .vim,python rust go))
TWOSPACES  := $(addprefix $(FTPLUGIN)/,$(addsuffix .vim,c c++ lua javascript typescript))

all: $(DOTVIM) $(DOTVIMRC) langstyles 
.PHONY: all clean langstyles

$(DOTVIM):
	ln -s $(abspath .vim) $@

$(DOTVIMRC):
	ln -s $(abspath .vimrc) $@

clean:
	unlink $(DOTVIM)
	rm -fr .vim/
	unlink $(DOTVIMRC)

ftplugins:
	mkdir -p $(FTPLUGIN)

langstyles: ftplugins $(TWOSPACES) $(FOURSPACES)

$(TWOSPACES):
	touch $@
	echo "setlocal expandtab" >> $@
	echo "setlocal shiftwidth=2" >> $@
	echo "setlocal softtabstop=2" >> $@

$(FOURSPACES):
	touch $@
	echo "setlocal expandtab" >> $@
	echo "setlocal shiftwidth=4" >> $@
	echo "setlocal softtabstop=4" >> $@
