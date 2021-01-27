#!/usr/bin/env python3
import re
import sys
from glob import glob
from subprocess import run


def main(args):
    assert len(args) >= 1

    from_image = args.pop(0)
    optional = [x for x in map(str.strip, args) if x]
    optional_used = set()

    with open("Dockerfile", "w") as fout:
        print(f"from {from_image}", file=fout)

        for fname in sorted(glob("*.Dockerfile")):
            if fname.startswith("optional."):
                if any(x in fname for x in optional):
                    optional_used.add(
                        re.search(
                            r"^optional\.(\d*\.)?(\S+?)\.Dockerfile$", fname
                        ).groups()[1]
                    )
                else:
                    continue

            with open(fname) as fin:
                print(fin.read().strip(), file=fout)

    our_tag = "orestisfl/env"
    if optional_used:
        our_tag += "-" + "-".join(sorted(optional_used))
    our_tag += ":" + from_image.split(":", 1)[1]
    print(our_tag)
    return run(["docker", "build", "-t", our_tag, "."], check=True)


if __name__ == "__main__":
    print(main(sys.argv[1:]), file=sys.stderr)
