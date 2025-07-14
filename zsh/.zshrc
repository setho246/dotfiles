# Path to oh-my-zsh installation.
export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="robbyrussell"

# Case and dash insensitive completion.
CASE_SENSITIVE="false"
HYPHEN_INSENSITIVE="true"

# Display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

plugins=()
# plugins=(git venv)

# Move compinit cache files into generic cache location.
export ZSH_COMPDUMP=~/.cache/.zcompdump-$HOST

source $ZSH/oh-my-zsh.sh

######################
# User configuration #
######################

alias dup="docker compose -f ./docker-compose.yml -f ~/.work_helpers/docker-compose.override.yml up -d; docker compose logs -f php"
alias dpb="docker compose exec -w '/var/www/html/drupal'  php bash"
alias dsd="docker compose -f ./docker-compose.yml -f ~/.work_helpers/docker-compose.override.yml stop"
alias ddv="docker compose -f ./docker-compose.yml -f ~/.work_helpers/docker-compose.override.yml  down"
alias dc="docker compose"
alias python="python3"
alias ctop='TERM="${TERM/#tmux/screen}" ctop'
alias hypr="hyprland"

wodjs() {
	if [[ -d "./mariadb-init" ]] 
	then
		docker run --rm -v $HOME/.ssh/:/home/node/.ssh -v ./mariadb-init:/usr/src/app/mariadb-init -u 1000:1000 -it eopts_dockby
	else
		docker run --rm -v $HOME/.ssh/:/home/node/.ssh -u 1000:1000 -it eopts_dockby
	fi
}


alias debug_on="DOCKER_XDEBUG_MODE=debug docker compose -f ./docker-compose.yml -f ~/.work_helpers/docker-compose.override.yml up php -d"
alias debug_off="DOCKER_XDEBUG_MODE=off docker compose -f ./docker-compose.yml -f ~/.work_helpers/docker-compose.override.yml up php -d"

export IDEA_JDK=/usr/lib/jvm/jdk-jetbrains
export PATH="/opt/homebrew/bin:/usr/local/bin/jetbrains-launchers:$PATH"

# ==== Custom Prompt (Recreating old Spaceship theme without Deps) ====
is_remote() {
  [[ -n "$SSH_CONNECTION" ]]
}

git_prompt() {
  git rev-parse --is-inside-work-tree &>/dev/null || return

  local lbranch lstatus
  lbranch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git describe --tags --exact-match 2>/dev/null)

  if ! git diff --quiet --ignore-submodules HEAD 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
    lstatus=" ✚"
  fi

  echo "on %F{magenta}⎇ $lbranch$lstatus%f"
}

build_prompt() {
  local info_line="%B"

  if is_remote; then
    info_line+="%F{yellow}${USER}%f in "
  fi

  info_line+="%F{cyan}%~%f"

  if is_remote; then
    info_line+=" at %F{green}%m%f"
  fi

  local git_info=$(git_prompt)
  if [[ -n "$git_info" ]]; then
    info_line+=" $git_info"
  fi

  info_line+=$'%F{green}\n\u279C%f%b '
  
  PROMPT=$info_line
}

autoload -U add-zsh-hook
add-zsh-hook precmd build_prompt
