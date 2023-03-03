#!/bin/bash -eu

ssh-keygen -t rsa -b 4096 -C "" -f $(pwd)/key/id_rsa -N ""
