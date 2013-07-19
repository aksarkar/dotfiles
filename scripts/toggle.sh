#!/bin/bash
sed -i '1s/LIGHT/FOO/; 1s/DARK/LIGHT/; 1s/FOO/DARK/; 2s/8.5/0/; 2s/12/8.5/; 2s/0/12/' $HOME/.Xresources
xrdb merge $HOME/.Xresources
