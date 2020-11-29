# dotfiles

My dotfiles, managed with [GNU Stow][].

## About

### Packages

> [GNU Stow] is a symlink farm manager which takes distinct packages of software and/or data located in separate directories on the filesystem, and makes them appear to be installed in the same place. For example, /usr/local/bin could contain symlinks to files within /usr/local/stow/emacs/bin, /usr/local/stow/perl/bin etc., and likewise recursively for any other subdirectories such as .../share, .../man, and so on.

For this use-case, the contents of each **package** (located in `packages/`) is sym-linked by [GNU Stow] into `$HOME`.

### Templates

[hairyhenderson/gomplate][] is utilized as a template engine for files that require some modifications before being installed by [GNU Stow]. At some point this could be expanded upon to include a config file.

## Getting Started

### Requirements

Before using this project, make sure the following are installed:

- git
- BASH
- [GNU Make][]
- [GNU Stow][]
- [hairyhenderson/gomplate][]

### Installation

Clone this repository and it's sub-modules:

```bash
git clone --recursive https://github.com/1efty/dotfiles
```

Execute the `stow` make target:

```bash
make stow
```

> This runs `install.sh` which utilizes [GNU Stow][] to sym-link the package directories (and their contents) into your `$HOME` directory.

If you do not have [GNU Make][]:

```bash
bash install.sh stow
```

### Removal

Execute the `unstow` make target:

```bash
make unstow
```

If you do not have [GNU Make][]:

```bash
bash install.sh unstow
```

## Development

### Requirements

Same as above, but a few more tools are required.

- Docker Compose (or podman-compose)
- bats

### End-To-End Testing

There is a `docker-compose.test.yml` that can be used to perform an end-to-end test of this project.

```bash
make test
```

### Verify Local Installation

```bash
make verify
```

## Ignored Files

By default, [GNU Stow] ignores the following

```gitignore
# Comments and blank lines are allowed.

RCS
.+,v

CVS
\.\#.+       # CVS conflict files / emacs lock files
\.cvsignore

\.svn
_darcs
\.hg

\.git
\.gitignore

.+~          # emacs backup files
\#.*\#       # emacs autosave files

^/README.*
^/LICENSE.*
^/COPYING
```

> `NOTE:` If a `.stow-local-ignore` is present in a package, the default ignore list is ignored.

<!-- references -->
[GNU Stow]: <https://www.gnu.org/software/stow/>
[GNU Make]: <https://www.gnu.org/software/make/>
[CloudPosse Build-Harness]: <https://github.com/cloudposse/build-harness>
[hairyhenderson/gomplate]: <https://github.com/hairyhenderson/gomplate>
