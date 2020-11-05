# dotfiles

My dotfiles, managed with [GNU Stow][].

## About

### Packages

[GNU Stow] is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place. For example, /usr/local/bin could contain symlinks to files within /usr/local/stow/emacs/bin, /usr/local/stow/perl/bin etc., and likewise recursively for any other subdirectories such as .../share, .../man, and so on.

For this use-case, the contents of each **package** (located in `packages/`) is symlinked by [GNU Stow] into `$HOME`.

### Templates

[hairyhenderson/gomplate][] is utilized as a template engine for files that require some modifications before being installed by [GNU Stow]. At some point this could be expanded upon to include a config file.

## Getting Started

### Requirements

Before using this project, make sure the following are installed:

- git
- [GNU Make][]
- [GNU Stow][]
- [hairyhenderson/gomplate][]

### Installation

Clone this repository and it's sub-modules.

```bash
git clone --recursive https://github.com/1efty/dotfiles
```

Execute the `install` make target. This simply runs `install.sh` which uses [GNU Stow][] to link the various package directories (and it's contents) into your `$HOME` directory.

```bash
make install
```

### Removal

Execute the `uninstall` make target.

```bash
make uninstall
```

<!-- references -->
[GNU Stow]: <https://www.gnu.org/software/stow/>
[GNU Make]: <https://www.gnu.org/software/make/>
[CloudPosse Build-Harness]: <https://github.com/cloudposse/build-harness>
[hairyhenderson/gomplate]: <https://github.com/hairyhenderson/gomplate>
