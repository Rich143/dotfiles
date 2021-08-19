import re
import mmap

with open('speeds.txt', 'r') as f:
    data = mmap.mmap(f.fileno(), 0)
    mo = re.findall(b'Download: [0-9]?.[0-9]? Mbit/s', data)

    for m in mo:
        print(m)
