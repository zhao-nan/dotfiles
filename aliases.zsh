source $HOME/.private_names.sh

alias o="xdg-open"

alias l.="ls -d .?*"
alias la="ls -A"
alias lla="ls -lAh"
alias psa='ps -A'
alias extr='extract '
alias extrem='extract_and_remove '

alias magit='ec -e "(magit-status \"$(pwd)\")"'
alias git---="git checkout --"
alias svnm="svn commit -m"
alias svnc="svnm"

alias zalias="ec ~/.oh-my-zsh/custom/aliases.zsh"
alias brc="ec ~/.bashrc"
alias zrc="ec ~/.zshrc"
alias zshenv="ec ~/.zshenv"

alias cdk="cd ~/programs/key/"
alias ksc="cd ~/programs/key/key/scripts"
alias ukey="cd $HOME/programs/key-use/key/key/ && ./gradlew run"
alias lkey="$HOME/programs/key-use/key/key/scripts/key"
alias rules="cd ~/programs/key/key/key.core/src/main/resources/de/uka/ilkd/key/proof/rules/"

alias inst="sudo apt-get install"
alias i57adm="ssh $ssh_workgroup_login"

alias tour='brun $HOME/programs/Tourenplaner/Tourenplaner'
alias zot="brun $HOME/programs/zotero/zotero"
alias verx='python3 ~/projects/svi-kastel/bim/verification/verx/VerX/client.py'
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias tla-toolbox="brun $HOME/programs/TLA-toolbox/toolbox"

texwiz-lncs() {
    touch bib.bib
    cp ~/Templates/latex/lncs-js.tex .
    mv lncs-js.tex main.tex
    ec main.tex
}

texwiz-presentation-kit() {
    cp ~/Templates/latex/pres.tex .
    ec pres.tex
}

# Archives
function extract {
  if [ -z "$1" ]; then
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
  else
    if [ -f $1 ]; then
      case $1 in
        *.tar.bz2)   tar xvjf $1    ;;
        *.tar.gz)    tar xvzf $1    ;;
        *.tar.xz)    tar xvJf $1    ;;
        *.lzma)      unlzma $1      ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar x -ad $1 ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xvf $1     ;;
        *.tbz2)      tar xvjf $1    ;;
        *.tgz)       tar xvzf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *.xz)        unxz $1        ;;
        *.exe)       cabextract $1  ;;
        *)           echo "extract: '$1' - unknown archive method" ;;
      esac
    else
      echo "$1 - file does not exist"
    fi
  fi
}

function extract_and_remove {
  extract $1
  rm -f $1
}

# fzf: fd - cd to selected directory
fd() {
    local dir
    dir=$(find ${1:-.} -path '*/\.*' -prune \
               -o -type d -print 2> /dev/null | fzf +m) &&
        cd "$dir"
}

# cf - fuzzy cd from anywhere
# ex: cf word1 word2 ... (even part of a file name)
# zsh autoload function
cf() {
    cd
    fd
}

# "background run"
function brun {
    nohup $1 > /dev/null 2>&1 &
}

# move, and create dir if it does not already exist
function mvp () {
    dir="$2"
    tmp="$2"; tmp="${tmp: -1}"
    [ "$tmp" != "/" ] && dir="$(dirname "$2")"
    [ -a "$dir" ] ||
        mkdir -p "$dir" &&
            mv "$@"
}
