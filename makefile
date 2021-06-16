.POSIX:

PREFIX  = $(HOME)
DEST    = $(DESTDIR)$(PREFIX)
EXCLUDE = $(patsubst %,--exclude="%", .git* *.swp makefile readme.md license)

install:
	mkdir -p "$(DEST)"
	rsync -ai $(EXCLUDE) . "$(DEST)"
