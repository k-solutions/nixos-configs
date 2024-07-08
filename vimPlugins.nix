{pkgs, ...}:

with pkgs.vimPlugins; [            
    # Here you can place all your vim plugins
    # They are installed managed by `vam` (a vim plugin manager)
    Syntastic  # "ctrlp"
    vim-airline
    vim-airline-themes
    vim-nix 
    vim-addon-nix
    taglist
    vim-closetag
    vim-css-color
    elm-vim
    vim-elm-syntax	
    awesome-vim-colorschemes
    vim-colorschemes	
    # "floobits-neovim"
    vim2hs
    vim2nix
    # vim-hdevtools
    vim-stylishask
    vim-elixir
    vim-lsp
    # vimm-lsp-settings
    vim-json
    vim-go
    vim-ruby 
    coc-nvim
    # Rust
    rust-vim
    coc-rust-analyzer
    coc-go
    coc-yaml
    # Haskell
    vim-hoogle
    haskell-vim
    # OCaml
    vim-ocaml	 
    # TreeSitter settings
    nvim-treesitter-parsers.haskell
    nvim-treesitter-parsers.ruby
    nvim-treesitter-parsers.rust
    # Airline
    airline
    vim-airline
    vim-helm 
    ale
    tagbar 
    # (fromGitHub "HEAD" "rust-lang/rust.vim") 	
    purescript-vim
    # aiken-lang/editor-integration-nvim	
]
