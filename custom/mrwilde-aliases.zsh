#
# # ex - archive extractor
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export EDITOR=nano

alias pacman-update='sudo pacman-mirrors --geoip'

alias ls='ls --color=auto'
alias ll='ls -l'
# ls, the common ones I use a lot shortened for rapid fire usage
alias l='ls -lFh --color=auto'     #size,show type,human readable
alias la='ls -lAFh --color=auto'   #long list,show almost all,show type,human readable
alias lr='ls -tRFh --color=auto'   #sorted by date,recursive,show type,human readable
alias lt='ls -ltFh --color=auto'   #long list,sorted by date,show type,human readable
alias ll='ls -l --color=auto'      #long list
alias ldot='ls -ld .* --color=auto'
alias lS='ls -1FSsh --color=auto'
alias lart='ls -1Fcart --color=auto'
alias lrt='ls -1Fcrt --color=auto'

alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

alias webcamset='bash /home/robert/webcam-output.sh'

# Command line head / tail shortcuts
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g P="2>&1| pygmentize -l pytb"

alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias diskusage='ncdu'


alias dbash='docker-compose exec app bash'
alias dbashr='docker-compose exec app bash'
alias dbashw='docker-compose exec --user www-data app bash'
alias dbasha='docker-compose exec --user app app bash'

dbashc(){ dbash -c "$1"; }
dbashrc(){ dbashr -c "$1"; }
dbashac(){ dbashr -c "$1"; }

alias dcomposer='dbash -c "composer install"'
alias dcompucheck='dbash -c "composer show -l"'
alias dcd='dbash -c "composer dump-autoload"'
alias dcv='dbash -c "composer validate --no-interaction --ansi --verbose --no-check-publish --with-dependencies"'

alias dgw='dbash -c "gulp watch"'
alias dtinker='dbash -c "php artisan tinker"'
alias dclean='dbash -c "php artisan cache:clear && php artisan db:clean-seed && php artisan db:seed"'
alias dclean-seed='dbash -c "php artisan db:clean-seed"'
alias dseed='dpart db:seed'

alias dphpunit='dbash -c "php vendor/bin/phpunit"'

phpDoc(){ php /usr/local/bin/phpDocumentor.phar $1; }

ytmp3(){ youtube-dl -x --audio-format mp3 $1; }

alias cnpm='sudo rm -rf node_modules bower_components'
dnpm(){ dbashc "npm $1"; }
dnpmr(){ dnpm "run $1"; }
dnmpa(){ dbashac "npm $1"; }

alias ddown='docker-compose down --remove-orphans'
alias ddownv='docker-compose down --remove-orphans --volumes'
alias dcu='docker-compose up -d'
alias dcr='docker-compose run'

dcompupdate(){
     #!/bin/bash
     if [ "$#" -eq  "0" ]
       then
         echo "No arguments supplied";
     else
        dbash -c "composer update $1";
     fi
}

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

alias dbehat='dbash -c "php vendor/bin/behat --format=progress --colors --no-interaction --verbose=2 --stop-on-failure"'
dbehatname(){ dbash -c "php vendor/bin/behat --format=pretty --colors --no-interaction --verbose=2 --stop-on-failure --name='$1' $2"; }
dbehatfile(){ dbash -c "php vendor/bin/behat --format=pretty --format=progress --colors --no-interaction --verbose=2 --stop-on-failure $1"; }
dbehattag(){ dbash -c "php vendor/bin/behat --format=progress --colors --no-interaction --verbose=2 --stop-on-failure --tags='$1'"; }
dbehattagp(){ dbash -c "php vendor/bin/behat --format=progress --format=pretty --colors --no-interaction --verbose=2 --stop-on-failure --tags='$1'"; }

# Codeception
alias codecept='vendor/bin/codecept'

alias dccb='dbash -c "php vendor/bin/codecept build"'
dcodecept(){ dbash -c "php vendor/bin/codecept $1"; }
dwcodecept(){ dbashw -c "php vendor/bin/codecept $1"; }
# docker codeception run legacy
dccl(){ dbash -c "php vendor/bin/codecept run Legacy $1 --steps" }
dccld(){ dbash -c "php vendor/bin/codecept run Legacy $1 --steps --debug" }
dcclr(){ dbash -c "php vendor/bin/codecept run Legacy $1 --steps --report" }

dccag(){ dcodecept "run acceptance -g $1"; }

dpunitname(){ dbash -c "php vendor/bin/phpunit $1"; }
dpunitfilter(){ dbash -c "php vendor/bin/phpunit --filter $1 $2"; }
dpunitgroup(){ dbash -c "php vendor/bin/phpunit --group $1"; }

dpart(){ dbash -c "php artisan $1"; }

# File permissions
down(){ dbash -c "chown -R 1000:www-data $1"; }


alias dhosts='sudo php /media/robert/linux-dev/projects/infoxchange/docker-hosts.php'
alias dhostsl='sudo php /media/robert/linux-dev/projects/infoxchange/docker-hosts-log-errors.php'

alias gitclean='git branch -d $(git branch --merged=develop | grep -v develop)'
alias prettyg="git log --graph --pretty=oneline --abbrev-commit"

gitref(){ git reflog --date=iso | grep "HEAD@{$1"; }

git-standup() {
    AUTHOR=${AUTHOR:="`git config user.name`"}

    since=yesterday
    if [[ $(date +%u) == 1 ]] ; then
        since="2 days ago"
    fi

    git log --all --since "$since" --oneline --author="$AUTHOR"
}

gitfile(){"git fetch && git checkout origin/develop -- $1";}
