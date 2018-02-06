let s:flake8_args = "--max-complexity 10 --ignore=D100,D101,D200,D205,D400,D105,D106"
let g:syntastic_python_flake8_args = get(g:, 'syntastic_python_flake8_args', s:flake8_args)

function! Py_docwarn()
    let g:syntastic_python_flake8_args = s:flake8_args
    call SyntasticCheck()
endfunction

function! Py_nodocwarn()
    let g:syntastic_python_flake8_args = s:flake8_args . ",D102,D103"
    call SyntasticCheck()
endfunction

command! -bar Pynodoc      call Py_nodocwarn()
command! -bar Pydoc        call Py_docwarn()
