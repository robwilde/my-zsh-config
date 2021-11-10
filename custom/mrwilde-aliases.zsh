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
      *.rar)       unrar x $1   ;;
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

# Export additions
export EDITOR=vim
export PATH=$PATH:/home/robert/Projects/scripts

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

alias eda='${=EDITOR} ~/.oh-my-zsh/custom/mrwilde-aliases.zsh' # quick access to my alias
alias zshrc='${=EDITOR} ~/.zshrc' # Quick access to the ~/.zshrc file
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

alias t='tail -f'

alias webcamset='bash /home/robert/webcam-output.sh'
alias phpswitch='sudo update-alternatives --config php'

alias sysinfo='inxi -Fxz'
###################################################################################################################
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

# nativefier https://rocketlog.app/daily-log --icon /home/robert/Apps/Nativefier/rocketlog/android-chrome-512x512.png --name Rocketlog \
# --height 1080 --min-width 1920 --single-instance --internal-urls 'https://rocketlog.app/*?'

nativefier https://devhints.io/ --icon /home/robert/Apps/Nativefier/devhints/devhints-icon.jpg --name DevHints \
--height 1080 --min-width 1920 --single-instance --internal-urls 'https://devhints.io/*?'

##############################################
# Lando bits
alias llapp='lando ssh -c "composer global require laravel/installer && laravel new app"'

llaravel(){
     #!/bin/bash
     if [ "$#" -eq  "0" ]
       then
         lando ssh -c "composer global require laravel/installer && laravel new app";
     else
          lando ssh -c "composer global require laravel/installer && laravel new $1";
     fi
}

laracomp(){ 
       #!/bin/bash
     if [ "$2" -eq  "0" ]
       then
         composer create-project --prefer-dist laravel/laravel $1;
     else
          composer create-project --prefer-dist laravel/laravel $1 $2;
     fi
}

###################################################################################################################
# Audio Device Settings - Pulse Aduio CMD
alias listAudioOut='pactl list short sinks'
setAudioOut(){ pactl set-default-sink "$1"; }

alias listAudioIn='pactl list short sources'
setAudioIn(){ pactl set-default-source "$1"; }

# Download youtube as mps for audio
ytmp3(){ youtube-dl -x --audio-format mp3 $1; }

# https://rastating.github.io/setting-default-audio-device-in-ubuntu-18-04/
###################################################################################################################
# Docker-Compose
# alias dbash='docker-compose exec dms_web_local bash'
alias dbashr='docker-compose exec dms_web_local bash'
alias dbash='docker-compose exec --user 1000:www-data dms_web_local bash'
alias dbasha='docker-compose exec --user dms_web_local dms_web_local bash'

dbashc(){ dbash -c "$1"; }
dbashrc(){ dbashr -c "$1"; }
dbashac(){ dbashr -c "$1"; }

###################################################################################################################
# Composer
alias dcomposer='dbashrc "php composer.phar"'
alias dcompucheck='dbashc "php composer.phar show -l"'
alias dcompul='dbashrc "php composer.phar update --lock"'
alias dcompdump='dbashr -c "php composer.phar dump-autoload"'
alias dcv='dbashrc "php composer.phar validate --no-interaction --ansi --verbose --no-check-publish --with-dependencies"'
alias dcompdiag='dbashrc "php composer.phar diagnose --no-interaction --ansi --verbose"'
dcompreq(){ dbashr -c "php composer.phar require $1"; }
dcompreqd(){ dbashr -c "php composer.phar require $1 --dev"; }

dcomprem(){ dbashr -c "php composer.phar remove $@"; }

dcomp(){ dbashc "php composer.phar $@"; }
drcomp(){ dbashrc "php composer.phar $@"; }

dcompin(){ dbashrc "php composer.phar install $@"; }

dcompupdate(){
     #!/bin/bash
     if [ "$#" -eq  "0" ]
       then
         echo "No arguments supplied";
     else
        dbashr -c "php composer.phar update $1 --with-all-dependencies --prefer-stable";
     fi
}

###################################################################################################################
# Artisan
alias dtinker='dbash -c "php artisan tinker"'
alias dclean='dbash -c "php artisan cache:clear && php artisan db:clean-seed && php artisan db:seed"'
alias dclean-seed='dbash -c "php artisan db:clean-seed"'
alias dseed='dpart db:seed'

