[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/doc/fzf/examples/completion.zsh ] && source /usr/share/doc/fzf/examples/completion.zsh

#export FZF_TMUX=1  # enable tmux integration
#export FZF_TMUX_OPTS='-d50%'  # bottom pane
#export FZF_TMUX_OPTS='-p80%,30%'  # floating pane
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --info=inline --border --margin=1 --padding=0"
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'
export FZF_CTRL_T_OPTS="
  --preview 'bat -n --color=always {}'"
