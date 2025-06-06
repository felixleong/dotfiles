let s:lint_ignore_list = " --ignore=D100,D101,D200,D205,D400,D105,D106,W503"

let g:ale_python_auto_poetry = 1
let g:ale_python_auto_pipenv = 1
let g:ale_python_mypy_auto_poetry = 1
let g:ale_python_mypy_auto_pipenv = 1

let g:ale_python_mypy_options = '--install-types'
let g:ale_python_black_options = '--preview'

let b:ale_fixers = ['pycln', 'ruff', 'ruff_format', 'isort']
let b:ale_linters = ['mypy', 'bandit', 'ruff',]

function! Py_docwarn()
    let g:ale_python_flake8_options = s:flake8_default_args . s:lint_ignore_list
endfunction

function! Py_nodocwarn()
    let g:ale_python_flake8_options = s:flake8_default_args . s:lint_ignore_list . ",D102,D103"
endfunction

command! -bar Pynodoc      call Py_nodocwarn()
command! -bar Pydoc        call Py_docwarn()
