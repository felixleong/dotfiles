" Pathogen - Load all plugin bundles
" ----------------------------------
call pathogen#infect()
call pathogen#helptags()

" GUI settings
" ------------
colorscheme solarized
set bg=dark
set t_Co=256  " force vim to use 256 colors
let g:solarized_termcolors=16  " use solarized 256 fallback
let g:solarized_termtrans=1
set statusline=%{expand('%:p:t')}\ %<\(%{expand('%:p:h')}\)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]%{fugitive#statusline()}

set ruler wildmenu hidden visualbell noerrorbells mousehide
set history=1000
set undolevels=1000
set scrolloff=3
set shortmess=atI
set wildmenu wildmode=list:longest
set wildignore=*.swp,*.bak,*.pyc,*.class
set noswapfile
set pastetoggle=<f2>
set textwidth=80

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
nnoremap <Leader>dm :delm 
nmap . .`[

" Folding mappings
nnoremap <silent> <Leader>f1 :set foldlevel=1<CR>
nnoremap <silent> <Leader>f2 :set foldlevel=2<CR>
nnoremap <silent> <Leader>f3 :set foldlevel=3<CR>
nnoremap <silent> <Leader>fa :set foldlevel=0<CR>
nnoremap <silent> <Leader>f0 :set foldlevel=999<CR>

" Tabs
nnoremap <Leader>nt :tabnew 
nnoremap <Leader>tc :tabclose<CR>

" Replacement patterns
inoremap <Leader>tdate <C-R>=strftime("%Y-%m-%d")<CR>
inoremap <Leader>tts <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>
inoremap <Leader>fname <C-R>=expand("%")<CR>
inoremap <Leader>jcls <C-R>=expand("%<")<CR>
inoremap <Leader>fn <C-R>=expand("%:t")<CR>
inoremap kj <Esc>
inoremap KJ <Esc>

" Formatting
vmap Q gq
nmap Q gqap

" Forget the arrow keys!!!
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Easy window split jumping
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Quickfix window
nnoremap <Leader>co :copen<CR>
nnoremap <Leader>cx :cclose<CR>

" Mappings for plugins
nnoremap <Leader>ctag :!(cd %:p:h;ctags *)&
nnoremap <Leader>s :Search 
nnoremap <Leader>rs :SearchReset<CR>
nnoremap <Leader>w :set wrap!<CR>

" Sudo save - when I forget to sudo before editing the file
cmap w!! w !sudo tee % > /dev/null

" Tab patterns
" Mixed mode - half tabs are spaces
nnoremap <Leader>0t :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nnoremap <Leader>2t :set expandtab tabstop=2 shiftwidth=2<CR>
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

noremap <silent> <c-s-up> :call <SID>swap_up()<CR>
noremap <silent> <c-s-down> :call <SID>swap_down()<CR>
noremap <silent> <c-s-k> :call <SID>swap_up()<CR>
noremap <silent> <c-s-j> :call <SID>swap_down()<CR>

" Multi (split) window keys
set wmw=0
nmap <c-h> <c-w>h<c-w><bar> " CTRL-H move to left window
nmap <c-l> <c-w>l<c-w><bar> " CTRL-L move to right window

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

" Scroll locking
map <Leader>zz :let &scrolloff=999-&scrolloff<cr>

" Abbrevations
iabbr shfl Seh Hui "Felix" Leong
iabbr shl Seh Hui Leong


" Customization for plugins
" -------------------------
" ** NERDTree
let NERDTreeIgnore=['\.a$', '\.o$', '\.pyc$', '\.swp$', '\~$', '__pycache__']
let NERDTreeChDirMode=2
nmap <silent> <Leader>tr :NERDTreeToggle<CR>
nmap <silent> <Leader>ot :NERDTree 

" ** Source Explorer
nmap <silent> <Leader>se :SrcExplToggle<CR>

" ** Taglist
nnoremap <Leader>tl :TlistToggle<CR>

" ** ShowMarks
let showmarks_include = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

" ** Tasklist
map <leader>td <Plug>TaskList

" ** PEP-8
let g:pep8_map='<leader>8'

" ** Supertab
let g:SuperTabDefaultCompletionType="context"

" ** Ctrl-P
let g:ctrlp_map = '<leader>p'

" ** NERDCommenter
map <leader>x <plug>NERDCommenterToggle

" ** JSHint2
let g:jshint2_save = 1
let g:jshint2_read = 1

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
function! FoldText()
    let sub = substitute(getline(v:foldstart), '/\*\|\*/\|{{{\d\=', '', 'g')
    let diff = v:foldend - v:foldstart + 1
    return  '+' . v:folddashes . '[' . Num2S(diff,3) . ']' . sub
endfunction

" Customized setting for filetype
" -------------------------------
" Set the autocommands here
" Probably put it in ftplugin directories
autocmd FileType c,cpp,cs,vb,java,python,php,javascript call SetOptionForCode()
autocmd FileType sh                     set fileformat=unix
autocmd FileType cs,java                set foldtext=FoldText()
autocmd FileType sql                    set foldmethod=syntax foldlevel=0
autocmd FileType python                 set omnifunc=pythoncomplete#Complete
autocmd BufRead,BufNewFile *.j2         set filetype=jinja
autocmd BufRead,BufNewFile *.html       set filetype=htmldjango
autocmd BufWritePre *.php,*.phtml,*.html,*.py,*.js,*.css :%s/\s\+$//e
autocmd BufWritePost *.py               call Flake8()

" Add the virtualenv's site-packages to vim path
"py << EOF
"import os.path
"import sys
"import vim
"if 'VIRTUAL_ENV' in os.environ:
"    project_base_dir = os.environ['VIRTUAL_ENV']
"    sys.path.insert(0, project_base_dir)
"    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"    execfile(activate_this, dict(__file__=activate_this))
"EOF

" MISC NOTES
" ----------
" - expand("%:t") = refer to :help filename-modifiers
