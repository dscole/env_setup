docker run --rm \
           --interactive \
           --tty \
           --name spacemacs  \
           -e DISPLAY="unix$DISPLAY" \
           -e UNAME=$USER \
           -e UHOME=$HOME \
           -v $HOME/.ssh:$HOME/.ssh \
           -v $HOME/workspace:$HOME \
           -v $HOME/org:$HOME/org \
           -v /etc/localtime:/etc/localtime \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -v $HOME:/mnt/workspace \
           --privileged \
           dscole/emacs
