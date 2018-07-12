ac() {
  export PATH="/data/conda/miniconda/bin:$PATH"
}
sa() {
  ac
  source activate $1
}
sd() {
  source deactivate
}
