#!/bin/bash
sed -i 't done; s/light/dark/; t; s/dark/light/; :done' ~/.config/alacritty/alacritty.toml
