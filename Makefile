PLUGIN = hier

all: clean vba

${PLUGIN}.vba: README plugin/${PLUGIN}.vim
	mkdir -p doc
	cp README doc/${PLUGIN}.txt
	find doc plugin -type f | sed -e 's/^\.\/// '> files
	vim --cmd 'let g:plugin_name="${PLUGIN}"' -s build_vim

vba: ${PLUGIN}.vba

${PLUGIN}.vba.gz: ${PLUGIN}.vba
	gzip $<

vba.gz: ${PLUGIN}.vba.gz

clean:
	@rm -rf ${PLUGIN}.vba ${PLUGIN}.vba.gz doc files

.PHONY: all clean vba vba.gz
