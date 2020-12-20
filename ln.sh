#! /bin/sh
srcdir=$(cd $(dirname $0); pwd)

if [ ${SHELL}=='/bin/zsh' ]; then
    if [ -f ${HOME}/.zshenv ]; then
      echo "${HOME}/.zshenv already exists."
    else
      ln -s ${srcdir}/.zshenv ${HOME}/.zshenv
    fi
    if [ -e ${HOME}/.zsh ]; then
      echo "${HOME}/.zsh already exists."
    else
      ln -s ${srcdir} ${HOME}/.zsh
    fi
fi