###################################################################################################################
# NPM
dnpm(){ dbashc "npm $1"; }
dnpmr(){ dnpm "run $1"; }
dnmpa(){ dbashac "npm $1"; }

###################################################################################################################
# YARN
alias darnb='dbashc "NODE_OPTIONS=--max_old_space_size=4096"'

darn(){ dbashrc "NODE_OPTIONS=--max_old_space_size=4096 yarn $@"; }
###################################################################################################################
# DMS

# Required to complete the DMS Instatll
# php composer.phar install --no-interaction

# cd /srv/www/redeye-dms
# yarn
# yarn build
# cd /srv/www/redeye-dms/vue
# yarn
# yarn build

# cd /srv/www/redeye-dms
# php bin/console cache:clear --env=dev
# php bin/console assets:install (ainst)


# SQL for Admin Rights
# UPDATE User SET roles = 'a:3:{i:0;s:10:"ROLE_EARLY";i:1;s:16:"ROLE_SUPER_ADMIN";i:2;s:10:"ROLE_ADMIN";}' WHERE id = 7871;

###################################################################################################################
# Symfony

alias pcon='php bin/console'

# run in docker container
dcon(){ dbash -c "php bin/console $@ --no-debug"; }

alias dconent='dbash -c "php bin/console doctrine:cache:clear-metadata --no-debug \
              && php bin/console doctrine:cache:clear-query --no-debug \
              && php bin/console doctrine:cache:clear-result --no-debug"'

alias clog='truncate -s 0 var/logs/*.log'
# Symfony Commands

# doctrine:cache:clear-result
# doctrine:cache:clear-metadata
# doctrine:cache:clear-query

# XDEBUG_CONFIG=profiler_output_name=cachegrind.out.R% XDEUB_MODE=profile docker-compose up
# xdebug.profiler_output_name=cachegrind.out.R%
# xdebug.output_dir=/srv/www/redeye-dms/docs/xdebug

alias xon='dbashr -c "phpenmod xdebug; service php7.4-fpm stop; sleep 1; service php7.4-fpm start"'
alias xoff='dbashr -c "phpdismod xdebug; service php7.4-fpm stop; sleep 1; service php7.4-fpm start"'

alias xonp='dbashr -c "service php7.4-fpm stop \
                      && sleep 1 \
                      && echo -n xdebug.profiler_output_name=cachegrind.out.R%
                      && service php7.4-fpm start"'

################################################################################################################
# Docker
alias ddown='docker-compose down --remove-orphans'
alias ddownv='docker-compose down --remove-orphans --volumes'
alias dcr='docker-compose run'

dcu(){
  #!/usr/bin/bash

  DIR=$(pwd);
  FILE="/.env";
  LAPTOP_IP=$(hostname -I | awk '{print $1}');
  HOST_IP="HOST_IP=$LAPTOP_IP";
  echo "$HOST_IP";
  sed -i "s/HOST_IP=[^\"]*/$HOST_IP/" "$DIR$FILE";

  docker-compose -f docker-compose.override.yml up $@;
}

alias dcup='XDEBUG_CONFIG=profiler_output_name=cachegrind.out.R% XDEUB_MODE=profile docker-compose up'

dbuildt(){
    #!/usr/bin/bash
     if [ "$#" -eq  "0" ]
       then
         echo "No arguments supplied";
     else
        sudo chown -R robert:www-data webwrite;
        DOCKER_BUILDKIT=1 docker build --add-host=proxy:10.51.60.20 -t infoxchange/srs:$1 .;
     fi
}

dbuildtf(){
    #!/usr/bin/bash
     if [ "$#" -eq  "0" ]
       then
         echo "No arguments supplied";
     else
        sudo chown -R robert:www-data webwrite;
        DOCKER_BUILDKIT=1 docker build --add-host=proxy:10.51.60.20 -t infoxchange/srs:$1 -f $2 .;
     fi
}

alias dockviz="docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock nate/dockviz"

###########################################################################################
# Codeception
alias codecept='dbash -c "bin/codecept run Unit --steps"'

dcodecept(){ dbash -c "bin/codecept $@"; }
alias dccb='dcodecept build'
alias dcccl='dcodecept clean'

