#!/bin/bash

if [[ $# != 1 ]]
then
    echo "usage: sh run-fpm.sh {start|restart|stop}"
    exit 1
fi

if [[ $1 == 'start' ]]
then
    php-fpm -c $HOME/local/php/etc -y $HOME/local/php/etc/php-fpm.conf -D

elif [[ $1 == 'restart' ]]
then
    kill -USR2 `cat $HOME/local/php/var/run/php-fpm.pid`
elif [[ $1 == 'stop' ]]
then
    kill -QUIT `cat $HOME/local/php/var/run/php-fpm.pid`
else
    echo 'invalid command'
fi


