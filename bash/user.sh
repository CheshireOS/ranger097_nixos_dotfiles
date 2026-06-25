#!/bin/usr/env bash

git_user() {
read -p 'name: ' name
read -p 'email: ' email
git config --global user.name "$name"
git config --global user.email "$email"
}
