while true
do
    inotifywait -r -e modify .
    ./build.sh
done
