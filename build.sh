#!/usr/bin/env bash

menu() {
    clear
    echo "NEUS Project - Virtual Development Environments"
    echo "-----------------------------------------------"
    echo "Which image would you like to build?\n"
    echo "  [a] PAMM Development (Virtual Box) Vagrant Base Box - No UI"
    echo "  [b] PAMM Development (Virtual Box) - Desktop UI"
    echo "  [c] PAMM Development (VMWare) - CI"
    echo "  [d] PAMM Development (VMWare) - Server UI"
    echo "  [e] CI Compact (VMWare) - No UI"
    echo "  [x] Refresh downloaded packages"
    echo "  [q] Quit Menu"

    read answer
    case $answer in
        a|A) build pamm pamm-dev-txt-vbox-vg.json;;
        b|B) build pamm pamm-dev-gui-vbox.json;;
        c|C) build pamm pamm-dev-vmware.json;;
        d|D) build pamm pamm-dev-gui-vmware.json;;
        e|E) build ci-compact ci-compact-vmware.json;;
        x|X) refreshing_cache;;
        q|Q) exit;;
    esac
}

build() {
    clear
    echo "Starting build process => $2\n"
    sh fetch.sh
    cd ./envs/$1
    packer build $2
    cd ../..
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