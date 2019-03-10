setlocal sw=2
setlocal sts=2
setlocal ts=2
setlocal expandtab
setlocal tw=79
setlocal spell

let b:ale_fixers=['prettier']
let g:ale_javascript_prettier_options = '--prose-wrap=always'
