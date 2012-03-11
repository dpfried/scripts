#!/bin/bash

base="/home/dfried/screens/"
ext=".png"
i=0

while [[ -f ${base}${i}${ext} ]] ; do
    let i=i+1
done

scrot ${base}${i}${ext} 
