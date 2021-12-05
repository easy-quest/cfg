exit() {
	if pgrep -f tiger >/dev/null;then 
		unset -f exit
		exit
	else
		pkill dbus
		pkill ssh-agent
		pkill gpg-agent
		pkill pulseaudio
		unset -f exit
		exit
	fi
}

# alias zzc="comm=$(uname -m;date +'%d/%m/%Y %H:%M:%S');zz commit -am '$comm';"


## Useful aliases
alias grubup="sudo update-grub"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias wget='wget -c '
alias rmpkg="sudo pacman -Rdd"
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias hw='hwinfo --short'                                   # Hardware Info
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB (expac must be installed)
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

# Get fastest mirrors
alias mirror="sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist"
alias mirrord="sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist"
alias mirrors="sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist"
alias mirrora="sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist"

# Help people new to Arch
alias apt-get='man pacman'
alias apt='man pacman'
alias helpme='cht.sh --shell'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias upd="/usr/bin/update"


#GOROOT环境变量设置
export PATH=$PATH:/usr/local/go/bin
#GOPATH环境变量设置（go工作目录）
export GOPATH=/home/zzz/goCoding/
export GOPATH=/home/zzz/gocoding/
# 启用 Go Modules 功能
export GO111MODULE=on
# 配置 GOPROXY 环境变量
export GOPROXY=https://goproxy.cn
#牛云也出了个国内代理 goproxy.cn 方便国内用户更快的访问
# go env -w GO111MODULE=on
# go env -w GOPROXY=https://goproxy.cn,direct
#
# function venv(){
#   python -m venv .venv $argv
#   printf "source .venv/bin/activate" > .envrc $argv
#   direnv allow $argv
#   pip install -U pip setuptools wheel pylint yapf isort pip-tools $argv
# }
# alias venv="python -m venv .venv $argv;printf "source .venv/bin/activate" > .envrc $argv;direnv allow $argv;pip install -U pip setuptools wheel pylint yapf isort pip-tools $argv;"

function pud(){
    .venv/bin/python -m pip install -U pip setuptools wheel pylint yapf isort pip-tools $argv;
    printf "Пауза 10 сек";
    sleep 10;
    .venv/bin/python -m pip freeze > requirements.in;
    .venv/bin/pip-compile
    printf "Пауза 10 сек";
    sleep 10;
    .venv/bin/python -m pip install -U -r requirements.txt
    sleep 10
    rm requirements.in
}
function gp(){
  git add -A
  git commit -a
  git push
}

function pyedit(){
xpyc=`python -c "import os, sys; f = open(os.devnull, 'w'); sys.stderr = f; module = __import__('$1'); sys.stdout.write(module.__file__)"`

    if [[ "$xpyc" == "" ]]; then
        echo "Python module $1 not found"
        return -1

    elif [[ $xpyc == *__init__.py* ]]; then
        xpydir=`dirname $xpyc`;
        echo "$EDITOR $xpydir";
        $EDITOR "$xpydir";
    else
        echo "$EDITOR ${xpyc%.*}.py";
        $EDITOR "${xpyc%.*}.py";
    fi
}

alias pi='pip install -U'
alias rm='rm -Rf $argv'
alias md='mkdir -p $argv'


## Полезные alias
# Заменить ls на exa
alias ls='exa --color=always --group-directories-first --icons'     # предпочтительный список
alias la='exa -a --color=always --group-directories-first --icons'  # все файлы и каталоги
alias ll='exa -l --color=always --group-directories-first --icons'  # длинный формат
alias lt='exa -aT --color=always --group-directories-first --icons' # древовидный список
alias l.="exa -a | egrep '^\.'"                                     # точечные файлы
