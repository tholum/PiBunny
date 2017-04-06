#!/bin/bash
cd /usr/src
git clone https://github.com/hak5/bashbunny-payloads.git
rsync -a /usr/src/bashbunny-payloads/payloads/ /test/

