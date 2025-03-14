source $HOME/Templates/config/.private_names.sh

export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/dotfiles/bin"
export PATH="$PATH:$HOME/.local/bin"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

if [ "$HOST" = "$hostname_home" ]; then
    # export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    # export PATH="$PATH:$HOME/programs/node-v18.18.2-linux-x64/bin"
else
    export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
    export PATH="$PATH:$HOME/programs/gradle-7.3/bin"
    export PATH="$PATH:$HOME/programs/z3/bin"
    export PATH="$PATH:$HOME/.cargo/bin"
fi
