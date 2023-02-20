# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

BULLETTRAIN_PROMPT_ADD_NEWLINE=true
BULLETTRAIN_DIR_EXTENDED=2
CONDA_ENV_DISABLE_PROMPT=false
BULLETTRAIN_CONTEXT_DEFAULT_USER=kwilcox
BULLETTRAIN_CUSTOM_MSG="$(hostname)"
BULLETTRAIN_PROMPT_ORDER=(
  custom
  status
  #context
  dir
  #screen
  #perl
  #ruby
  nvm
  aws
  #go
  #rust
  #elixir
  #virtualenv
  conda
  git
  hg
  cmd_exec_time
)

prompt_conda() {
  local condaenv_path="$CONDA_PREFIX"
  if [[ -n $condaenv_path && -n $CONDA_ENV_DISABLE_PROMPT ]]; then
    prompt_segment $BULLETTRAIN_VIRTUALENV_BG $BULLETTRAIN_VIRTUALENV_FG $BULLETTRAIN_VIRTUALENV_PREFIX"  $(basename $CONDA_PREFIX)"
  fi
}

ZSH_THEME="bullet-train"

export TERM="xterm-256color"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
export DISABLE_VENV_CD=1

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  tmux
  #autopep8
  #conda
  #docker
  #dotenv
  #docker-compose
  #nmap
  #history
  #pass
  #python
  #sudo
  #mvn
  #zsh-nvm
)

# Automatically start tmux
ZSH_TMUX_AUTOSTART=true
# Automatically connect to a previous session if it exists
ZSH_TMUX_AUTOCONNECT=false
# Automatically close the terminal when tmux exits
ZSH_TMUX_AUTOQUIT=false

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# direnv: https://direnv.net/
eval "$(direnv hook zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

GPG_TTY=$(tty)
export GPG_TTY
