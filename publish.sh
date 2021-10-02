#!/usr/bin/env bash
set -x

PWD=$(pwd)

function handle_exit {
  cd $PWD
}
trap 'handle_exit' EXIT

sdfasdfas

COMMIT_MSG=$1

git branch | grep get-pip_for_python2.6.6
if [ $? -ne 0 ]; then
  echo "get-pip forked repo must be in git branch get-pip_for_python2.6.6"
  exit 1
fi
echo "Sleeping for 10 seconds"
sleep 10
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
