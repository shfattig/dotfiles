
# Project specific
## Command aliases
alias start_syncthing="$HOME/SyncThing/syncthing-linux-amd64-v1.21.0/syncthing"
alias ms_server="ssh -p 7822 shaunfat@68.66.226.103"

## Shortcuts
alias homesite="cd Projects/HomeSite/; source setup;"
alias mysite="cd ~/Projects/mysite; source setup"

###### FREELANCING ######
FREELANCE_DIR="$HOME/Projects/Freelancing"

start_work () {
    start=$SECONDS
    pids=()

    [[ -z $1 ]] && { echo "Please provide project name"; return 1; } || project_name=$1

    project_dir="${FREELANCE_DIR}/${project_name}"
    echo "Starting work for ${project_name} at ${project_dir}"

    echo "Starting firefox"
    firefox -P Freelancing &
    pids+=($!)

    echo "Starting email"
    thunderbird &
    pids+=($!)

    echo "Starting vscode"
    code "$project_dir/code" &
    pids+=($!)

    echo "Starting impress"
    libreoffice --impress "${project_dir}/docs/ProjectNotes.odp" &
    pids+=($!)

    echo "Waiting for pids"
    # wait for all pids
    for pid in ${pids[*]}; do
        wait $pid
    done

    duration=$(( SECONDS - start ))
    # calculate minutes w/ 2 decimals
    minutes_worked=$(echo "scale=1; $duration/60" | bc)
    echo "${minutes_worked} minutes worked"

    echo "writing to file"
    # write to file
    work_log_path="${project_dir}/docs/.work_log"
    echo "$(date): $minutes_worked" >> $work_log_path

}


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


alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

source ~/.bash_aliases.local

