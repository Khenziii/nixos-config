#!/bin/sh

source ~/.bashrc

cd $(getnixpath activitywatch)/bin

./aw-watcher-afk &
./aw-watcher-window &
./aw-server
