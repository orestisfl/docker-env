#!/usr/bin/env python3
import sys
from glob import glob
from subprocess import run


def main(args):
    assert len(args) == 1

    from_image = args.pop()
    our_tag = from_image.split(":", 1)[1]

    with open("Dockerfile", "w") as fout:
        print(f"from {from_image}", file=fout)

        for fname in sorted(glob("*.Dockerfile")):
            with open(fname) as fin:
                print(fin.read().strip(), file=fout)

    return run(["docker", "build", "-t", f"orestisfl/env:{our_tag}", "."], check=True)


if __name__ == "__main__":
    print(main(sys.argv[1:]), file=sys.stderr)
