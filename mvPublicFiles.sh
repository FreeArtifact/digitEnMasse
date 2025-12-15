#!/bin/bash

git checkout main -- docs/public
sleep 5
cp -a docs/public/. docs/
sleep 2
rm -r docs/public
echo "Files successfuly transfered!"
echo "Don't forget to add, commit, and push!!!"
