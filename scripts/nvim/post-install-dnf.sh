#!/bin/bash

dnf install ctags
# Don't run ctags on HOME
touch ~/.notags

dnf install wmctrl
