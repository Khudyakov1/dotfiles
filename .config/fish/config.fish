# Trash files instead of deleting them permanently
alias rm "trash"

# Setting up a simple prompt
function fish_prompt
    set_color --bold yellow
    echo -n ╭
	set_color --bold cyan
	echo -n $(whoami)
	set_color --bold white
	echo -n @
	set_color --bold cyan
	echo $(dirs)
    set_color --bold yellow
    echo -n '╰─>$ '
	set_color normal
end

# Removing the greeting
set fish_greeting
