" Load Pathogen
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set background=dark
set t_Co=16
set backspace=indent,eol,start

" Powerline stuff
set laststatus=2   " Always show the statusline
set noshowmode
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup


" Fix the 'O' delay when inserting line above
set timeoutlen=900

set noto
inoremap jj <Esc>

let g:solarized_termcolors=16
colorscheme solarized

" Remap autocompletion to C-Space
imap <C-Space> <C-x><C-u>
imap <C-@> <C-Space>

" Configure the Status Line
"set statusline=%{fugitive#statusline()} 

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
set tags=./tags,tags,/home/rmp/Dropbox/field_intel/embedded/tags

