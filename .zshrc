export PATH=$HOME/bin:/usr/local/bin:$PATH

source "${HOME}/.config/zsh/zgenom/zgenom.zsh"

zgenom autoupdate

# if the init script doesn't exist
if ! zgenom saved; then
    # specify plugins here
    zgenom ohmyzsh

    zgenom ohmyzsh plugins/git
    zgenom ohmyzsh plugins/sudo
    zgenom ohmyzsh plugins/colored-man-pages

    zgenom load unixorn/fzf-zsh-plugin
    zgenom load zdharma-continuum/fast-syntax-highlighting
    zgenom load zsh-users/zsh-history-substring-search
    zgenom load chrissicool/zsh-256color
    zgenom load zsh-users/zsh-completions src
    zgenom load RobSis/zsh-completion-generator
    zgenom load peterhurford/git-it-on.zsh
    zgenom load zsh-users/zsh-autosuggestions

    # generate the init script from plugins above
    zgenom save
fi

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
