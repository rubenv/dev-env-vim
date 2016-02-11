FROM fedora

RUN dnf -y install git bash-completion which && \
    dnf -y install dnf-plugins-core && \
    dnf -y copr enable dperson/neovim && \
    dnf -y install neovim && \
    dnf -y install python-pip python-devel gcc redhat-rpm-config && \
    pip install neovim && \
    dnf -y remove python-devel gcc redhat-rpm-config
    dnf clean all

ADD dotfiles/ /root/

CMD bash
