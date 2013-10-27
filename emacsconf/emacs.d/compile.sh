#!/bin/bash

SCRIPT_DIR=$(cd $(dirname $0); pwd)
EMACS=emacs

function DoMake () {
    cd $SCRIPT_DIR/$1
    make EMACS=$EMACS
    git status | grep "modified" | grep -v "\.\." | awk '{print $3}' | xargs git checkout -- 
    cd -
}

DoMake site-lisp/cedet
DoMake site-lisp/color-theme
DoMake site-lisp/ecb
