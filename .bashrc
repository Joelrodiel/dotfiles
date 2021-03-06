# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

##############################
#### Yall ready for this? ####
##############################

export VISUAL=vim
export EDITOR="$VISUAL"

export WINDOWS=/mnt/c/Users/joelr/
export CS=/mnt/c/Users/joelr/Documents/CS61A/
export DISPLAY=:0

alias cp='cp -iv'
alias mv='mv -iv'
alias mkdir='mkdir -pv'
cd () { builtin cd "$@"; ls; }
md () { mkdir -p "$@" && cd "$@"; }
alias rd='rm -r'

alias bd='cd "$OLDPWD"'
alias ..='cd ../'

up() {
    local d=""; limit=$1;
    for ((i=1; i <= limit; i++))
    do
        d=$d/..
    done
    d=$(echo $d | sed 's/^\///')
    if [ -z "$d" ]; then
        d=..
    fi
    cd $d
}

alias vim='vim -p'
alias v='vim'
alias sv='sudo vim'
alias vi='vim'
alias nano='vim'
alias ~='cd ~'
alias cls='clear'
alias apt-get='sudo apt-get'
sch () { grep "$@" *; }
schd () { grep -r "$1" "$2"/; }
alias qfind="find . -name "
alias qfindA="find / -name "
alias myip='hostname -I'
alias netCons='lsof -i'
alias openports='netstat -nape --inet'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias la='ls -Alh'
alias ls='ls -aFh --color=auto --group-directories-first'
alias lr='ls -lRh'
alias lf='ls -l | egrep -v "^d"'
alias ldir='ls -l | egrep "^d"'

alias rmd='/bin/rm --recursive --force --verbose '

alias mx='chmod a+x'
alias h='history | grep '

alias da='date "+%Y-%m-%d %A %T %Z"'

alias agi='apt-get install '
alias please='sudo $(history -p !!)'

alias git-s='git status'
alias git-a='git add'
alias git-c='git commit -m'
alias git-p='git push'
alias git-pom='git-p origin master'
alias git-b='git branch'
alias git-nb='git checkout -b'
alias git-main='git pull origin master'
alias git-whereami='git remote -v'
alias git-poku='git-p heroku'
alias git-bhot='git-nb hotfix/'
alias git-poki='git-pom && git-poku'

git-hotfix () { git-b hotfix/$1 $2; }
git-change () { git blame $1 | grep 'Not Committed'; }
git-who () { git blame $1 | grep $2; }
git-me () { git-who $1 joelrodiel; }

cp-node() { rsync -av --progress $1 $2 --exclude node_modules/ .git/; }

alias npmI='npm i --save'

alias whome='cd /mnt/c/Users/joelr/'

bashme () { sudo vim +127 ~/.bashrc && source ~/.bashrc; }

### These are more cool than anything ###

getnews() { curl https://newsapi.org/v2/top-headlines -s -G -d sources=$1 -d apiKey=e35072b5370f490090d23c1e7d5561e2; } #| jq '.articles[] | .title'; }

export NVM_DIR="/home/hoel/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

## CS61A CMD ##
alias py='python3'
alias pok='py ok'
alias pokS='py ok --submit'
alias pokQ='py ok -q'
pokQU () { pokQ $1 -u; }

alias WINDOWS_HOME='C:\Users\joelr\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\hoel'
