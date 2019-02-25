# it's actually emacs26, they just never changed the name
FROM spacemacs/emacs25:develop

# Do not exclude man pages & other documentation
# Reinstall all currently installed packages in order to get the man pages back
RUN rm /etc/dpkg/dpkg.cfg.d/excludes \
  && apt-get update \
  && dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -y --reinstall \
  &&  rm -r /var/lib/apt/lists/*

# Ubuntu Xenial
RUN apt-get update && apt-get install \
  dstat \
  build-essential \
  gcc-8 \
  g++-8 \
  git \
  man-db \
  ncurses-dev \
  ninja-build \
  python \
  python-dev \
  python3 \
  python3-dev \
  python3-venv \
  rsync \
  tig \
  tmux \
  tree \
  virtualenv \
  wget \
  xclip \
  zlib1g-dev \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common \
  cifs-utils \
  iputils-ping \
  && curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey \
  && add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
  $(lsb_release -cs) \
  stable" \
  && apt-get update \
  && apt-get -y install docker-ce=18.06.1~ce~3-0~ubuntu \
  && rm -rf /var/lib/apt/lists/*

# Install cmake
ARG cmake_package=cmake-3.12.4-Linux-x86_64
ARG cmake_version=v3.12
RUN wget https://cmake.org/files/${cmake_version}/${cmake_package}.sh -P /tmp \
    && chmod u+x /tmp/${cmake_package}.sh \
    && /tmp/${cmake_package}.sh --skip-license --prefix=/usr \
    && rm /tmp/${cmake_package}.sh

# Install llvm+clang
ARG llvm_version=7.0.0
ARG llvm_package=clang+llvm-${llvm_version}-x86_64-linux-gnu-ubuntu-16.04
RUN wget http://releases.llvm.org/${llvm_version}/${llvm_package}.tar.xz -P /tmp \
    && tar -xf /tmp/${llvm_package}.tar.xz --strip 1 --directory /usr \
    && rm /tmp/${llvm_package}.tar.xz


# Install ccls
RUN git clone --depth=1 --recursive https://github.com/MaskRay/ccls /tmp/ccls \
    && cmake -H/tmp/ccls \
             -B/tmp/ccls/build/Release \
             -DCMAKE_BUILD_TYPE=Release \
             -DCMAKE_INSTALL_PREFIX=/usr \
             -DCMAKE_CXX_COMPILER=clang++ \
             -DCMAKE_C_COMPILER=clang \
             -DSYSTEM_CLANG=ON \
             -GNinja \
    && cmake --build /tmp/ccls/build/Release -- install \
    && rm -rf /tmp/ccls

# Use virtualenvs for python packages so that pip can be upgraded to latest version, because
# you can't really upgrade the system installed pip
ARG python_packages="pandas numpy scipy jupyter numba"
RUN virtualenv "${UHOME}/py2" \
    && ${UHOME}/py2/bin/pip install -U pip twine wheel \
    && ${UHOME}/py2/bin/pip install ${python_packages}

RUN python3 -m venv "${UHOME}/py3" \
    && ${UHOME}/py3/bin/pip install -U pip twine wheel \
    && ${UHOME}/py3/bin/pip install ${python_packages}


RUN mkdir -p /mnt/storage

COPY spacemacs.d "${UHOME}/.spacemacs.d"
RUN rm "${UHOME}/.spacemacs" "${UHOME}/.spacemacs.d/.spacemacs.env"

# Install layers dependencies and initialize the user
RUN install-deps

CMD ["bash", "-c", "ln -s /home/emacs/.emacs.d -rt $UHOME 2> /dev/null; emacs; /bin/bash"]
