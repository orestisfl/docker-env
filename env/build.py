#!/usr/bin/env python3
import sys
from glob import glob
from subprocess import run

EXCLUDE = {
    "10": ["50.alive2.Dockerfile",],
    "latest-10": [],
    "latest": [],
}


def main(args):
    assert len(args) == 1

    from_image = args.pop()
    our_tag = from_image.split(":", 1)[1]
    exclude = EXCLUDE[our_tag]

    with open("Dockerfile", "w") as fout:
        print(f"from {from_image}", file=fout)

        for fname in sorted(glob("*.Dockerfile")):
            if fname in exclude:
                print(f"Excluding {fname}", file=sys.stderr)
                continue

            with open(fname) as fin:
                print(fin.read().strip(), file=fout)

    return run(["docker", "build", "-t", f"orestisfl/env:{our_tag}", "."], check=True)


if __name__ == "__main__":
    print(main(sys.argv[1:]), file=sys.stderr)
