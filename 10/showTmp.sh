#!/bin/bash
g++ main.cpp &
sleep 0.05
ls -l --color=auto /tmp/cc*
cat /tmp/cc*.s
