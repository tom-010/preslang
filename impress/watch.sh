while true
do
    inotifywait -r -e modify .
    ./build_presentation.sh
done
