#!/bin/sh

ls -t /home/clockmovie/Documents/Notes/pdf/*.pdf | grep -m1 "" | xargs zathura & 
