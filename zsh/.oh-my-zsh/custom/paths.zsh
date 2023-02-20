#!/bin/bash
export PATH="/home/kwilcox/bin:$PATH"
export PATH="/data/conda/miniconda/bin:$PATH"
export PATH="/home/kwilcox/go/bin:$PATH"
export PATH="/opt/idea/idea/bin:$PATH"

# Expand $PATH to include the directory where snappy applications go.
if [ "${PATH#*/snap/bin}" = "${PATH}" ]; then
    export PATH=$PATH:/snap/bin
fi
