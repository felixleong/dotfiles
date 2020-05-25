let s:lint_ignore_list = " --ignore=D100,D101,D200,D205,D400,D105,D106,W503"
let s:flake8_default_args = "--max-line-length=88 --max-complexity 15"

let b:ale_fixers = ['autopep8', 'black',  'isort', ]
let b:ale_linters = ['mypy']
let g:ale_python_flake8_options = s:flake8_default_args . s:lint_ignore_list
let g:ale_python_isort_options = "--multi-line=3 --trailing-comma --force-grid-wrap=0 --use-parentheses --line-width=88"
let g:ale_python_mypy_options = "-–ignore-missing-imports"

function! Py_docwarn()
    let g:ale_python_flake8_options = s:flake8_default_args . s:lint_ignore_list
endfunction

function! Py_nodocwarn()
    let g:ale_python_flake8_options = s:flake8_default_args . s:lint_ignore_list . ",D102,D103"
endfunction

command! -bar Pynodoc      call Py_nodocwarn()
command! -bar Pydoc        call Py_docwarn()
