#!/bin/bash

## Run in the repo root directory!

# Install basic dependencies

# 2 85
sudo apt-get update
sudo apt-get install \
  apt-transport-https \
  build-essential \
  ca-certificates \
  ctags \
  curl \
  git \
  gnupg \
  gnupg-agent \
  graphviz \
  libsqlite3-dev \
  libssl-dev \
  libnotify-bin \
  htop \
  make \
  openssh-client \
  python3-pip \
  python3-dev \
  python3-psycopg2 \
  rsync \
  ruby-full \
  software-properties-common \
  sqlite3 \
  tmux \
  unixodbc-dev \
  wget \
  vim \
  xbindkeys \
  zlib1g-dev \
  unzip \
  zip \
  xclip \
  -y


# Install from non standard sources

## sublime
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

## docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

## Spotify
sudo sh -c 'echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list.d/spotify.list'
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -

## Chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list


sudo apt-get update
sudo apt-get install \
  containerd.io \
  docker-ce  \
  docker-ce-cli \
  docker-compose \
  google-chrome-stable \
  spotify-client  \
  sublime-text  \
  -y


# Post install steps

rm $HOME/.bashrc
cp .bashrc $HOME/.bashrc
cp .bash_aliases $HOME/.bash_aliases
cp .xbindkeysrc $HOME/.xbindkeysrc
mkdir $HOME/workspace
mkdir $HOME/server
mkdir $HOME/gems

## vimrc
# https://blog.miguelgrinberg.com/post/video-setting-up-vim-to-work-with-python-applications
curl -fLo ~/.vimrc \
    https://gist.githubusercontent.com/miguelgrinberg/527bb5a400791f89b3c4da4bd61222e4/raw/c56ce4c929f7b95fc2a96c483f3e498b4d1d7fdf/.vimrc

## tmux
curl -fLo ~/.tmux.conf \
    https://gist.githubusercontent.com/miguelgrinberg/19f7b1d74ae33fd622e080d43dc03ea8/raw/b17d587ea554bac240767fad10491116863d270a/.tmux.conf

## sublime preferences
cp Preferences.sublime-settings $HOME/.config/sublime-text-3/Packages/User/

## Docker: see https://docs.docker.com/engine/install/linux-postinstall/
sudo groupadd docker
sudo usermod -aG docker $USER
sudo systemctl enable docker

## set the default python to 3 and update python
PY3=$(ls /usr/bin | grep -E '^python3.[0-9]$')
sudo update-alternatives --install /usr/bin/python python /usr/bin/${PY3} 1
pip3 install --upgrade pip
pip3 install virtualenv

## Jekyll
gem install jekyll bundler


# Things that are not scripted yet


echo "run commands:"
echo "  sudo update-alternatives –config editor" # set vim
echo "download/install:"
echo "  go: https://golang.org/doc/install"
echo "  node: https://linuxize.com/post/how-to-install-node-js-on-ubuntu-18.04/"
echo "  pycharm: https://www.jetbrains.com/pycharm/download/#section=linux"
echo "  fileserver: rsync -avzhe ssh marc@marc-laptop.local:/home/marc/server $HOME/server"
echo ""
echo "login:"
echo "  chrome"
echo "  spotify"
