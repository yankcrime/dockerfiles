FROM fedora:28

RUN dnf -y update \
    && dnf install -y file wine winetricks p7zip \
    && dnf -y clean all

ENV HOME /home/user
ENV WINEARCH win32
RUN adduser -u 1001 user \
        && mkdir -p $HOME/.wine \
        && chown -R user:user $HOME

RUN mkdir -p /extracted \
    && cd /extracted && wget -q -O itunes-installer.exe https://secure-appldnld.apple.com/itunes12/091-81691-20180709-C98EBAE5-D5C5-41EC-9847-A5F71D9C4437/iTunesSetup.exe \
    && chown -R user:user /extracted

RUN winetricks --self-update

USER user

# RUN su user -c "winetricks gdiplus msls31 msxml3"

# Last mile installation, needs GUI
# winecfg - set it to Windows 7
# winetricks ie8
# winetricks msxml3
# winetricks msls31
# cd /extracted/
# 7za e itunes-installer.exe 
# msiexec /i AppleSoftwareUpdate.msi 
# msiexec /i AppleApplicationSupport.msi 
# msiexec /i AppleApplicationSupport.msi 
# msiexec /i Bonjour.msi 
# msiexec /i iTunes.msi 
# Then exit and commit this with docker commit itunes itunes:installed

# And the shell script to start it:
# #!/usr/bin/env bash
# docker run -it --rm --name itunes \
#        -e DISPLAY=$DISPLAY \
#        -v /tmp/.X11-unix:/tmp/.X11-unix \
#        --device /dev/snd --group-add audio \
#        itunes:installed \
#        wine /home/user/.wine/drive_c/Program\ Files/iTunes/iTunes.exe 
 