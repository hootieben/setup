is_executable(){
  local CMD="${1}"
  if hash "$CMD" 2>/dev/null; then
    return 0
  else
    echo "${0}: $CMD not found or not executable"
    return 1
  fi
}

is_directory(){
  local DIR="${1}"
  if [ -d "$DIR" ]; then
    return 0
  else
    echo "${0}: ${DIR} not found or not a directory"
    return 1
  fi
}
