source $HOME/.private_names.sh

export GOPATH=$HOME/go
export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
export OPAMROOT=~/programs/opam-coq.8.9.0
export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"
export PATH="$PATH:$HOME/programs/z3/bin/z3"

if [ "$HOST" = "$hostname_home" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
else
    export JAVA_HOME=/usr/lib/jvm/jdk1.8.0_201
fi
