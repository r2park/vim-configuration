" Load Pathogen
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set background=dark
set t_Co=16
set backspace=indent,eol,start
set viminfo=%,'50,\"100,:100,n~/.viminfo

" Powerline stuff - UPDATE 12-25-2014: switched over to using vim-airline
"set laststatus=2   " Always show the statusline
"set noshowmode
"if ! has('gui_running')
"    set ttimeoutlen=10
"    augroup FastEscape
"        autocmd!
"        au InsertEnter * set timeoutlen=0
"        au InsertLeave * set timeoutlen=1000
"    augroup END
"endif
"
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup


" Fix the 'O' delay when inserting line above
set timeoutlen=900

set noto
inoremap jj <Esc>

let g:solarized_termcolors=16
colorscheme solarized

" Taglist
nnoremap <silent> <F8> :TlistToggle<CR>

" Nerdtree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Set font to Inconsolatas
if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

" vim-indent-guides settings
let g:indent_guides_guide_size=1

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim


if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	sys.path.insert(0, project_base_dir)
	activate_this = os.path.join(project_base_dir,
	'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF
let g:pymode_lint_mccabe_complexity = 20
let g:pymode_lint_write = 0

" DISABLE some pymode stuff
let pymode_lint=0
let pymode_rope=0
let pymode_virtualenv=0

" ctags tag path
set tags=./tags,tags,/home/rmp/Dropbox/field_intel/embedded/Q4000/FI\ API/tags

" Syntastic Configuration
let g:syntastic_c_check_header = 1
let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" EasyMotion Configuration
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-s2)

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

map <Leader>w <Plug>(easymotion-w)
" this conflicts with Command-T
"map <Leader>b <Plug>(easymotion-b)

" Gundo Configuration
nnoremap <F5> :GundoToggle<CR>

" Airline Configuration
let g:airline_powerline_fonts=1
let g:airline_theme='badwolf'
set laststatus=2

" vim-javascript
let g:javascript_plugin_flow=1
