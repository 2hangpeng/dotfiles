#!/bin/bash

set -e

# Set editor
git config --global core.editor "vim"
# Set ignore file
git config --global core.excludesfile $HOME/dotfiles/git/gitignore_global
# Set git init default branch name
git config --global init.defaultBranch main
# Set auto setup remote branch
git config --global push.autoSetupRemote true

# Set the global user name and email
git config --global user.name 2hangpeng
git config --global user.email zhangpeng.0304@aliyun.com

# Set alias
git config --global alias.graph "log --graph --all --date=format:'%Y-%m-%d %H:%M:%S' --pretty=format:'%Cred%h%Creset - %s %Cgreen(%ad)%Creset %C(bold blue)%an%Creset %C(yellow)%d%Creset'"
git config --global alias.aliases "config --get-regexp alias"
git config --global alias.last "log -1 HEAD"
git config --global alias.amend "commit --amend --reuse-message=HEAD"
git config --global alias.update "fetch --all --prune"
git config --global alias.purge '!bash -c "git branch -r | awk '\''{print \$1}'\'' | grep -E -v -f /dev/fd/0 <(git branch -vv | grep origin) | awk '\''{print \$1}'\'' | xargs -r git branch -D"'
git config --global alias.uncommit "reset --soft HEAD~1"
git config --global alias.unstage "reset HEAD --"
git config --global alias.stat "diff --stat"
