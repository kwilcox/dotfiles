alias dk='docker'

dkb() {
  if [ ! -z "$1" ]; then
    docker exec -it $1 bash
  else
    echo "Provide container name as a parameter"
  fi
}
