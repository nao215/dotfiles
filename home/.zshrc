# dircolors
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"")"

# anyenv
if [ -d $HOME/.anyenv ] ; then
    export PATH="$HOME/.anyenv/bin:$PATH"
    eval "$(anyenv init -)"
fi

# alias
alias startmysql='cd /usr/local/Cellar/mysql/5.6.19/support-files;mysql.server start'
alias vi='vim'
alias bim='vim'

# JS compile
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"

autoload -U colors; colors

export HISTTIMEFORMAT='%y/%m/%d %H:%M:%S'

PROMPT='%F{green}[%n:%~]$%f%F{white} '
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]:" 

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


# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh


# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="y"

# go path
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

#go
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/local/Cellar/ant/1.9.3/libexec/bin
export PATH=$ANT_ROOT:$PATH

export CPATH=/usr/include/hdf5/mpich
export PKG_CONFIG_PATH=/opt/luajit-2.0.3/lib/pkgconfig

# Docker
export DOCKER_HOST=tcp://localhost:4243

export PATH=/usr/local/bin:$PATH
