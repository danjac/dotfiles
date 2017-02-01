#!/bin/bash
 
#walls_dir=$HOME/Dropbox/backdrops
walls_dir=$HOME/Pictures/favorites
selection=$(find $walls_dir -type f -name "*.jpg" -o -name "*.png" -o -name "*.jpe" | shuf -n1)
gsettings set org.gnome.desktop.background picture-uri "file://$selection"
