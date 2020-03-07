# Gets GPG working with Git
export GPG_TTY=$(tty)

# Jenv config
if [ -f $(brew --prefix)/bin/jenv ]; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Go config
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Ruby config
export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH"

# Brew config
export PATH="/usr/local/sbin:$PATH"

# Lua
if [ -f $(brew --prefix)/bin/luarocks ]; then
  eval $(luarocks path --bin)
fi

# Shared bash history. If set, the value is executed as a command prior to issuing each primary prompt.
export PROMPT_COMMAND='history -a'

# Auto-completion - completion files from ~/.bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Git prompt - https://github.com/magicmonty/bash-git-prompt
if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
  __GIT_PROMPT_DIR=$(brew --prefix)/opt/bash-git-prompt/share
  GIT_PROMPT_ONLY_IN_REPO=0
  GIT_PROMPT_COMMAND_OK="${Green}✔ " # displays as ✔
  GIT_PROMPT_COMMAND_FAIL="${Red}✘-_LAST_COMMAND_STATE_ " # displays as ✘-1 for exit code 1
  GIT_PROMPT_THEME=Solarized
  source "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh"
fi
