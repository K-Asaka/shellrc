# $FreeBSD: releng/11.1/share/skel/dot.login 278616 2015-02-12 05:35:00Z cperciva $
#
# .login - csh login script, read by login shell, after `.cshrc' at login.
#
# see also csh(1), environ(7).
#

# Set LANG
switch ( `tty` )
case /dev/console:
case /dev/ttyv[0-9]:
    setenv LC_CTYPE C
    setenv LANG     C
    breaksw
default:
    setenv LC_CTYPE ja_JP.UTF-8
    setenv LANG     ja_JP.UTF-8
    breaksw
endsw

if ( -x /usr/bin/fortune ) /usr/bin/fortune freebsd-tips
