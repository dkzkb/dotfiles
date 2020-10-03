bindkey -e
bindkey "^[[3~" delete-char
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

export LANG=ja_JP.UTF-8
PROMPT="%F{cyan}[%~:%n]%f %# "
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


setopt no_beep

#
## 履歴
##
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

setopt interactivecomments
setopt hist_reduce_blanks
setopt hist_ignore_dups  # ~G~M~G~A~X~L~A~W~A~A~D
setopt hist_ignore_space # ~E~H| ~A~L~M~J~R~B~C~Z~C~B~A| ~P~H~A~X~L~A~W~A~A~D
setopt share_history     # 履歴~B~R~E~\~I~A~Y~B~K
setopt hist_no_store     # history~B~C~^~C~C~I~A~Y~L~A~W~A~A~D
setopt hist_expand       # ~\~L~Y~B~A~C~R~B~C~H~C~B~R~G~K~U~Z~D~A~U~V~K~A~Y~B~K

setopt EXTENDED_HISTORY
#
#function cd(){
#    builtin cd $@ && ls;
#    }
#
#
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit
compinit
