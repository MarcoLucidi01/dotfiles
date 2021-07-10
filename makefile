.POSIX:

PREFIX = $(HOME)
DEST   = $(DESTDIR)$(PREFIX)
IGNORE = \.git.*|.*\.swp|nohome|makefile|readme\.md|license
STOW   = stow --verbose --no-folding --ignore="$(IGNORE)" --target="$(DEST)"

install:
	mkdir -p "$(DEST)"
	$(STOW) .

uninstall:
	$(STOW) --delete .

# should be used to remove default dotfiles like .bashrc on fresh installs,
# otherwise stow will fail if some file already exist.
force-uninstall:
	find . -type f | grep -Ev "$(IGNORE)" | sed -e 's#^\./##' -e 's#^#$(DEST)/#' | xargs rm -vf
