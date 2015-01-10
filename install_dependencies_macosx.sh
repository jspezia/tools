#!/bin/bash

# 1. install Xcode command-line tools:
# From this url : (uncomment the following line)
# open http://itunes.apple.com/us/app/xcode/id497799835?mt=12
# install Xcode on the Mac App Store by clicking on “View in Mac App Store”.
# or simpler, issue
git
# a pop-up window should appear which recommends to install the command-line tools.

# 2. install HomeBrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# to reinstall, do:
# rm -rf /usr/local/Cellar /usr/local/.git && brew cleanup

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade

# install python through HomeBrew
brew install python

# bootstrap pip
sudo pip install --upgrade setuptools
sudo pip install --upgrade distribute

# installing xquartz
brew tap caskroom/cask
brew install brew-cask
brew cask install xquartz

# numpy et al
brew tap homebrew/science
brew tap Homebrew/python
brew install gcc
brew install cmake
brew install fftw
brew install libtool
brew install hdf5
brew install pillow
sudo pip install -U numexpr
sudo pip install -U cython
sudo pip install -U tables
sudo pip install -U pandas
sudo pip install -U nose
sudo pip install -U ipython
brew install numpy #--with-openblas
brew test numpy
brew install scipy

# pylab
brew install matplotlib --with-tex

# mayavi
brew install vtk5 --with-qt
ln -s /usr/local/opt/vtk5/lib/python2.7/site-packages/vtk/ /usr/local/lib/python2.7/site-packages/vtk # there is a bug in the onstallation of vtk such that it can not be imported
#brew install vtk --python
sudo pip install git+https://github.com/enthought/traitsbackendqt
sudo pip install configobj
sudo pip install envisage
sudo pip install  "Mayavi[app]"

# HDF export
brew install hdf5
sudo pip install cython
sudo pip install numexpr
sudo pip install tables

# brew install wxpython
# pip install -U psychopy

sudo pip install psutil
sudo pip install pyprind


# install online displaying tools
sudo pip install PyOpenGL PyOpenGL_accelerate
sudo pip install glumpy
brew install --HEAD smpeg
brew install pygame
sudo pip install hg+https://pyglet.googlecode.com/hg/
sudo pip install -U NeuroTools

# convert
brew install imagemagick
brew install x264
brew install ffmpeg --with-libvpx

# Remove outdated versions from the cellar
brew cleanup
