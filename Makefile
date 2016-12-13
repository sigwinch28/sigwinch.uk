TIDYCONF = tidy.cfg
MANDOCFLAGS = -T html -O fragment

MANFILES = sigwinch.7
HTMLMANFILES = 
.PHONY: all clean

all: index.html

clean:
	-rm sigwinch.7.html
	-rm index.html

sigwinch.7.html: sigwinch.7
	mandoc -T html -O fragment sigwinch.7 > ${.TARGET}.tmp
	mv ${.TARGET}.tmp ${.TARGET}

index.html: head.html sigwinch.7.html foot.html ${TIDYCONF}
	cat ${HTMLS} | tidy5 -config ${TIDYCONF} > ${.TARGET}.tmp
	mv ${.TARGET}.tmp ${.TARGET}

