# Recursively fix dir/file permissions on a given directory
fixperms() {
    if [ -d $1 ]; then
        find $1 -type d -exec chmod 755 {} \;
        find $1 -type f -exec chmod 644 {} \;
    else
        echo "$1 is not a directory."
    fi
}

# Grep for a process
psg() {
    FIRST=`echo $1 | sed -e 's/^\(.\).*/\1/'`
    REST=`echo $1 | sed -e 's/^.\(.*\)/\1/'`
    ps aux | grep "[$FIRST]$REST"
}

mygit() {
    git config --local user.name "Kyle Wilcox"
    git config --local user.email "wilcox.kyle@gmail.com"
    printgitconfig
}

workgit() {
    git config --local user.name "Kyle Wilcox"
    git config --local user.email "kyle@axiomalaska.com"
    printgitconfig
}

printgitconfig() {
    NM=`git config --local --get user.name`
    EM=`git config --local --get user.email`
    echo "Git config set to: $NM - $EM"
}

scan() {
if [ ! -z "$1" ]; then
    scanimage -d 'brother4:net1;dev0' -p > $1
    convert $1 -scale 824x1146 $1
else
    echo "'$1' is not a valid file"
fi
}

# Extract any type of file
extract() {
if [ -f $1 ]; then
    case $1 in
        *.tar.bz2)   tar xvjf $1     ;;
        *.tar.gz)    tar xvzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz2)      tar xjvf $1    ;;
        *.tgz)       tar xzvf $1    ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
        *)           echo "'$1' cannot be extracted via extract()" ;;
    esac
else
         echo "'$1' is not a valid file"
fi
}

portstat() {
    #sudo netstat -a -p | grep $1
    sudo lsof -i :$1
}

# colorized cat
c() {
    for file in "$@"
    do
        pygmentize -f console256 -g "$file"
    done
}
