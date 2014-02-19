 #!/usr/bin/env bash

 source $HOME/.rvm/scripts/rvm

 rvm use --install $1 --default

 shift

 if (( $# ))
 	then gem install $@
 fi