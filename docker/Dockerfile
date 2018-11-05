FROM dscole/emacs:spacemacs26

# Has to be secified before `RUN install-deps`
ENV UNAME="spacemacser"
ENV UID="1000"

# Ubuntu Xenial
RUN apt-get update \
  && apt-get install \
  dstat \
  build-essential \
  cmake \
  gcc-8 \
  g++-8 \
  git \
  clang-6.0 \
  libclang-6.0-dev \
  lldb-6.0 \
  llvm-6.0 \
  llvm-6.0-dev \
  python-clang-6.0 \
  pidgin \
  python \
  python-dev \
  python3 \
  tig \
  tmux \
  tree \
  virtualenv \
  xclip \
  && rm -rf /var/lib/apt/lists/*

RUN rm "${UHOME}/.spacemacs"
COPY spacemacs.d "${UHOME}/.spacemacs.d"

# Install layers dependencies and initialize the user
RUN install-deps
