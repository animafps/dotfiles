export PATH=$HOME/bin:/usr/local/bin:$PATH

source "${HOME}/.zgenom/zgenom.zsh"

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

alias update='sudo pacman -Sy && sudo powerpill -Su && yay -Su'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ix() {
            local opts
            local OPTIND
            [ -f "$HOME/.netrc" ] && opts='-n'
            while getopts ":hd:i:n:" x; do
                case $x in
                    h) echo "ix [-d ID] [-i ID] [-n N] [opts]"; return;;
                    d) $echo curl $opts -X DELETE ix.io/$OPTARG; return;;
                    i) opts="$opts -X PUT"; local id="$OPTARG";;
                    n) opts="$opts -F read:1=$OPTARG";;
                esac
            done
            shift $(($OPTIND - 1))
            [ -t 0 ] && {
                local filename="$1"
                shift
                [ "$filename" ] && {
                    curl $opts -F f:1=@"$filename" $* ix.io/$id
                    return
                }
                echo "^C to cancel, ^D to send."
            }
            curl $opts -F f:1='<-' $* ix.io/$id
        }


eval "$(starship init zsh)"
