#!/usr/bin/env bash

menu() {
    clear
    echo "NEUS Project - Virtual Development Environments"
    echo "-----------------------------------------------"
    echo "Which image would you like to build?\n"
    echo "  [a] PAMM Development Vagrant Base Box - No UI"
    echo "  [b] PAMM Development Virtual Box - Desktop UI"
    echo "  [c] PAMM Development VMWare - Desktop UI"
    echo "  [x] Refresh downloaded packages"
    echo "  [q] Quit Menu"

    read answer
    case $answer in
        a|A)    build pamm-dev-tty-vbox-vg.json;;
        b|B)    build pamm-dev-gui-vbox.json;;
        c|C)    not_implemented;;
        x|X)    refreshing_cache;;
        q|Q)    exit;;
    esac
}

build() {
    clear
    echo "Starting build process => $1\n"
    sh fetch.sh
    cd pamm
    packer build $1
    cd ..
    menu
}

not_implemented() {
    clear;
    echo "The option is not implemented yet! :(\n";
    read -r -p "Press ENTER to go back to the menu..." key
    menu
}

refreshing_cache() {
    clear;
    sh fetch.sh "clean";
    menu;
}

menu