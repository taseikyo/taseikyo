#!/bin/bash

counts=$(ls images/*.gif | wc -l)

python3 -c """
import random
cur=random.randint(0, $((counts-1)))
print(f'today eveonecat index: {cur}')
with open('README.md', encoding='utf-8') as f:
    lines = f.readlines()
    for idx, line in enumerate(lines):
        if line.find('gif') > 0:
            lines[idx]=f'      <img src=\"https://github.com/taseikyo/taseikyo/blob/master/images/{cur}.gif\" />\n'
            break

with open('README.md', 'w', encoding='utf-8') as f:
    f.write(''.join(lines))
"""
