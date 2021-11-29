#!/bin/bash
export PATH="/home/kwilcox/bin:$PATH"
export PATH="/opt/sublime_text:$PATH"
export PATH="/data/conda/miniconda/bin:$PATH"
export PATH="/home/kwilcox/go/bin:$PATH"
export PATH="/opt/idea/idea/bin:$PATH"

# Expand $PATH to include the directory where snappy applications go.
if [ "${PATH#*/snap/bin}" = "${PATH}" ]; then
    export PATH=$PATH:/snap/bin
fi

# For compilation of `expect` for the `unbuffer` command
EXPECT_LIBS=/usr/lib/expect5.45.3
export TCLLIBPATH=$EXPECT_LIBS
export LD_LIBRARY_PATH=$EXPECT_LIBS:$LD_LIBRARY_PATH
