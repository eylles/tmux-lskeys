#!/bin/sh

tmux list-keys | awk 'BEGIN {printf "\033[36;1m%s \033[33;1m%-20s\033[0m %s\n","Mode","Keybind","Command"} \
                        !/copy-mode /{gsub(/copy-mode-vi/,"Copy"); gsub(/prefix/,"Pref"); \
                        gsub(/root/,"Root"); gsub(/bind-key\s+(-r)? -T /,""); \
                        printf "\033[36;1m%s \033[33;1m%-20s\033[0m ",$1,$2; for(i=3;i<=NF;++i)printf $i""FS; print "" }' | less -R

