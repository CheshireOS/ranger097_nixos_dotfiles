{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
packages = with pkgs; [
go
gopls
delve

(python3.withPackages (pyPkgs: with pyPkgs; [
python-lsp-server
npyscreen
black
]))

gcc
gnumake
cmake
gdb
jdk21
maven
gradle
nodejs_22
elixir
elixir-ls
rustc
cargo
rust-analyzer
rustfmt
docker
docker-compose
podman
ripgrep
fd
fzf
jq
csharpier
erb_format
fantomas
fish_indent
markdown-toc
markdownlint-cli2
nixfmt
prettier
rubocop
sqlfluff
ast-grep
luarocks
zig
];


shellHook = ''
echo "rangers dev shell"


'';



} 






