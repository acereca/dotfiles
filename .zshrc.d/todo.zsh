#! /usr/bin/zsh

# ~/todo.md wrapper
todo() {
    while getopts ":ael" opt; do
        case $opt in
            l)
                #mdv ~/todo.md -t Lagoona
                pandoc -i ~/todo.md -o /tmp/todo.pdf;
                zathura /tmp/todo.pdf
                ;;
            e)
                $EDITOR ~/todo.md
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
