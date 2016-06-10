syn on
syn enable

filetype indent plugin on

color slate

set nu ai ci si wb nobk sm hls hid wrap
"set cursorline
"hi CursorLine term=bold cterm=bold guibg=Grey40
set sw=4 ts=4 sts=4
set bs=2 ls=2 ch=1

if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

map <F9> :w<cr>:!g++ % -std=c++11 -Wall -o %< <cr>

"inoremap <buffer> {<cr> {<cr>}<esc>O

" #### vim-plug ####
call plug#begin('~/.vim/plugged')
	Plug 'airblade/vim-gitgutter'
	Plug 'majutsushi/tagbar'
	Plug 'bling/vim-airline'
	Plug 'scrooloose/nerdtree'
	Plug 'kien/ctrlp.vim'
	Plug 'bling/vim-bufferline'
	Plug 'Xuyuanp/nerdtree-git-plugin'

	Plug 'Shougo/deoplete.nvim'
	Plug 'zchee/deoplete-jedi'
	Plug 'carlitux/deoplete-ternjs'
	Plug 'hynek/vim-python-pep8-indent'
	Plug 'zchee/deoplete-go', { 'do': 'make'}

	Plug 'scrooloose/nerdcommenter'
	Plug 'raimondi/delimitmate'
	Plug 'junegunn/vim-easy-align'

	Plug 'mattn/emmet-vim'
    Plug 'othree/html5.vim'
call plug#end()


" #### tagbar ####
nmap <silent> <F6> :TagbarToggle<CR>
let g:tagbar_width = 30


" #### The-NERD-tree ####
nmap <silent> <F2> :NERDTreeMirror<CR>
nmap <silent> <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25  
let NERDTreeWinPos='left'
let NERDTreeShowLineNumbers=0
let NERDTreeShowHidden=0
let NERDTreeAutoDeleteBuffer=1


" #### airline ####
nnoremap <S-h> :bp<CR>
nnoremap <S-l> :bn<CR>
let g:airline_powerline_fonts = 1
" For patched power-line fonts
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#fnamemod = ':t'


" #### ctrlp ####
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
			\ 'dir':  '\v[\/]\.(git|hg|svn)$',
			\ 'file': '\v\.(exe|so|dll)$',
			\ 'link': 'some_bad_symbolic_links',
			\ }
"let g:ctrlp_user_command = 'find %s -type f'


" #### emmet ####
let g:user_emmet_expandabbr_key='<c-j>'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" #### vim-javascript ####
let g:javascript_enable_domhtmlcss=1

"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=tern#Complete
"autocmd FileType python setlocal omnifunc=jedi#completions
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" #### Deoplete ####
set completeopt-=preview
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_refresh_always = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#auto_complete_start_length = 2
" jedi
let g:deoplete#sources#jedi#enable_cache = 1
" ternjs
let g:tern_request_timeout = 1
let g:tern_show_signature_in_pum = 0 
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" go
let g:deoplete#sources#go#align_class = 1
"let g:deoplete#sources#go#package_dot = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']



" #### vim-easy-align ####
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
