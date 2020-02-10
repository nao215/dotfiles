#theme	
function toon {	
  echo -n ""	
}	

 get_git_dirty() {	
  git diff --quiet || echo '*'	
}	

 #git	
autoload -Uz vcs_info	
zstyle ':vcs_info:*' check-for-changes true	
zstyle ':vcs_info:*' unstagedstr '%F{red}*'   # display this when there are unstaged changes	
zstyle ':vcs_info:*' stagedstr '%F{yellow}+'  # display this when there are staged changes	
zstyle ':vcs_info:*' actionformats \	
    '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%c%u%F{5}]%f '	
zstyle ':vcs_info:*' formats       \	
    '%F{5}%F{5}[%F{2}%b%c%u%F{5}]%f '	
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'	
zstyle ':vcs_info:*' enable git cvs svn	

 theme_precmd () {	
    vcs_info	
}	

 setopt prompt_subst	
PROMPT='%{$fg[white]%}$(toon)%{$reset_color%} [%~/] %{$reset_color%}${vcs_info_msg_0_}%{$reset_color%}'	
SPROMPT="%r is correct? [n,y,a,e]:" 	

 zle -N zle-line-init	
zle -N zle-keymap-select	
autoload -U add-zsh-hook	
autoload -U zle-line-init	
autoload -U zle-keymap-select	
add-zsh-hook precmd theme_precmd