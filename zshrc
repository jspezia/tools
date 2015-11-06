export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Definition du path
PATH=$HOME/.brew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin

# Gestion de l'historique
HISTFILE=~/.zshrc_history
SAVEHIST=5000
HISTSIZE=5000
setopt inc_append_history
setopt share_history

# zsh completion:
fpath=(~/GitHub/zsh-completions/src $fpath)


# Correction de la touche Delete
bindkey "\e[3~"   delete-char

# Autocompletion de type menu
autoload -U compinit && compinit
zstyle ":completion:*" menu select

# Couleur prompt
autoload -U colors && colors

# Definition des couleurs
# source ~/.ls_colors

# Definition des variables
USER=`/usr/bin/whoami`
export USER
GROUP=`/usr/bin/id -gn $user`
export GROUP
MAIL="$USER@student.42.fr"
export MAIL

# Lockscreen
alias lockscreen="/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine"


# Definition du prompt
PROMPT="%T %n@%m:%~
> "

precmd ()
{
    ISGIT=$(git status 2> /dev/null)
    if [ -n "$ISGIT" ]
    then
		BRANCH=$(git branch | cut -d " " -f 2 | tr -d "\n")
		STATUS=$(echo "$ISGIT" | grep "modified")
		if [ -n "$STATUS" ]
		then
			COLOR="%{$fg[red]%}"
		else
			REMOTE_EXIST=$(git branch -a | grep "remotes/origin/$BRANCH")
			if [ -n "$REMOTE_EXIST" ]
			then
				REMOTE=$(git diff origin/$BRANCH $BRANCH)
				if [ -n "$REMOTE" ]
				then
				    COLOR="%{$fg[yellow]%}"
				else
					COLOR="%{$fg[green]%}"
				fi
			else
				COLOR="%{$fg[green]%}"
			fi
		fi
		NORMAL="%{$reset_color%}"
		RPROMPT="%{$COLOR%}($BRANCH)%{$NORMAL%}"
    else
		RPROMPT=""
    fi
}

# Definition des alias de git
alias ga="git add"
alias gb="git branch"
alias gcm="git commit -m"
alias gco="git checkout"
alias gpl="git pull"
alias gps="git push"
alias gm="git merge"
alias gu="git add -u"
alias gs="git status"

# Definition des alias
alias c="clear"
alias cc="clang -Wall -Wextra -Werror"
alias files_s="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias files_h="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"
alias gccf="gcc -Wall -Wextra -Werror"
alias gccl="gcc -I ~/libft/includes -L ~/libft -lft"
alias gcclf="gcc -Wall -Wextra -Werror -I ~/libft/includes -L ~/libft -lft"
alias ls="ls -G"
alias l="ls -l"
alias la="ls -lA"
alias modsh="emacs ~/.zshrc"
alias p="prin"
alias rl="source ~/.zshrc"
alias v="vim"
alias py="python"
alias ip="ipython"
alias ipn="ipython notebook"

# Coloration du man
man()
{
    env \
	LESS_TERMCAP_mb=$(printf "\e[1;31m") \
	LESS_TERMCAP_md=$(printf "\e[1;31m") \
	LESS_TERMCAP_me=$(printf "\e[0m") \
	LESS_TERMCAP_se=$(printf "\e[0m") \
	LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
	LESS_TERMCAP_ue=$(printf "\e[0m") \
	LESS_TERMCAP_us=$(printf "\e[1;32m") \
	man "$@"
}

# Experimental
TERM=xterm-256color

# MacPort
export PATH=${PATH}:/opt/local/bin
