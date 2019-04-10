#!/bin/bash

cat ~/Documents/To-Do.txt | sed 's/^/ \${color #ddddff}x  \$color /g'
