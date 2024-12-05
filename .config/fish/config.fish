if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

function update
	sudo pacman -Sy
	sudo powerpill -Su
	paru -Su --aur --devel
end

function cpr
  rsync -zv --archive --partial -hh --info=stats1,progress2 --modify-window=1 $argv
end

function mvr
  rsync -zv --archive -hh --partial --info=stats1,progress2 --modify-window=1 --remove-source-files $argv
end

set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
