#!/usr/bin/env python3
import os
import sys
from glob import glob

exclude = os.getenv("_EXCLUDE")
exclude = exclude.split(":") if exclude else []

with open("Dockerfile", "w") as fout:
    print("from " + os.getenv("_FROM", "orestisfl/llvm"), file=fout)

    for fname in glob("*.Dockerfile"):
        if fname in exclude:
            print(f"Excluding {fname}", file=sys.stderr)
            continue

        with open(fname) as fin:
            print(fin.read().strip(), file=fout)
