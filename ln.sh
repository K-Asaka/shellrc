#! /bin/sh
srcdir=$(cd $(dirname $0); pwd)

if [ -e ${HOME}/.bashrc ]; then
  echo "${HOME}/.bashrc already exists."
else
  ln -s ${srcdir}/bashrc ${HOME}/.bashrc
fi

if [ -e ${HOME}/.bash_profile ]; then
  echo "${HOME}/.bash_profile already exists."
else
  ln -s ${srcdir}/bash_profile ${HOME}/.bash_profile
fi

