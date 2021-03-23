# vim:ft=sh:

# silence osx message about default being zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

[[ -f ~/.bash_prompt ]] && source ~/.bash_prompt

eval "$(/opt/homebrew/bin/brew shellenv)"

# bash completion
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# enable colored output from ls, etc
export CLICOLOR=1

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL

[ -d ~/bin ] && export PATH=~/bin:"$PATH"

# Git
export PATH="/opt/git/bin:$PATH"

# Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Postgres
export PATH="/usr/local/pgsql/bin:$PATH"

# load dotfiles scripts
export PATH="$HOME/.bin:$PATH"

# CHRUBY
if [ -d "/usr/local/share/chruby" ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

# RBENV
elif [ -d "$HOME/.rbenv" ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init - --no-rehash)"
fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local config
[[ -f ~/.bash_profile.local ]] && source ~/.bash_profile.local
