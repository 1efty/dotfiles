# dotfiles

Shell configuration `conf.d` style.

## Getting Started

### Requirements

Before using this project, make sure the following are installed:

- git
- make

### Installation

Initialize the [CloudPosse Build-Harness](https://github.com/cloudposse/build-harness)

```bash
make init
```

Run `install` make target

```bash
make installl
```

### Removal

Execute the `uninstall` make target

```bash
make uninstall
```

## Including Configuration Outside of this Project

Create `~/.dotfiles.d` directory and place `.sh` files you want to include.
