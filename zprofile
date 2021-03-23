# vim:ft=zsh:

eval "$(/opt/homebrew/bin/brew shellenv)"

export VISUAL=vim
export EDITOR=$VISUAL
export GIT_EDITOR=$VISUAL

if [ -d "/usr/local/share/chruby" ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi

# aliases
[[ -f "~/.aliases" ]] && source ~/.aliases

# Local config
[[ -f "~/.bash_profile.local" ]] && source ~/.bash_profile.local
