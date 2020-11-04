# dotfiles

My dotfiles, managed using [GNU Stow][].

## About

### Templates

I utilize [hairyhenderson/gomplate][] as a template engine for files that would be better off being dynamic. At some point this could be expanded to include a config file

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
