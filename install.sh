#!/bin/sh
ver="0.8.5"
wget https://dl.suckless.org/st/st-$ver.tar.gz
tar -xf st-$ver.tar.gz
rm st-$ver.tar.gz
cd st-$ver

# wget https://st.suckless.org/patches/universcroll/st-universcroll-0.8.4.diff
# git apply st-universcroll-0.8.4.diff
# wget https://st.suckless.org/patches/universcroll/st-universcroll-example-0.8.4.diff
# git apply st-universcroll-example-0.8.4.diff

instp () { 
    wget https://st.suckless.org/patches/scrollback/$1
    git apply $1
}

instp "st-scrollback-0.8.5.diff"
instp "st-scrollback-mouse-20220127-2c5edf2.diff"
instp "st-scrollback-mouse-altscreen-20220127-2c5edf2.diff"

# cp config.def.h config.h
make clean ; make