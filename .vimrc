version 8.0

"Vim setting
set nocp
filetype plugin on
syntax on
set autoindent
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set hlsearch
set encoding=utf-8
syntax enable
set wrap
set laststatus=2
set scrolloff=2
set ruler
set wildmenu
set title
set background=dark
set foldmethod=indent
set incsearch
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END
set backspace=indent,eol,start
set nospell
set cursorline
set modeline
set formatoptions+=j
set history=1000
set nu
set noshowmode
set helplang=En
set autoread
set list
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set fileencodings=utf-8
set belloff+=ctrlg
set nofoldenable
let g:nord_italic_comments = 1
let g:nord_italic = 1
let g:nord_bold_vertical_split_line = 1
let g:nord_bold = 1
au BufRead,BufNewFile *.py set filetype=python
au BufRead,BufNewFile *.py set syntax=python
au BufRead,BufNewFile *.rs set foldmethod=syntax
au BufRead,BufNewFile *.vimrc set filetype=vim

"Key-bindings
nnoremap <buffer> K :<C-u>execute "!pydoc " . expand("<cword>")<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>
nmap <silent> <C-k> :Startify<CR>
nn <space> za
nn <C-space> zM
nn <C-end> G
nn <C-home> gg
nmap <silent> <leader>q :bp!<bar>sp!<bar>bn!<bar>bd!<CR>
nmap <silent> <leader>h :set nohl
nn <F1> :vert bo term <Enter>
nn <F2> :bo term <Enter>
nn <silent><F5> :TagbarForceUpdate <Enter>
nn <silent><M-a> :NERDTreeToggle<Enter>

"if has("gui_running")

"CTRLP settings

"NERDTree settings
let NERDTreeShowBookmarks=1

"Kite settings
set completeopt+=menuone
set completeopt+=noinsert
set completeopt-=preview
let g:kite_supported_languages = []
let g:kite_tab_complete=1

" air-line settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

"vim-latex settings
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
set conceallevel=3

"startify settings
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

"ultisnips settings
let g:UltiSnipsExpandTrigger="<c-q>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-a>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetStorageDirectoryForUltiSnipsEdit="\MyProgs\Vim\GVim64\bundle\vim-snippets\UltiSnips"

"youcompleteme settings

"vimtex settings

"gundo settings

"vim-rainbow settings
let g:rainbow_active = 1
"Plugins
call plug#begin('~/.vim/bundle')
  Plug 'kovisoft/slimv'
  Plug 'ctrlpvim/ctrlp.vim'
    let g:ctrlp_use_caching = 1
    let g:ctrlp_clear_cache_on_exit = 0
    let g:ctrlp_cache_dir = '~/.cache/ctrlp'
  Plug 'yegappan/mru'
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'vim-airline/vim-airline'
  Plug 'mhinz/vim-startify'
  Plug 'arcticicestudio/nord-vim'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'lervag/vimtex'
    au VimEnter * let g:ycm_semantic_triggers.tex=g:vimtex#re#youcompleteme
  Plug 'sjl/gundo.vim'
    let g:gundo_prefer_python3=1
  Plug 'luochen1990/rainbow'
  Plug 'zah/nim.vim'
  Plug 'myusuf3/numbers.vim'
  Plug 'ollykel/v-vim'
  "Plug 'morhetz/gruvbox'
    "let g:gruvbox_contrast_dark='medium'
    "highlight lineNr guiFg=#665c54
  Plug 'ycm-core/YouCompleteMe'
    let g:ycm_key_list_stop_completion = [ '<C-y>', '<Enter>' ]
    let g:ycm_language_server =
    \ [
    \   {
    \     'name': 'rust',
    \     'cmdline': ['rust-analyzer'],
    \     'filetypes': ['rust'],
    \     'project_root_files': ['Cargo.toml']
    \   }
    \ ]
    let g:ycm_semantic_triggers =  {
          \   'javascript': [ 're!\w' ],
    \ }
"  Plug 'rust-lang/rust.vim'
  Plug 'dense-analysis/ale'
    let g:ale_rust_use_clippy=1
    let g:ale_fixers={'rust': ['rustfmt']}
    let g:ale_fix_on_save=1
  Plug 'preservim/tagbar'
  Plug 'jiangmiao/auto-pairs'
call plug#end()

set background=dark
set termguicolors
colorscheme nord
set guifont=FiraCode\ Nerd\ Font:h17
let g:snipMate = { 'snippet_version' : 1 }
set go-=m
set go-=T
set go-=r
set go-=L
autocmd VimEnter * tabnew ~/.vimrc
autocmd VimEnter * set filetype=vim
autocmd VimEnter * tabp
autocmd VimEnter *
            \   if !argc()
            \ |   Startify
            \ |   wincmd w
            \ | endif
au GUIEnter * sim ~x
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
"endif
