#!/bin/zsh

# This file will be only read for login/terminal shells, for interactive scripts, set a .zshrc

#export GOPATH=$HOME/go
#PATH=/usr/local/opt/ruby/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:$GOPATH/bin
#

# Case-insensitive globbing
setopt NO_CASE_GLOB
# Enable auto-CD (no need to put cd before the path)
#setopt AUTO_CD

#HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
# Add a bit more data (timestamp in unix epoch time and elapsed time of the command)
setopt EXTENDED_HISTORY
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
# ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS
# let you verify the command when you use !!
setopt HIST_VERIFY

alias mv='nocorrect mv'
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'

#alias ls='ls -F --color=auto'
#alias ls='ls -GF'
alias la='ls -a'
alias lla='ls -la'
alias ll='ls -l'
alias non='ls -halt'
alias cd..='cd ..'
alias ..='cd ..'

# Store the passphrase in the macOS keychain
alias sshpi='ssh-add -K ~/.ssh/id_ed25519 && ssh ac@192.168.5.100'

# The famous rot13
rot13 () { tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]" }

# Open the man page in a new yellow Terminal window
function xman() { open x-man-page://$@ ; }
# Format man page as PDF and open with Preview
function pman() { man -t "$@" | open -f -a "Preview" ;}

# Prints the path of the front Finder window. Desktop if no window open
function pwdf () {
    osascript <<EOS
        tell application "Finder"
            if (count of Finder windows) is 0 then
                set dir to (desktop as alias)
            else
                set dir to ((target of Finder window 1) as alias)
            end if
            return POSIX path of dir
        end tell
EOS
}
# changes directory to frontmost Finder window
alias cdf='pwdf; cd "$(pwdf)"'
