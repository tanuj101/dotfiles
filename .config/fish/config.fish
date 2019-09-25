#!/bin/bash
~/.bash_profile
set fish_greeting
alias g "git"
alias gc "git checkout"
alias gm "git merge"
alias gr "git rebase"
alias gp "git push"
alias gs "git status"
alias c "clear"
alias e "exit"
alias l "ls"
alias cp "cp -rv"
alias mv="mv -v"
alias mk="make run"
function cd
  builtin cd $argv
  ls
end
