FROM fedora:28

RUN dnf -y update \
    && dnf install -y file wine winetricks p7zip \
    && dnf -y clean all

ENV HOME /home/user
ENV WINEARCH win32

RUN adduser -u 1000 user \
    && mkdir -p $HOME/.wine \
    && chown -R user:user $HOME

RUN mkdir -p /extracted \
    && cd /extracted \
    && wget -q -O itunes-installer.exe \
        https://secure-appldnld.apple.com/itunes12/091-81691-20180709-C98EBAE5-D5C5-41EC-9847-A5F71D9C4437/iTunesSetup.exe \
    && chown -R user:user /extracted

RUN winetricks --self-update

USER user

RUN winetricks -q gdiplus msls31 msxml3

RUN cd /extracted/  \
    && 7za e itunes-installer.exe  \
    && msiexec /i AppleSoftwareUpdate.msi /qn \
    && msiexec /i AppleApplicationSupport.msi  /qn \
    && msiexec /i Bonjour.msi /qn \
    && msiexec /i iTunes.msi /qn \
    && rm -rf ~/.cache /extracted/*

