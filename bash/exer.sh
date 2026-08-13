#!/usr/bin/env bash

exer() {
read -p "exercism token: " token
exercism configure --token="$token" > /dev/null 2>&1
tokenStatus=$?
exercism configure -w /home/ranger/Projects/Exercism/ > /dev/null 2>&1
workspaceStatus=$?

if [[ tokenStatus -eq 0 && workspaceStatus -eq 0 ]]; then
  echo "succussfully applied API token and workspace configuration"
elif [[ tokenStatus -ne 0 && workspaceStatus -eq 0 ]]; then
  echo "workspace succeeded but API token failed"
elif [[ tokenStatus -eq 0 && workspaceStatus -ne 0 ]]; then
  echo "API token succeeded but workspace failed"
else
  echo "API token and workspace failed"
fi
}

exer
