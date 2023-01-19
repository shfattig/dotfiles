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
alias todo="vim ~/SyncThing/FileShare/TODO.md"
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

notes() {
    notes_path=~/.notes
    selection=$(ls $notes_path | fzf --preview="less ${notes_path}/{}")
    [[ -z $selection ]] && return
    vim $notes_path/$selection
}

# command used to track dotfiles in git
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Source local bash script if exists
if [[ -f ~/.bash_aliases.local ]]; then
    source ~/.bash_aliases.local
fi

