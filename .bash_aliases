#!/bin/bash

# Source local bash script if exists
if [[ -f ~/.bash_aliases.local ]]; then
    source ~/.bash_aliases.local
fi

# Utilities
## Editing
alias v="search_and_edit"
alias vim="nvim"
alias vimdiff="nvim -d"
alias vimrc="vim ~/.config/nvim"
search_and_edit() {
    selection=$(fzf)
    [[ -z $selection ]] && return
    history -s vim $selection
    vim $selection
}

## Helpful aliases
alias python="python3"
alias bashrc="vim ~/.bash_aliases"
cdl() { cd "$@" && ls; }
mkd() { mkdir "$@" && cd "$@"; }

if [[ -z $FILESHARE_PATH ]]; then
    echo "WARNING: no FILESHARE_PATH defined"
else
    # Open shared todo file
    todo() {
	vim -c "cd $FILESHARE_PATH" ~/SyncThing/FileShare/TODO.md
    }
fi

## Notes
NOTES_PATH=~/.notes

# Create new note
note() {
    printf -v date '%(%Y-%m-%d)T\n' -1
    date=$(echo $date | xargs)  #trim whitespace
    vim $NOTES_PATH/${date}.txt
}

# Open note
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
if [[ -f ~/.bash_aliases.after ]]; then
    source ~/.bash_aliases.after
fi

