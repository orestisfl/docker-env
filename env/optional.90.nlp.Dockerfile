run apt-get install -y python3 python3-pip \
    && pip3 install ipython loguru notifiers tqdm

# onmt
add https://api.github.com/repos/OpenNMT/OpenNMT-py/git/refs/heads/master /tmp/version.json
run pip3 install git+https://github.com/OpenNMT/OpenNMT-py

# transformers
add https://api.github.com/repos/huggingface/transformers/git/refs/heads/master /tmp/version.json
run git clone https://github.com/huggingface/transformers/ \
    && cd transformers \
    && pip3 install -e . \
    && pip3 install torch datasets tokenizers
