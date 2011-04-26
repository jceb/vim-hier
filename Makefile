PLUGIN = hier

all: clean vba

${PLUGIN}.vba.gz: README plugin/${PLUGIN}.vim
	mkdir -p doc
	cp README doc/${PLUGIN}.txt
	find doc plugin -type f | sed -e 's/^\.\/// '> files
	vim --cmd 'let g:plugin_name="${PLUGIN}"' -s build_vim && gzip ${PLUGIN}.vba

vba: ${PLUGIN}.vba.gz

clean:
	@rm -rf ${PLUGIN}.vba.gz ${PLUGIN}.vba doc files

.PHONY: all clean vba
