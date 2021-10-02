#!/usr/bin/env bash

PWD=$(pwd)

function handle_exit {
  cd $PWD
  echo 'FAILED!!!'
  exit 1
}
trap 'handle_exit' ERR

COMMIT_MSG=$1
if [ -z "$COMMIT_MSG" ]; then
  echo 'Commit message is required!'
  exit 2
fi

git branch | grep get-pip_for_python2.6.6
if [ $? -ne 0 ]; then
  echo "get-pip forked repo must be in git branch get-pip_for_python2.6.6"
  exit 1
fi

python3 scripts/generate.py
git commit -a -m "${COMMIT_MSG}"
git push origin get-pip_for_python2.6.6
echo ''
echo 'pip for python 2.6 link'
echo 'https://raw.githubusercontent.com/rogerhil/pip/pip_9.0.3/pip_for_py26/pip-9.0.3-py2.py3-none-any.whl'
echo ''
echo 'get-pip.py link'
echo 'https://raw.githubusercontent.com/rogerhil/pip/pip_9.0.3/pip_for_py26/pip-9.0.3-py2.py3-none-any.whl'
echo
