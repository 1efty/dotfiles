#!/usr/bin/env bash

mkdir $DOTFILES_STORAGE_PATH
cp -r rc.d/ $DOTFILES_STORAGE_PATH/rc.d/

gomplate -f templates/.gitignore -o $DOTFILES_STORAGE_PATH/.gitignore
gomplate -f templates/.gitconfig -o $DOTFILES_STORAGE_PATH/.gitconfig
gomplate -f templates/.bash_profile -o $DOTFILES_STORAGE_PATH/.bash_profile
gomplate -f templates/.bashrc -o $DOTFILES_STORAGE_PATH/.bashrc
gomplate -f templates/.zshrc -o $DOTFILES_STORAGE_PATH/.zshrc

ln -sf $DOTFILES_STORAGE_PATH/.bashrc $HOME/.bashrc
ln -sf $DOTFILES_STORAGE_PATH/.bash_profile $HOME/.bash_profile
ln -sf $DOTFILES_STORAGE_PATH/.gitignore $HOME/.gitignore
ln -sf $DOTFILES_STORAGE_PATH/.gitconfig $HOME/.gitconfig
ln -sf $DOTFILES_STORAGE_PATH/.zshrc $HOME/.zshrc