# Legacy testing
dccl(){ dbash -c "php vendor/bin/codecept run Legacy $1 --steps"; }
dccld(){ dbash -c "php vendor/bin/codecept run Legacy $1 --steps --debug"; }
dcclr(){ dbash -c "php vendor/bin/codecept run Legacy $1 --steps --report --html"; }

# Unit Testing
dccu(){ dbash -c "bin/codecept run Unit $1 --steps"; }
dccud(){ dbash -c "bin/codecept run Unit $1 --steps --debug"; }
dccur(){ dbash -c "bin/codecept run Unit $1 --steps --report --html"; }

# behat feature tests
dccaf(){ dbash -c "php vendor/bin/codecept run Acceptance -n -vv -f $@"; }
dccafd(){ dbash -c "php vendor/bin/codecept run Acceptance -n -vvv -f tests/Feature/$@"; }

# Codeception feature tests
dcca(){ dbash -c "php bin/codecept run Acceptance -n -vv -f tests/Acceptance/$1"; }
dccad(){ dbash -c "php bin/codecept run Acceptance -n -vvv -f tests/Acceptance/$1"; }

dccag(){ dbash -c "php vendor/bin/codecept run Acceptance -n -vvv -f -g $1"; }

###########################################################################################
# PHPUnit

alias dpu='dbash -c "bin/phpunit --testsuite unit --no-coverage"'
alias dpus='dbash -c "bin/simple-phpunit --testsuite unit --dont-report-useless-tests --stop-on-failure"'
alias dpusr='dbash -c "bin/simple-phpunit --testsuite unit --dont-report-useless-tests --testdox-html /srv/www/redeye-dms/dms-unit.html"'

# dpunit(){ dbash -c "bin/phpunit $@";}

dphpunit(){ dbash -c "bin/phpunit $@"; }

# phpunit --filter methodName path/to/file.php
dpuf(){ dbash -c "bin/phpunit --filter $1 $2"; }

dpusf(){ dbash -c "bin/simple-phpunit --filter $@"; }
dpusfd(){ dbash -c "bin/simple-phpunit --debug --color --testdox --filter $@"; }

dpug(){ dbash -c "bin/phpunit --group $1"; }

###########################################################################################
# PHP inspection tools in docker
alias phploc='docker run -it --rm -v "$PWD":/app -w /app adamculp/php-code-quality:latest \
php /usr/local/lib/php-code-quality/vendor/bin/phploc -v --names "*.php" \
--exclude "vendor" . > ./doc/phploc.txt'

alias phpmd='docker run -it --rm -v "$PWD":/app -w /app adamculp/php-code-quality:latest \
php /usr/local/lib/php-code-quality/vendor/bin/phpmd . xml codesize --exclude 'vendor' \
--reportfile "./doc/phpmd_results.xml"'

# https://www.phpmetrics.org/index.html
alias phpmetrics='docker run -it --rm -v "$PWD":/app -w /app adamculp/php-code-quality:latest \
php /usr/local/lib/php-code-quality/vendor/bin/phpmetrics --excluded-dirs 'vendor' \
--report-html=./docs/metrics_results .'

alias phpdepends='docker run -it --rm -v "$PWD":/app -w /app adamculp/php-code-quality:latest \
php /usr/local/lib/php-code-quality/vendor/bin/pdepend --ignore="vendor" \
--summary-xml="./doc/pdepend_output.xml" \
--jdepend-chart="./doc/pdepend_chart.svg" \
--overview-pyramid="./doc/pdepend_pyramid.svg"'

alias phpcomp='docker run --rm -it --init -v "$PWD:$PWD" -w "$PWD" tophfr/phpcompatibility -p \
  --ignore=vendor,node_modules --report=json --report-file=./phpcompatibility_results.json --runtime-set testVersion 7. .'

alias phpstan='docker run -v $PWD:/app --rm ghcr.io/phpstan/phpstan'
###########################################################################################

dpart(){ dbash -c "php artisan $1"; }

alias hostips="ip addr show |grep 'inet '|grep -v 127.0.0.1 |awk '{print $2}'| cut -d/ -f1"

# File permissions
down(){ dbash -c "chown -R 1000:www-data $1"; }

alias dhosts='sudo php $MRWILDE_PROJ/docker-hosts.php'
alias dhostsl='sudo php $MRWILDE_PROJ/docker-hosts-log-errors.php'
dashit(){ bash $MRWILDE_PROJ/dashit $1 $2 $3; }

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
