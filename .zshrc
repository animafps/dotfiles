export PATH=$HOME/bin:/usr/local/bin:$PATH

fpath+=$HOME/.config/zsh/plugins/zsh-completions/src

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='nano'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

export PNPM_HOME="/home/luke/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
export EDITOR="/usr/bin/nano"
export PATH="$HOME/.cargo/env:$PATH"

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(starship init zsh)"
