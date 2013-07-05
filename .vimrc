" Load Pathogen
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
set background=dark
se t_Co=256

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

" Fix the O delay when inserting line above
set timeoutlen=900

"let g:solarized_termcolors=16
colorscheme solarized

" Give a shortcut key to NERD Tree
map <F2> :NERDTreeToggle<CR>

" Remap autocompletion to C-Space
imap <C-Space> <C-x><C-u>
imap <C-@> <C-Space>

" Configure the Status Line
"set statusline=%{fugitive#statusline()} 

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

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
