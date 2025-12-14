#!/bin/bash

git checkout main -- docs/public
cp -a docs/public/. docs/
rm -r docs/public
echo "Files successfuly transfered!"
