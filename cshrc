# $FreeBSD: src/share/skel/dot.cshrc,v 1.14 2007/05/29 22:07:57 dougb Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 50
alias j		jobs -l
alias ls	ls -FG
alias la	ls -a
alias lf	ls -FA
alias ll	ls -lA
alias cp	cp -p
alias grep	grep --color
alias n		netstat -anf inet
alias psg	ps auxww \| grep
alias ds	find . -type f -print0 \| xargs -0 ls -l \| awk \''{ i += $5; } END { print i; }'\'
alias pwgen	pwgen -sy 14
alias fp	find /tmp/usr/ports
alias gb	grep \''[[:blank:]]$'\'

alias vmake	make MASTER_SITE_OVERRIDE=''
alias lmake	make MASTER_SITE_OVERRIDE=ftp://linux/distfiles/
alias tmake	make PREFIX=/tmp/j

alias vi	nvi
alias ytd	env http_proxy=localhost:7777 youtube-dl -t -c
alias lssh	luit -encoding koi8-r ssh
alias lvds	xrandr --output LVDS		# notebook screen
alias vga	xrandr --output VGA		# external display
alias vt	xrandr --output VGA --auto	# toggle external display

# A righteous umask
umask 22

#set path = (/sbin /bin /usr/sbin /usr/local/bin /usr/bin /usr/games /usr/local/sbin $HOME/bin)
set path = (/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)
set echo_style = both

setenv EDITOR vi
setenv PAGER less
setenv LESS -is
#setenv BLOCKSIZE K
setenv LSCOLORS ExGxFxdxCxDxDxhbadExEx

if ($?prompt) then
	# An interactive shell -- set some stuff up
	if ($term == xterm) then
		set prompts = ( \
			'%{\033[38;5;123m%}%l%{\033[38;5;51m%}@%{\033[38;5;45m%}%m:%{\033[38;5;39m%}%c02%{\033[38;5;245m%}%#%{\033[0;0m%} ' \
			'%{\033[38;5;226m%}%l%{\033[38;5;220m%}@%{\033[38;5;214m%}%m:%{\033[38;5;38m%}%c02%{\033[38;5;246m%}%#%{\033[0;0m%} ' \
			'%{\033[38;5;118m%}%l%{\033[38;5;49m%}@%{\033[38;5;45m%}%m:%{\033[38;5;39m%}%c02%{\033[38;5;245m%}%#%{\033[0;0m%} ' \
			'%{\033[38;5;190m%}%l%{\033[38;5;118m%}@%{\033[38;5;40m%}%m:%{\033[38;5;38m%}%c02%{\033[38;5;246m%}%#%{\033[0;0m%} ' \
			'%{\033[38;5;203m%}%l%{\033[38;5;214m%}@%{\033[38;5;220m%}%m:%{\033[38;5;38m%}%c02%{\033[38;5;248m%}%#%{\033[0;0m%} ' \
			'%{\033[38;5;225m%}%l%{\033[38;5;219m%}@%{\033[38;5;213m%}%m:%{\033[38;5;200m%}%c02%{\033[38;5;246m%}%#%{\033[0;0m%} ' \
			)
		@ index = `date +%S` % $#prompts + 1
		set prompt = "$prompts[$index]"
		unset prompts index
		setenv LANG ru_RU.UTF-8
		alias cwdcmd 'printf "\033]2;${HOST}:$cwd\007\033]1;$cwd\007"'
		cwdcmd
	else
		#set prompt = "[%n%B@%b%m%B:%b%l%B:%b%?] %B%~%b%# "
		#set prompt = "[%n@%m:%l:%?] %~%# "
		set prompt = "%U%m%u%B:%b%c02%# "
	endif
	set filec
	set history = 10000
	set savehist = (10000 merge)
	set mail = (/var/mail/$USER)
	if ( $?tcsh ) then
		bindkey "^W" backward-delete-word
		bindkey -k up history-search-backward
		bindkey -k down history-search-forward
		bindkey "^R" i-search-back
		bindkey "^D" list-or-eof
		bindkey "^?" delete-char
		# Hacks for stupid PuTTY (remember to set backspace = ^h)
		bindkey "^[[3~" delete-char
		bindkey "^[[1~" beginning-of-line
		bindkey "^[[4~" end-of-line
	endif
endif
