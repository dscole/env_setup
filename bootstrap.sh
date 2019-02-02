# Getting a working ubuntu environment

# General packages
sudo apt install -y \
     build-essential \
     cmake \
     gcc \
     git \
     pidgin \
     python \
     python-dev \
     python3 \
     tig \
     tmux \
     tree \
     virtualenv \
     xclip

cd ~
virtualenv ~/py2env
virtualenv -p python3 ~/py3env

source ~/py2env/bin/activate

mv -f .emacs.d .emacs.d.old
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
git clone https://github.com/dscole/env_setup.git
ln -s env_setup/spacemacs.d .spacemacs.d
ln -s env_setup/tmux.conf .tmux.conf
ln -s env_setup/.Xresources -rt ./
ln -s env_setup/.bash_profile -rt ./
ln -s env_setup/.bashrc -rt ./
ln -s env_setup/.rdmrc -rt ./
ln -s env_setup/pep8 -rt ./.config
ln -s env_setup/powerline -rt ./.config
ln -s env_setup/pylintrc -rt ./.config

cd Downloads
wget http://ftp.gnu.org/gnu/emacs/emacs-25.1.tar.gz
tar -xzf emacs-25.1.tar.gz
cd ..

mkdir programs
cd programs

mv ~/Downloads/emacs-25.1 .
git clone https://github/dscole/ace-window.git

# gnome plugin for full screen fix
# git clone https://github/deadalnix/pixel-saver.git

# build emacs dependencies
sudo apt-get build-dep emacs24
sudo apt install -y \
     checkinstall \
     libacl1-dev \
     libgconf2-dev \
     libgiv-dev \
     libgnutls28-dev \
     libgpm-dev \
     libgtk-3-dev \
     libjpeg-turbo8-dev \
     libm17-dev \
     libmagickwand-dev \
     libncurses5-dev \
     libotf-dev \
     libpng-dev \
     librsvg2-dev \
     libselinux1-dev \
     libtiff5-dev \
     libtinfo-dev \
     libwebkitgtk-3.0-dev \
     libxml2-dev \
     libxmu-dev \
     libxmuu-dev \
     libxpm-dev \
     libxt-dev \
     libxv-dev

cd emacs-25.1
./configure CFLAGS=-no-pie --with-modules --with-xwidgets --with-x-tollkit=gtk3
make -j7
sudo make install
cd ..

# Install llvm
wget -O - http://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
sudo apt-add-repository "deb http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs)-3.9 main"
sudo apt-get update
sudo apt install \
     clang-3.9 \
     clang-3.9-doc \
     clang-format-3.9 \
     libclang-3.9-dev \
     libclang-common-3.9-dev \
     libclang1-3.9 \
     libclang1-3.9-dbg \
     libfuzzer-3.9-dev \
     libllvm-3.9-ocaml-dev \
     libllvm3.9 \
     libllvm3.9-dbg \
     lldb-3.9 \
     llvm-3.9 \
     llvm-3.9-dev \
     llvm-3.9-doc \
     llvm-3.9-examples \
     llvm-3.9-runtime \
     python-clang-3.9

# install rtags
git clone --recursive https://github.com/Andersbakken/rtags.git
mkdir -p rtags/build
cd rtags/build
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 ..
make -j7
sudo make install
cd ../..

# install ycmd
git clone https://github.com/Valloric/ycmd.git
cd ycmd
git submodule update --init --recursive
./build.py --clang-completer
cd ..


# install my ace-window
cd ace-window
cp ace-window.el ~/.emacs.d/elpa/ace-window-*/.
# in emacs:
#    unload-feature ace-window
#    byte-compile-file ~/.../ace-window.el
#    restart-emacs
cd ..

# install docker

sudo apt install -y --no-install-recommends \
     apt-transport-https \
     ca-certificates \
     curl \
     software-properties-common

curl -fsSL https://apt.dockerproject.org/gpg | sudo apt-key add -
sudo apt-get-repository \
     "deb https://apt.dockerproject.org/repo \
ubuntu-$(lsb_release -cs) \
main"

sudo apt update
sudo apt install -y docker-engine

# install fonts
# Download:
#    BabelStoneHan
#    FontAwesome
#    PowerlineSymbols
#    Symbola
mkdir ~/Downloads/fonts
cd ~/Downloads/fonts
wget http://babelstone.co.uk/Fonts/1082/BabelStoneHan.zip
wget http://users/teilar.gr/~g1951d/Symbola.zip
wget http://fontawesome.io/assets/font-awesome-4.7.0.zip
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf

unzip BabelStoneHan.zip
unzip font-awesome-4.7.0.zip
unzip Symbola.zip

mkdir -p ~/.fonts
cp*.ttf font-awesome*/fonts/* ~/.fonts

mkdir -p ~/.config/fontconfig/conf.d
cp 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -fv
sudo mkfontscale ~/.fonts
sudo mkfontdir ~/.fonts
xset fp+ "~/.fonts"
cd -

# install powerline

pip install powerline-status
pip install pylint
