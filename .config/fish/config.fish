if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

function update
	sudo pacman -Sy
	sudo powerpill -Su
	paru -Su --aur --devel
end
