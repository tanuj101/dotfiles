#!/bin/bash
~/.bash_profile
set fish_greeting
alias g "git"
alias vim "nvim"
alias gc "git checkout"
alias gm "git merge"
alias msfconsole="msfconsole --quiet -x \"db_connect msf_user@msf_database\""
alias gr "git rebase"
alias gp "git push"
alias gs "git status"
alias c "clear"
alias e "exit"
alias l "ls --group-directories-first"
alias ll "ls -l --group-directories-first"
alias cp "cp -rv"
alias mv="mv -v"
alias mk="make run"
function cd
  builtin cd $argv
  ls
end
function fcd
  if set -q argv[1]
        set searchdir $argv[1]
    else
        set searchdir $HOME
    end

    # https://github.com/fish-shell/fish-shell/issues/1362
    set -l tmpfile (mktemp)
    find $searchdir \( ! -regex '.*/\..*' \) ! -name __pycache__ -type d | fzf > $tmpfile
    set -l destdir (cat $tmpfile)
    rm -f $tmpfile

    if test -z "$destdir"
        return 1
    end
    cd $destdir
end

bind \cg 'fcd'

if status is-login
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end
