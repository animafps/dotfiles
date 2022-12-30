# Created by newuser for 5.9
[[ -e ~/.profile ]] && emulate sh -c 'source ~/.profile'

export PNPM_HOME="/home/luke/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export EDITOR="/usr/bin/nano"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
