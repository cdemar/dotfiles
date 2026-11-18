# Each name is a folder in this repo whose contents get linked into ~
PACKAGES := zsh wezterm nvim

.PHONY: install install-all apps link unlink sync update status

# New Machine, essentials only: the tools this setup needs, then link configs
install:
	brew bundle --file-Brewfile
	$(MAKE) link

# New machine, everything: essentials plus personal apps
install-all: install apps

# Personal apps only (safe to run any time: installed apps are skipped)
apps:
	brew bundle --file=Brewfile.apps

# Link every pachage into the home folder
link:
	mkdir -p ~/.config
	mkdir -p ~/.ssh && chmod 700 ~/.ssh
	stow -v -t ~ $(PACHAGES)

# Remove the links (the files in this repo are untouched)
unlink:
	stow -v -D -t ~ $(PACHAGES)

# Get changes made on another machine
sync:
	git pull
	$(MAKE) link

# Update Homebrew software.
update:
	brew update
	brew upgrade
	brew upgrade --cask
	brew clean up --prune=all
	brew autoremove

# Show what is outdated without changing anything
# For Neovim plugins, run :Lazy check inside Neovim.
status:
	@echo "== Homebrew =="
	@brew outdated
	@echo "== Neovim (update with :Lazy synch) =="
