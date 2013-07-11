#################################################################################
#                                                                               #
# +---------------------------------------------------------------------------+ #
# |                                                                           | #
# |  Do not put sensitive information here, it is uploaded to other servers!  | #
# |                                                                           | #
# +---------------------------------------------------------------------------+ #
#                                                                               #
#################################################################################


PATH=$HOME/.bin:$PATH
export PATH
export LC_ALL=""
export LC_TIME="en_DK.utf8"
PS1="\e[1;32m - \h:\W$\e[m "
HISTSIZE=10000
HISTFILESIZE=10000
HISTCONTROL=ignoredups


alias c='clear;pwd;whoami'
echo "Sourced .bash_profile"
