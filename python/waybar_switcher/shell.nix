{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  packages = with pkgs; [
    (python3.withPackages (ps: with ps; [
      numpy pandas matplotlib scikit-learn tensorflow torch requests flask django fastapi 
      beautifulsoup4 scrapy pytest black flake8 python-lsp-server ipython 
      sqlalchemy celery redis pydantic aiohttp cryptography pillow
    ]))
    nodejs_22 corepack typescript typescript-language-server
    gcc gnumake cmake gdb pkg-config valgrind
    rustc cargo rust-analyzer rustfmt clippy
    go gopls delve
    jdk21 maven gradle
    ruby_3_3 bundler solargraph
    clojure leiningen babashka clojure-lsp
    php php83Packages.composer
    elixir elixir-ls erlang
    kotlin kotlin-language-server
    scala_3 metals sbt
    swift swiftpm
    dart flutter
    zig zls
    ghc cabal-install stack hlint
    ocaml opam
    dotnet-sdk_8
    R rPackages.languageserver
    julia-bin
    octaveFull
    perl
    lua lua-language-server
    powershell
    shellcheck shfmt
    gfortran
    nim nimlsp
    crystal shards
    vlang
    coq
    idris2
    postgresql_16 sqlite redis
    docker docker-compose podman
    ripgrep fd fzf jq git vim tmux
    awscli2 google-cloud-sdk azure-cli
    kubernetes-helm kubectl
  ];

  shellHook = ''
    echo "rangers dev shell"
  '';
}
