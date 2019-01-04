#! /usr/bin/zsh

# ~/todo.md wrapper
todo() {
    while getopts ":ael" opt; do
        case $opt in
            l)
                mdv ~/todo.md -t Lagoona
                ;;
            e) 
                vim ~/todo.md
                ;;
            a)
                echo "- [ ] $2" >> ~/todo.md
                ;;
            \?)
                echo "Invalid option: -$OPTARG" >&2
                ;;

        esac
    done
}
autoload todo