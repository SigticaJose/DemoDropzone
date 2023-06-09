#!/bin/sh
sudo docker build -t myimage:v1 .

sudo docker run -it --rm myimage:v1