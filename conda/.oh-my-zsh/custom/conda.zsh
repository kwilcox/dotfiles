#!/bin/bash
. /data/conda/miniconda/etc/profile.d/conda.sh
conda activate

sa() {
  conda activate $1
}
sd() {
  conda deactivate
}
