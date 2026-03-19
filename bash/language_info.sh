#!/bin/bash


  get_lang_info() {
      if ls *.go >/dev/null 2>&1 && command -v go >/dev/null 2>&1; then
        echo "  v$(go version | awk '{print $3}' | sed 's/go//')"
      elif ls *.py >/dev/null 2>&1 && command -v python >/dev/null 2>&1; then
        echo "  v$(python --version | awk '{print $2}')"
      elif ls *.rs >/dev/null 2>&1 && command -v rustc >/dev/null 2>&1; then
        echo "  v$(rustc --version | awk '{print $2}')"
      elif ls *.ts >/dev/null 2>&1 && command -v tsc >/dev/null 2>&1; then
        echo "  v$(tsc -v | awk '{print $2}')"
      elif { ls *.js >/dev/null 2>&1 || [[ -f package.json ]]; } && command -v node >/dev/null 2>&1; then
        echo "   v$(node -v | sed 's/v//')"
      elif ls *.rb >/dev/null 2>&1 && command -v ruby >/dev/null 2>&1; then
        echo "  v$(ruby -v | awk '{print $2}')"
      elif ls *.php >/dev/null 2>&1 && command -v php >/dev/null 2>&1; then
        echo "    v$(php -v | head -n 1 | awk '{print $2}')"
      elif ls *.ex* >/dev/null 2>&1 && command -v elixir >/dev/null 2>&1; then
        echo "  v$(elixir -v | grep Elixir | awk '{print $2}')"
      elif { ls *.clj >/dev/null 2>&1 || [[ -f deps.edn ]]; } && command -v clojure >/dev/null 2>&1; then
        echo "  v$(clojure --version 2>&1 | awk '{print $3}')"
      elif ls *.kt >/dev/null 2>&1 && command -v kotlinc >/dev/null 2>&1; then
        echo "  v$(kotlinc -version 2>&1 | awk '{print $3}' | cut -d'-' -f1)"
      elif ls *.java >/dev/null 2>&1 && command -v java >/dev/null 2>&1; then
        echo "  v$(java -version 2>&1 | awk -F '"' '/version/ {print $2}')"
      elif ls *.sh >/dev/null 2>&1; then
        echo "  v''${BASH_VERSION%%(*}"
      elif ls *.cpp >/dev/null 2>&1 || ls *.hpp >/dev/null 2>&1; then
        echo "  C++"
      elif ls *.c >/dev/null 2>&1 && command -v gcc >/dev/null 2>&1; then
        echo "  v$(gcc -dumpversion)"
      elif ls *.hs >/dev/null 2>&1 && command -v ghc >/dev/null 2>&1; then
        echo "  v$(ghc --version | awk '{print $8}')"
      elif ls *.scala >/dev/null 2>&1 && command -v scala >/dev/null 2>&1; then
        echo "  v$(scala -version 2>&1 | awk '{print $4}')"
      elif ls *.ml >/dev/null 2>&1 && command -v ocaml >/dev/null 2>&1; then
        echo "  v$(ocaml -vnum)"
      elif ls *.dart >/dev/null 2>&1 && command -v dart >/dev/null 2>&1; then
        echo "  v$(dart --version | awk '{print $4}')"
      elif ls *.zig >/dev/null 2>&1 && command -v zig >/dev/null 2>&1; then
        echo "  v$(zig version)"
      elif ls *.cs >/dev/null 2>&1 && command -v dotnet >/dev/null 2>&1; then
        echo "    v$(dotnet --version | head -n 1)"
      elif ls *.lua >/dev/null 2>&1 && command -v lua >/dev/null 2>&1; then
        echo "  v$(lua -v | awk '{print $2}')"
      elif ls *.r >/dev/null 2>&1 && command -v R >/dev/null 2>&1; then
        echo "    v$(R --version | head -n 1 | awk '{print $3}')"
      elif ls *.jl >/dev/null 2>&1 && command -v julia >/dev/null 2>&1; then
        echo "  v$(julia --version | awk '{print $3}')"
      elif ls *.nim >/dev/null 2>&1 && command -v nim >/dev/null 2>&1; then
        echo "  v$(nim --version | head -n 1 | awk '{print $4}')"
      elif ls *.cr >/dev/null 2>&1 && command -v crystal >/dev/null 2>&1; then
        echo "  v$(crystal --version | head -n 1 | awk '{print $2}')"
      elif ls *.v >/dev/null 2>&1 && command -v v >/dev/null 2>&1; then
        echo "  v$(v version | awk '{print $2}')"
      elif ls *.swift >/dev/null 2>&1 && command -v swift >/dev/null 2>&1; then
        echo "  v$(swift --version | head -n 1 | awk '{print $4}')"
      elif ls *.nix >/dev/null 2>&1; then
        echo -e "\e[35m   \e[36mnix v$(nix --version | awk '{print $3}')"
      elif [[ -f Dockerfile ]]; then
        echo "   docker"
      elif ls *.md >/dev/null 2>&1; then
        echo " \[\e[0m\] md"
      fi
    }
