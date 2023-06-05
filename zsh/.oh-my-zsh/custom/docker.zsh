alias dk='docker'

dkb() {
  if [ ! -z "$1" ]; then
    docker exec -it $1 bash
  else
    echo "Provide container name as a parameter"
  fi
}

dkl() {
  if [ ! -z "$1" ]; then
    lines="${2:-100}"
    docker logs --tail $lines -f $1
  else
    echo "Provide container name as a parameter"
  fi
}
