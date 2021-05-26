ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

# add project dependencies
RUN apk add --no-cache bash bats coreutils findutils git gomplate make shadow stow zsh

# add some utilities
RUN apk add --no-cache ncurses openssh

# setup user to install dotfiles for
ENV HOME="/home/dotfiles"

RUN mkdir -p $HOME
RUN useradd dotfiles

# pass make check
RUN rm -rf $HOME/.bashrc ${HOME}/.bash_profile && \
    mkdir -p $HOME/.ssh $HOME/.local/share/fonts

# copy source
COPY . /home/dotfiles/src
RUN chown -R dotfiles.dotfiles $HOME

USER dotfiles
WORKDIR /home/dotfiles/src
RUN make submodules stow
ENTRYPOINT [ "/bin/zsh" ]
