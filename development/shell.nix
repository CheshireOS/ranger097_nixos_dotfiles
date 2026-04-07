{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
packages = with pkgs; [
go
gopls
delve

(python3.withPackages (pyPkgs: with pyPkgs; [

]))

python
zig


];


shellHook = ''
echo "rangers default developer environment"


'';



}
