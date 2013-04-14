# $FreeBSD: src/share/skel/dot.cshrc,v 1.14 2007/05/29 22:07:57 dougb Exp $
#
# .cshrc - csh resource script, read at beginning of execution by each shell
#
# see also csh(1), environ(7).
#

alias h		history 25
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

alias vmake	make MASTER_SITE_OVERRIDE=''
alias lmake	make MASTER_SITE_OVERRIDE=ftp://linux/distfiles/
alias tmake	make PREFIX=/tmp/j

alias vi	nvi
alias ytd	env http_proxy=localhost:7777 youtube-dl -t -c
alias lssh	luit -encoding koi8-r ssh
# XXX: what does `ns' stand for? i forgot :(
alias nsoff	xrandr --output LVDS --off

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
		setenv LANG ru_RU.UTF-8
		alias cwdcmd 'printf "\033]2;${HOST}:$cwd\007\033]1;$cwd\007"'
		cwdcmd
	endif
	set prompt = "%m:%~%# "
	#set prompt = "[%n%B@%b%m%B:%b%l%B:%b%?] %B%~%b%# "
	#set prompt = "[%n@%m:%l:%?] %~%# "
	#set prompt = "%{[`echotc AF 2`%n`echotc me`@`echotc AF 5`%m`echotc me`:`echotc AF 3`%l`echotc me`:`echotc AF 1`%?`echotc me`] `echotc AF 6`%~`echotc me`%}%# "
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
