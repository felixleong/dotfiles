" Pathogen - Load all plugin bundles
" ----------------------------------
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

" GUI settings
" ------------
set t_Co=256  " force vim to use 256 colors
set t_ut=
colorscheme jellybeans
set background=dark
set colorcolumn=80
let g:solarized_termcolors=16  " use solarized 256 fallback
let g:solarized_termtrans=1

set ruler wildmenu hidden visualbell noerrorbells mousehide
set history=1000
set undolevels=1000
set scrolloff=3
set shortmess=atI
set wildmenu wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class
set noswapfile
set pastetoggle=<f2>

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
nnoremap <silent> <Leader>n :silent :nohlsearch<CR>
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
inoremap QQ <Esc>

" Formatting
vmap Q gq
nmap Q gqap

" Forget the arrow keys!!!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Mappings for plugins
nnoremap <Leader>ctag :!(cd %:p:h;ctags *)&
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
iabbr _sign Seh Hui Leong
iabbr _date <C-R>=strftime("%Y-%m-%d")<CR>
iabbr _dtime <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
iabbr _path <C-R>=expand("%")<CR>
iabbr _fn <C-R>=expand("%:t")<CR>


" Customization for plugins
" -------------------------
" ** NERDTree
let NERDTreeIgnore=['\.a$', '\.o$', '\.pyc$', '\.swp$', '\~$', '__pycache__']
let NERDTreeChDirMode=2
nmap <silent> <Leader>tr :NERDTreeToggle<CR>

" ** Tasklist
map <leader>tl <Plug>TaskList

" ** Supertab
let g:SuperTabDefaultCompletionType="context"

" ** Ctrl-P
let g:ctrlp_map = '<leader>p'

" ** NERDCommenter
map <leader>x <plug>NERDCommenterToggle

" ** JSHint2
let g:jshint2_save = 1
let g:jshint2_read = 1

" ** Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set laststatus=2

" ** Syntastic
let g:syntastic_python_python_exec = 'python3'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_markdown_checkers = ['mdl', 'proselint']

" ** Livedown
nnoremap <Leader>ld :LivedownToggle<CR>

" ** Voom
let g:voom_default_mode = 'markdown'
nnoremap <Leader>vt :VoomToggle<CR>

" Functions
" ---------
"  Set options for code
function! SetOptionForCode()
    set nowrap number
    if exists('+colorcolumn')
        set colorcolumn=80
    else
        let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
    endif

    " Folding
    " -------
    set foldmethod=syntax
    set nofoldenable
    set foldopen-=search
    set foldlevel=100 " Don't automatically fold
    set foldnestmax=20
endfunction

" Text folding functions
function! Num2S(num, len)
    let filler = "                                                            "
    let text = '' . a:num
    return strpart(filler, 1, a:len - strlen(text)) . text
endfunction

" Customized setting for filetype
" -------------------------------
" Set the autocommands here
" Probably put it in ftplugin directories
let g:markdown_folding = 1
autocmd FileType c,cpp,cs,vb,java,python,php,javascript call SetOptionForCode()
autocmd FileType sh                     set fileformat=unix
autocmd FileType sql                    set foldmethod=syntax foldlevel=0
autocmd FileType markdown,rst          set tw=79
autocmd BufRead,BufNewFile *.j2,*.html,*.htm,*.tmpl       set filetype=jinja sw=2 sts=2 ts=2

" MISC NOTES
" ----------
" - expand("%:t") = refer to :help filename-modifiers
