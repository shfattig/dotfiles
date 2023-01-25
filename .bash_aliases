#!/bin/bash

# Utilities
alias python="python3"
alias v="search_and_edit"
alias vim="nvim"
alias vimdiff="nvim -d"
vim_config_path=~/.vimrc
alias vim_config="vim ${vim_config_path}"
nvim_config_path=~/.config/nvim/init.vim
alias nvim_config="vim ${nvim_config_path}"
alias vimrc="nvim_config"
alias bashrc="vim ~/.bash_aliases"
todo() {
    FILESHARE_PATH=~/SyncThing/FileShare
    vim -c "cd $FILESHARE_PATH" ~/SyncThing/FileShare/TODO.md
}
cdl() { cd "$@" && ls; }

search_and_edit() {
    selection=$(fzf)
    [[ -z $selection ]] && return
    vim $selection
}

note() {
    printf -v date '%(%Y-%m-%d)T\n' -1
    date=$(echo $date | xargs)  #trim whitespace
    vim ~/.notes/${date}.txt
}

NOTES_PATH=~/.notes
notes() {
    selection=$(ls -r $NOTES_PATH | fzf --preview="less ${NOTES_PATH}/{}")
    [[ -z $selection ]] && return
    vim $NOTES_PATH/$selection
}

# Use Telescope live_grep to search for a
# string in current directory
search_files() {
    nvim -c "Telescope live_grep theme=dropdown"
}
# "find file"
alias ff="search_files"

search_notes() {
    pushd $NOTES_PATH > /dev/null
    search_files
    popd > /dev/null
}
# "find note"
alias fn="search_notes"

# command used to track dotfiles in git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Source local bash script if exists
if [[ -f ~/.bash_aliases.local ]]; then
    source ~/.bash_aliases.local
fi

