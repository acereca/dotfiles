#! /usr/bin/zsh

virtuoso() {
    case $1 in
        "")
            x2goclient --close-disconnect --link=lan --session="SuS/Work (Virtuoso)";;
        "vlsi")
            x2goclient --close-disconnect --link=lan --session="SuS/VLSI";;
        *)
            echo "What?";;
    esac
}

dintef() {
    cd $HOME/work/dintef/tools/clients
    git pull
    nvim $(fd "(\.py|\.cpp|\.h)" | fzf)
}
