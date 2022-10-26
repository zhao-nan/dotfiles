source $HOME/Templates/config/.private_names.sh

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="$PATH:$HOME/.local/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

if [ "$HOST" = "$hostname_home" ]; then
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
else
    export GOPATH=$HOME/go
    export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
    export OPAMROOT=~/programs/opam-coq.8.9.0
    export JAVA_HOME=/usr/lib/jvm/java-16-oracle
    export PATH="$PATH:$HOME/programs/lingeling"
    export PATH="$PATH:$HOME/programs/gradle-7.3/bin"
    export PATH="$PATH:$HOME/programs/z3/bin"
    export PATH="$PATH:$HOME/programs/Fstar/bin"
    export PATH="$PATH:$HOME/.cargo/bin"

    alias fstar="$HOME/programs/FStar/bin/fstar.exe"
    alias fstar.exe=fstar
fi
