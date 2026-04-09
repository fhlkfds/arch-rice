#!/bin/bash

sudo pacman -S ansible git 


ansible-playbook -i localhost, -c local site.yml --ask-become-pass
