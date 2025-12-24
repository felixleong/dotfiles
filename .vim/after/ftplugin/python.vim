set foldenable foldmethod=indent foldcolumn=4 foldnestmax=4 foldlevel=99
set colorcolumn=88
set number

" ALE options
let s:lint_ignore_list = " --ignore=D100,D101,D200,D205,D400,D105,D106,W503"
let g:ale_python_auto_poetry = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_auto_poetry = 1
let g:ale_python_mypy_auto_pipenv = 1

let g:ale_python_mypy_options = '--install-types --follow-untyped-imports'
let g:ale_python_black_options = '--preview'

let b:ale_fixers = ['ruff_format']
let b:ale_linters = ['ruff', 'bandit', 'mypy',]

let g:ale_virtualtext_cursor = 'current'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
