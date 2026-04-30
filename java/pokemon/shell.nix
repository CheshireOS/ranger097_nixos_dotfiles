{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
packages = with pkgs; [
go
gopls
delve
gradle

(python3.withPackages (pyPkgs: with pyPkgs; [

]))




python3
zig


];


shellHook = ''
echo "rangers default developer environment"


'';



} 






