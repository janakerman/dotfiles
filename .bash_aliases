alias ls='ls -F'
alias ll='ls -lh'
alias lt='du -sh * | sort -h'
alias count='find . -type f | wc -l'
alias tcn='mv --force -t ~/.Trash '

# Convenience
if [ -e $HOME/.bash_aliases.local ]; then
    source $HOME/.bash_aliases.local
fi
