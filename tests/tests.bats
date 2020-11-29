function test_directory() {
    [[ -L "${HOME}/${1}" && -d "${HOME}/${1}" ]]
}

function test_file() {
    [[ -L "${HOME}/${1}" && -f "${HOME}/${1}" ]]
}

@test "bash package is stowed" {
    test_directory .bashrc.d
    test_file .bashrc
    test_file .bash_profile
}

@test "git package is stowed" {
    test_file .gitignore
    test_file .gitconfig
}

@test "npm package is stowed" {
    test_file .npmrc
}

@test "pyenv package is stowed" {
    test_directory .pyenv
    test_directory .pyenv-plugins
}

@test "rc package is stowed" {
    test_directory .rc.d
}

@test "ssh package is stowed" {
    test_file .ssh/config
}

@test "vim package is stowed" {
    test_file .vimrc
}

@test "zsh package is stowed" {
    test_file .zshrc
    test_file .p10k.zsh
    test_directory .oh-my-zsh
    test_directory .zsh-custom
}
