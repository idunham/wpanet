[ -z "$1" ] && exit 1
BASENAME=`basename $0`
case $1 in
 start)  start
 ;;
 restart|force-reload) stop; start
 ;;
 stop)  stop 
 ;;
 help)
   case $extra_commands in
     *help*)  help
     ;;
     *) echo -n "Usage: $0 start | stop "
     echo $extra_commands $extra_started_commands | \
       sed -e 's/\([^ ]\) \([^ ]\)/\1 | \2/g' -e 's/^\(.\)/| \1/g'
     ;;
   esac
 ;;
 *)
   case "$extra_commands $extra_started_commands" in
     *" $1 "*|"$1 "*|*" $1")
       $1
    ;;
    *) echo "$0: $1 is not supported"
   esac
 ;;
esac


