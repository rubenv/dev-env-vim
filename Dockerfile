FROM fedora

RUN dnf -y install git bash-completion which && \
    dnf -y install dnf-plugins-core && \
    dnf -y copr enable dperson/neovim && \
    dnf -y install neovim && \
    dnf clean all

ADD dotfiles/ /root/

CMD bash
