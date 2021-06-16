.POSIX:

PREFIX  = $(HOME)
DEST    = $(DESTDIR)$(PREFIX)
EXCLUDE = $(patsubst %,--exclude="%", .git* *.swp nohome makefile readme.md license)

install:
	mkdir -p "$(DEST)"
	rsync -ai $(EXCLUDE) . "$(DEST)"
