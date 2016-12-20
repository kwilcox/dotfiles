alias dk='docker'
# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'
# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'
# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'
# Delete all dangling volumes
alias dockercleanv='printf "\n>>> Deleting dangling volumes\n\n" && docker volume rm $(docker volume ls -q -f dangling=true)'

dockerclean() {
    dockercleanc
    dockercleani
    dockercleanv
}

dkb() {
  if [ ! -z "$1" ]; then
    docker exec -it $1 bash
  else
    echo "Provide container name as a parameter"
  fi
}
