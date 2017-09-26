
# Defaults
export VISUAL=nano

# Aliases
alias c='clear'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# copy the working directory path
alias cpwd='pwd|tr -d "\n"|pbcopy'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Networking
alias ports='netstat -tulan'
alias ip="curl icanhazip.com"

# Permissions
alias chx='chmod 755' #executable
alias chr='chmod 644' #read and write
alias ax="chmod a+x" #executable

# Docker stuff
alias di='docker image'
alias dc='docker-compose'

# Git stuff

# scm_breeze - https://github.com/scmbreeze/scm_breeze
[ -s "/Users/$(whoami)/.scm_breeze/scm_breeze.sh" ] && source "/Users/$(whoami)/.scm_breeze/scm_breeze.sh"


# Git alias
alias g='git'
alias g_conflict_view='g diff --name-only --diff-filter=U'


# Macbook power management shortcuts
alias ddd='pmset displaysleepnow'       # sleeps display only
alias zzz='pmset sleepnow'              # sleeps computer