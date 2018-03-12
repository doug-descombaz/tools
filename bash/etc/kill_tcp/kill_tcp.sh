#!/bin/bash
#Load this from your .bash_profile so the function is generally available
function kill_tcp(){
  lsof -i :$1 | tail -n +2 | awk '{print $2}' | xargs kill -9
}

#Go ahead and run it if the script is called directly
if[ -n "$1" ];
then
  kill_tcp $1
fi
