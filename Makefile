FTPLUGIN   := .vim/after/ftplugin
DOTVIM     := ${HOME}/.vim
DOTVIMRC   := ${HOME}/.vimrc
TABBED     := $(addprefix $(FTPLUGIN)/,$(addsuffix .vim,go))
SPACE4 := $(addprefix $(FTPLUGIN)/,$(addsuffix .vim,python rust))
SPACE2  := $(addprefix $(FTPLUGIN)/,$(addsuffix .vim,c c++ lua javascript typescript))

all: $(DOTVIM) $(DOTVIMRC) langstyles 
.PHONY: all clean langstyles

$(DOTVIM):
	ln -s $(abspath .vim) $@

$(DOTVIMRC):
	ln -s $(abspath .vimrc) $@

clean:
	unlink $(DOTVIM)
	rm -fr ${HOME}/.vim/
	unlink $(DOTVIMRC)

ftplugins:
	mkdir -p $(FTPLUGIN)

langstyles: ftplugins $(SPACE2) $(SPACE4) $(TABBED)

$(SPACE2):
	touch $@
	echo "setlocal expandtab" >> $@
	echo "setlocal shiftwidth=2" >> $@
	echo "setlocal softtabstop=2" >> $@

$(SPACE4):
	touch $@
	echo "setlocal expandtab" >> $@
	echo "setlocal shiftwidth=4" >> $@
	echo "setlocal softtabstop=4" >> $@

$(TABBED):
	touch $@
	echo "setlocal shiftwidth=4" >> $@
	echo "setlocal softtabstop=4" >> $@
