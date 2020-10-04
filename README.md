# dotfiles

My dotfiles, managed using [GNU Stow][].

## About

### Templates

I utilize [gomplate][] as a template engine for pesky files that would be better off being dynamic. For example, `git` doesn't perform shell-expansion on values within it's `.gitconfig` files, and I'd rather not share my filesystem layout with the world, so I turned it into a simple template that will generate the proper value at install-time. This also means that, at some point in the future, this entire repository could be tailored around a config file. This could then allow for user-specific configuration for things like `$ZSH_THEME`.

## Getting Started

### Requirements

Before using this project, make sure the following are installed:

- git
- [GNU Make][]
- [GNU Stow][]
- [gomplate][] - This is handled by [CloudPosse Build-Harness][]

### Installation

Clone this repository and it's sub-modules.

```bash
git clone --recursive https://github.com/1efty/dotfiles
```

Initialize the [CloudPosse Build-Harness][]. This adds a plethora of Makefiles that are in some cases used to install some dependencies.

```bash
make init
```

Execute the `install` make target. This simply runs `install.sh` which uses [GNU Stow][] to sym-link the various package directories into your `$HOME`.

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
[gomplate]: <https://github.com/hairyhenderson/gomplate>
