#!/bin/sh
#
#
#
#HOM="A"
echo ${HOM:-"hom"}
echo "$HOM"
echo ${HO:="ho"}
echo "$HO"
echo ${HOM:?"Not exist."}
echo "$HOM"
echo ${HOME:+"/home"}
echo "$HOME"

