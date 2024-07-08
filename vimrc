filetype indent plugin on

" Enable syntax highlighting
syntax on
colorscheme lunapeach        " awesome colorscheme 
  try
    let g:hybrid_custom_term_colors = 1
    let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
    colorscheme  srcery  
    let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1 
  catch
  endtry

  set hidden
  set lazyredraw          " redraw only when we need to.
  set showmatch           " highlight matching [{()}]
 
  " Better command-line completion
  set wildmenu
   
  " Show partial commands in the last line of the screen
  set showcmd             " Show (partial) command in status line.
  set showmatch           " Show matching brackets.
  set showmode            " Show current mode.
  set ruler               " Show the line and column numbers of the cursor.
  set number              " Show the line numbers on the left side.
  set formatoptions+=o    " Continue comment marker in new lines.
  set textwidth=0         " Hard-wrap long lines as you type them.

  set expandtab           " Insert spaces when TAB is pressed.
  set tabstop=2           " Render TABs using this many spaces.
  set shiftwidth=2        " Indentation amount for < and > commands.
  set softtabstop=2       " Sets the number of columns for a TAB 
  set smarttab	

  set noerrorbells        " No beeps.
  set modeline            " Enable modeline.
  set esckeys             " Cursor keys in insert mode.
  set linespace=0         " Set line-spacing to minimum.
  set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

  " More natural splits
  set splitbelow          " Horizontal split below current.
  set splitright          " Vertical split to right of current.

  if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
  endif
  if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
  endif
  set display+=lastline
  set nostartofline       " Do not jump to first character with pa
  set hlsearch            " Enable search highlights (needs ghcMod)
  set pastetoggle=        " Use F11 to toggle between paste and nopaste
  set confirm             " Present dialog instead of failing commands
  set mouse=a             " enable mouse

  # vim folding
  set foldmethod=syntax
  set foldnestmax=10
  set foldlevel=2
  set nofoldenable 

  " Stylish Haaskell settings
  set formatprg=stylish-haskell
  " HLint integration settings
  let g:syntastic_haskell_checkers = ['hlint']
  " Elixir mix fomrater option
  set formatprg=mix\ format\ 
  " Enable plugins and load plugin for the detected file type.
  filetype plugin on
  " Enable Omnicomplete features
  " set omnifunc=syntaxcomplete#Complete
  
  " Autocomplete Bash like
  set wildmode=longest,list,full
	set wildmenu
	vmap <Leader>ggd <Plug>(coc-definition)
	map <Leader>ggi <Plug>(coc-implementation)
	map <Leader>ggt <Plug>(coc-type-definition)
	map <Leader>gh :call CocActionAsync('doHover')<cr>
	map <Leader>gn <Plug>(coc-diagnostic-next)
	map <Leader>gp <Plug>(coc-diagnostic-prev)
	map <Leader>gr <Plug>(coc-references)

	map <Leader>rn <Plug>(coc-rename)
	map <Leader>rf <Plug>(coc-refactor)
	map <Leader>qf <Plug>(coc-fix-current)

	map <Leader>al <Plug>(coc-codeaction-line)
	map <Leader>ac <Plug>(coc-codeaction-cursor)
	map <Leader>ao <Plug>(coc-codelens-action)

	nnoremap <Leader>kd :<C-u>CocList diagnostics<Cr>
	nnoremap <Leader>kc :<C-u>CocList commands<Cr>
	nnoremap <Leader>ko :<C-u>CocList outline<Cr>
	nnoremap <Leader>kr :<C-u>CocListResume<Cr>

	inoremap <silent><expr> <c-space> coc#refresh()
	inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

	autocmd CursorHold * silent call CocActionAsync('highlight')
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')>

  nnoremap <silent> <C-]> :call CocActionAsync('jumpDefinition')

  " Ocaml highlights
   let g:ocaml_highlight_operators = 1
   let g:ocaml_compiler_compact_messages = 0 


  " Go TagBar config
   let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }
