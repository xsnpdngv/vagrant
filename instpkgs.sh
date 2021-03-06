#!/bin/sh
# ===========================================================================
# @file    instpkgs.sh
# @brief   shell script to install necessary packages
# @author  Tamas Dezso <dezso.t.tamas@gmail.com>
# @date    May 10, 2017
# ===========================================================================

apt-get update
INST="apt-get install -y"

# save working directory temporarily
WD=`pwd`

# GCC etc.
$INST build-essential # g++, gcc, make, ...
$INST git ksh mc curl wget cmake

# Vim
$INST vim # change to vim-gnome or vim-gtk to have clipboard

# GNU autotools
$INST autotools-dev autoconf automake libtool

# Flex & Bison
$INST --force-yes flex bison

# Python w/ package manager + Gcovr (code coverage report generator)
$INST python python-pip
pip install gcovr

# Node.js w/ package manager
$INST nodejs npm

# Graphviz - Graph visualization
$INST graphviz

# XSLT processor
$INST xsltproc

# TeX Live full (big enough, consider twice)
$INST texlive-full

# LaTeX for Pandoc (texlive-full has them also)
#$INST texlive-latex-extra texlive-fonts-recommended
# Pandoc - universal document converter
$INST pandoc

# Doxygen w/ GUI
$INST doxygen doxygen-gui

# Lua
LUAVER=5.3.4
apt-get install -y libreadline-dev
curl -R -O http://www.lua.org/ftp/lua-${LUAVER}.tar.gz
tar zxf lua-${LUAVER}.tar.gz
cd lua-${LUAVER}
make linux
make install
cd $WD

# cmocka - Unit testing framework
CMVER=1.1.0
curl -R -O https://cmocka.org/files/1.1/cmocka-${CMVER}.tar.xz
unxz cmocka-${CMVER}.tar.xz
tar xvf cmocka-${CMVER}.tar
cd cmocka-${CMVER}
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Debug ..
make
make install
cd $WD

# Callgrind profiler (Valgrind, KCachegrind)
$INST valgrind kcachegrind

# java8
#add-apt-repository ppa:webupd8team/java
#apt-get update
#apt-get install oracle-java8-installer

# X
#$INST xubuntu-desktop unity
