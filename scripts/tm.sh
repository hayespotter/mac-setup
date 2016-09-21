#!/bin/bash
# configures time machine for the office

sudo tmutil setdestination /Volumes/Time\ Machine
sudo tmutil enable
sudo tmutil startbackup
