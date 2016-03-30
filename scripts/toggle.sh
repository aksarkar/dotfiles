#!/bin/bash
sed -i '1s/LIGHT/FOO/; 1s/DARK/LIGHT/; 1s/FOO/DARK/' $HOME/.Xresources
xrdb merge $HOME/.Xresources
