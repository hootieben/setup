#!/usr/bin/env bash
#set -e
#set -u
set -o pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
echo "$DIR"
. './libs/helpers.bash'

GITLOC=""
while getopts ':g:' OPTION; do
  case "$OPTION" in
    g)
      GITLOC=${OPTARG}
      ;;
    *)
      echo "Unknown option ${*}"
      ;;
  esac
done

#shift $((OPTIND -1))

have_git(){
  if [ -z "${GITLOC}" ]; then
    GITLOC="git"
  else
    GITLOC="${GITLOC}"
  fi
  is_executable "${GITLOC}"
}

run_main() {
  if ! have_git $GITLOC; then
    echo "Git not found or executable. Bailing ..."
    exit 1
  fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]
then
  if ! run_main
  then
    exit 1
  fi
fi
