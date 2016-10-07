#!/bin/bash
function kill_tcp(){
  lsof -i :$1 | tail -n +2 | awk '{print $2}' | xargs kill -9
}

kill_tcp $1
