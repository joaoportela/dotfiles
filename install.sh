#! /bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# link dotfiles
for f in "gitconfig" "vimrc"
do
  cp --verbose -s "${DIR}/${f}" "${HOME}/.${f}"
done

# source bashrc_append from bashrc
if grep --quiet bashrc_append ${HOME}/.bashrc; then
  echo bashrc_append is already installed
else
  cat << EOF >> ${HOME}/.bashrc

if [ -f "${DIR}/bashrc_append" ]; then
  source "${DIR}/bashrc_append"
fi
EOF
fi

