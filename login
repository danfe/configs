# $FreeBSD: src/share/skel/dot.login,v 1.17.2.1 2009/08/03 08:13:06 kensmith Exp $
#
# .login - csh login script, read by login shell, after `.cshrc' at login.
#
# see also csh(1), environ(7).
#

#if ( -x /usr/games/fortune ) /usr/games/fortune freebsd-tips

if ($term == xterm) then
	alias filter lolcat -F .01 -S 500 -p 2
else
	set esc="\033["
	set c1=`echo ${esc}40\;32\;1m`
	set c2=`echo ${esc}40\;36\;1m`
	set nc=`echo ${esc}0m`
	alias filter sed -E \''1,15s,[^9][8db,.YP<>"]+,'"${c1}&${nc},g;s,(CEO|N|B|Z).*,${c2}&${nc},"\'
	unset esc c1 c2 nc
endif

filter << EOD

                   ,d             b.
                ,d888             888b.
             ,d888888      ,      888888b.
          ,d888888888    ,d8b.    888888888b.		   CEO Workstation
        <888888888P"  ,d8888888b.  "Y888888888>
    ,db.  "Y888P"  ,d88P",d8b."Y88b.  "Y888P"  ,db.
  <888888b.  "  ,d88888  88888  88888b.  "  ,d888888>
    "Y888888b,d888888P"  "Y8P"  "Y888888b,d888888P"	  Nakatomi Socrates
    ,  "Y888888888P"  ,d8b. ,d8b.  "Y888888888P"  ,	       BSD 9.2
  <888b.  "Y888P"  ,  88888 88888  ,  "Y888P"  ,d888>
    "Y888b,  "  ,d88  "Y8P" "Y8P"  88b.  "  ,d888P"	Z-Level Central Core
       "Y888b,d888P"               "Y888b,d888P"
          "Y888P"                      "Y888P"
             "                            "

  Preliminary Clearance Approved.

EOD

unalias filter
