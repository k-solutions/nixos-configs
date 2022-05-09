{pkgs, ...}:

with pkgs.vimPlugins; [            
    # Here you can place all your vim plugins
    # They are installed managed by `vam` (a vim plugin manager)
    Syntastic  # "ctrlp"
    vim-airline
    vim-airline-themes
    vim-nix # "vim-addon-nix"
    taglist
    vim-closetag
    vim-css-color
    elm-vim
    vim-elm-syntax	
    awesome-vim-colorschemes
    # vim-colorschemes	
    # "floobits-neovim"
    vim2hs
    vim2nix
    # vim-hdevtools
    vim-stylishask
    vim-elixir
    vim-lsp
    vim-json
    coc-nvim
]
