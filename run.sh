#!/bin/bash
# simple script that executes the main shell script and 
# redirects the output to a log file and the screen via the handy dandy tee command

bash scripts/dev.sh | tee ~/setup.log