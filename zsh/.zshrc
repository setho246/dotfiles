# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="spaceship"

# Case and dash insensitive completion.
CASE_SENSITIVE="true"
HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Don't mark git as dirty when untracked files exist.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(git virtualenv)

# Move compinit cache files into generic cache location.
export ZSH_COMPDUMP=~/.cache/.zcompdump-$HOST

source $ZSH/oh-my-zsh.sh

######################
# User configuration #
######################

# ORDER
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

alias dup="docker compose -f ./docker-compose.yml -f ~/.work_helpers/docker-compose.override.yml up -d; docker compose logs -f php"
alias dpb="docker compose exec -w '/var/www/html/drupal'  php bash"
alias dsd="docker compose -f ./docker-compose.yml -f ~/.work_helpers/docker-compose.override.yml stop"
alias ddv="docker compose -f ./docker-compose.yml -f ~/.work_helpers/docker-compose.override.yml  down"
alias python="python3"
alias ctop='TERM="${TERM/#tmux/screen}" ctop'
alias wodjs="docker run --rm -v $HOME/.ssh/:/home/node/.ssh -v ./mariadb-init:/usr/src/app/mariadb-init -u 1000:1000 -it eopts_dockby"
alias hypr="hyprland"

export IDEA_JDK=/usr/lib/jvm/jdk-jetbrains
export PATH="/opt/homebrew/bin:$PATH"
