" VIM Plug and plugins
" --------------------
call plug#begin("~/.vim/vimplugins")
    Plug 'dense-analysis/ale'
    Plug 'jlanzarotta/bufexplorer'
    Plug 'Raimondi/delimitMate'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'ervandew/supertab'
    Plug 'tmhedberg/SimpylFold'
    Plug 'godlygeek/tabular'
    Plug 'preservim/tagbar'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'tpope/vim-fugitive'
    Plug 'plasticboy/vim-markdown'
    Plug 'xolox/vim-misc'
    Plug 'xolox/vim-notes'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-unimpaired'
    Plug 'preservim/vimux'
    Plug 'tridactyl/vim-tridactyl'

    "" Themes
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'altercation/vim-colors-solarized'
    Plug 'sickill/vim-monokai'
call plug#end()

" In-built plugins
packadd cfilter

" GUI settings
" ------------
set termguicolors
set t_Co=256
set t_ut=
colorscheme PaperColor
set bg=dark

set colorcolumn=88 tw=88
set nowrap

set ruler wildmenu hidden visualbell noerrorbells mousehide
set history=1000
set undolevels=1000
set scrolloff=3
set shortmess=atI
set wildmenu wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class,tags
set noswapfile
set pastetoggle=<f2>

set foldmethod=syntax
set foldopen-=search
set nofoldenable

" Vim text settings
" -----------------
filetype indent plugin on
syntax on
set ffs=unix,mac,dos " Support all three fileformats, in this order
set encoding=utf-8

" Behaviour settings
" ------------------
" Coding style preferences
"set expandtab tabstop=8 softtabstop=4 shiftwidth=4 " Defaults to mixed mode
set expandtab tabstop=4 softtabstop=4 shiftwidth=4 " Defaults to mixed mode
set shiftround
set smarttab
set autoindent copyindent
set backspace=indent,eol,start

" Search behaviour
set incsearch
set ignorecase smartcase
set gdefault
set hlsearch

" Japanese IME setting
set imdisable imcmdline
set iminsert=1
set imsearch=1

" Ignore directories when searching
set wildignore+=**/node_modules/**,**/vendor/**,**/migrations/**,**/__pycache__/**

" Auto redraw if necessary
au FocusGained * :redraw!

" Macros and keymapping
" ---------------------
" Map leader
let mapleader=","

" Motion mappings
nnoremap ' `
nnoremap ` '
map H ^
map L $
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
nnoremap <C-Tab> gt
nnoremap <Leader>rts :%s/\s\+$/<CR>
nnoremap <silent> <Leader>nh :silent :nohlsearch<CR>
nnoremap <Leader>dos :set fileformat=dos<CR>
nnoremap <Leader>unix :set fileformat=unix<CR>
nmap . .`[

" Folding mappings
nnoremap <silent> <Leader>f1 :set foldlevel=1<CR>
nnoremap <silent> <Leader>f2 :set foldlevel=2<CR>
nnoremap <silent> <Leader>f3 :set foldlevel=3<CR>
nnoremap <silent> <Leader>fa :set foldlevel=0<CR>
nnoremap <silent> <Leader>f0 :set foldlevel=999<CR>

" Replacement patterns
inoremap qq <Esc>

" Formatting
vmap Q gq
nmap Q gqap

" Forget the arrow keys!!!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Autocompletion
:inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Mappings for plugins
nnoremap <Leader>w :set wrap!<CR>

" Sudo save - when I forget to sudo before editing the file
cmap w!! w !sudo tee % > /dev/null

" Tab patterns
" Mixed mode - half tabs are spaces
nnoremap <Leader>0t :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nnoremap <Leader>2t :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nnoremap <Leader>4t :set expandtab tabstop=4 shiftwidth=4<CR>
nnoremap <Leader>4ft :set noexpandtab tabstop=4 softtabstop=4 shiftwidth=4<CR>
nnoremap <Leader>8t :set expandtab tabstop=8 shiftwidth=8<CR>
nnoremap <Leader>8ft :set noexpandtab tabstop=8 softtabstop=8 shiftwidth=8<CR>

" Line swapping
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
	return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
	return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

noremap <silent> <c-s-k> :call <SID>swap_up()<CR>
noremap <silent> <c-s-j> :call <SID>swap_down()<CR>

" Toggle spell checking
let g:SpellEnabled=0
function! ToggleSpell()
    if g:SpellEnabled == 0
        setlocal spell spelllang=en_gb
    else
        setlocal nospell
    endif
    let g:SpellEnabled = !g:SpellEnabled
endfunction
nmap <silent> <F7> :call ToggleSpell()<CR>

" Abbrevations
" - expand("%:t") = refer to :help filename-modifiers
iabbr xxsign Seh Hui Leong
iabbr xxdate <C-R>=strftime("%Y-%m-%d")<CR>
iabbr xxdtime <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
iabbr xxpath <C-R>=expand("%")<CR>
iabbr xxfn <C-R>=expand("%:t")<CR>

" Customization for plugins
" -------------------------
" ** NERDTree
let NERDTreeIgnore=['\.a$', '\.o$', '\.pyc$', '\.swp$', '\~$', '__pycache__', '^tags', '^tags.\(lock\|temp\)$']
let NERDTreeChDirMode=2
nmap <silent> <Leader>tr :NERDTreeToggle<CR>

" ** Tasklist
map <leader>tl <Plug>TaskList

" ** Supertab
let g:SuperTabDefaultCompletionType="context"

" ** NERDCommenter
map <leader>x <plug>NERDCommenterToggle

" ** Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" ** ALE
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" ** Jedi.vim
let g:jedi#popup_on_dot = 0

" ** Tagbar
nnoremap <Leader>tb :TagbarToggle<CR>

" ** VIM Wiki
let g:vimwiki_list = [{'path': '~/OneDrive/vimwiki/',
                      \'syntax': 'markdown', 'ext': '.wiki'}]
" ** Snipmate
let g:snipMate = { 'snippet_version' : 1 }

" ** fzf
nnoremap <leader>p :Files<CR>

" ** vim-notes
let g:notes_directories = ['~/Documents/vimnotes',]
