#!/bin/bash
## https://gist.github.com/bonelifer/9d12e13b8465c213d2d2
## 
## A simple little shell script that will return the current
## fingerprint on the SSL certificate and replace it in 
## pianobar's config file automatically
##
## Author: William Jacoby (bonelifer) <>
##
## Base on the Github Gist by Bob Saska at: https://gist.github.com/r35krag0th/4173333
##

## Assign the output of the openssl command to a variable for later use
tlsFingerPrint=`openssl s_client -connect tuner.pandora.com:443 < /dev/null 2> /dev/null | \
openssl x509 -noout -fingerprint | tr -d ':' | cut -d'=' -f2`

## Debug outpout line
## echo "$tlsFingerPrint"

## Change this line to point to your pianobar config file
file="/home/pi/.config/pianobar/config"

## Go ahead and rewrite the tls_fingerprint line in pianobar's config file
sed -ie "s/^tls_fingerprint =.*/tls_fingerprint = $tlsFingerPrint/" $file
