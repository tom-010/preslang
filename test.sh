#!/bin/bash

for dir in * ; do
  if [ -d $dir ] ; then 
    cd $dir
    echo ===============================================
    echo "Testing $dir"
    echo ===============================================
    mix test
    cd ..
  fi
done

