alias g=git
alias c=clear
# sq 2 "Add tests"
# sq 2
function sq {
    if [ -z "$1" ]
    then
        echo "First argument required"
        return 1
    fi
    if [ -z "$2" ]
    then
        message="$(git log --pretty=format:"%B" -1)"
    else
        message=$2
    fi
    git reset --soft HEAD~$1
    git commit -m "$message"
}
# count number of commit differing from master
function cnt {
    compare_branch=${1-master}
    git rev-list --count HEAD ^$compare_branch
}
