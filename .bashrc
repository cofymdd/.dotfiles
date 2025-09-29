if uwsm check may-start; then
	exec uwsm start hyprland-uwsm.desktop
fi

[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto'
alias grep='grep --color=auto'

export VISUAL=helix
export EDITOR="${VISUAL}"
