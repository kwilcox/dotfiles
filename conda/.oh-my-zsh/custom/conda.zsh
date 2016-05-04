ac() {
  export PATH="$HOME/miniconda3/bin:$PATH"
}
sa() {
  ac
  source activate $1
}
sd() {
  source deactivate
}
