PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

ZSH_THEME="apple"

TERM=xterm-color; export TERM

export PATH=/Applications/Xcode6-Beta2.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin:$PATH

alias rmdir='rm -rf' #remove directry

#lessc
alias lessc="~/node_modules/less/bin/lessc"
alias grunt="~/node_modules/grunt/bin/lessc"

##########start server##########
#ssh my server
alias sshmysrv='ssh yanagisawa@153.121.73.36' 
#ineeza
alias ssh-ineeza='ssh root@128.199.148.141'
#uuum
alias ssh-uuum-dev-srv='ssh -i ~/.ssh/uuum_rsa uadmin@133.242.225.162'
#sfc my server
alias ssh-sfc-srv='ssh s12882ny@webedit.sfc.keio.ac.jp'
##########end server##########

#taiikuSystem
alias getPEInfo='sh ~/workspace/sh/getTaiikuSystemInfo.sh'

alias ll='ls -la' #list all
alias cdworldin='cd ~/workspace/PlayScala/WorldIn'
alias cdsmartchat='cd ~/workspace/PlayScala/SmartChat'
alias oppai='git'
alias cdmasudora='cd ~/workspace/Unity/DragonApp5/Assets/Scripts'
alias startmysql='cd /usr/local/Cellar/mysql/5.6.19/support-files;mysql.server start'

########## change directry #############
alias cd-uuum-theme='cd /Applications/MAMP/htdocs/prototype/sites/all/themes/uuum/'
alias cd-mamp-mysql='cd /Applications/MAMP/Library/bin';
########## /change directry #############

alias pwd-cp='pwd | pbcopy'

autoload -U colors; colors

PROMPT='%F{green}[%n:%~]$%f%F{white} '
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]:" 
RPROMPT="%F{green}%*%F{white}"

parse-git-branch()
{
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "${branch}" ]; then
        [ "${branch}" = "HEAD" ] && local branch=$(git rev-parse --short HEAD 2>/dev/null)
        local statusis="$(git status --porcelain 2>/dev/null)"
        echo -n " on %F{6}${branch}%f"
        [ -n "${statusis}" ] && echo -n "%F{3}*%f"
    fi
}


eval $(/usr/local/bin/gdircolors ~/workspace/ForSystem/solarized/dircolors-solarized-master/dircolors.ansi-universal)

#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

alias ls='gls --color=auto'
