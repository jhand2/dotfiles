set nocompatible              " be iMproved, required


filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"Plugins
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-surround'
Plugin 'pangloss/vim-javascript'
Plugin 'klen/python-mode'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'fatih/vim-go'
Plugin 'wlangstroth/vim-racket'
Plugin 'jiangmiao/auto-pairs'
Plugin 'vim-ruby/vim-ruby'
Plugin 'leafgarland/typescript-vim'
Plugin 'justinmk/vim-syntax-extra'
Plugin 'conormcd/matchindent.vim'
Plugin 'sickill/vim-monokai'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'pboettch/vim-cmake-syntax'
Plugin 'jhand2/vim-csharp'
Plugin 'will133/vim-dirdiff'
Plugin 'PProvost/vim-ps1'
call vundle#end()
filetype on

autocmd FileType ruby set re=1 "Fixes syntax highlighting lag in ruby

" Markdown
let g:markdown_enable_spell_checking = 0

" ctags
set tags=tags;/,pytags;/

" Golang highlighting
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:cpp_class_scope_highlight = 1

" NERDTree
let NERDTreeQuitOnOpen=1
map <C-n> :NERDTreeToggle<CR>

" Powerline
set laststatus=2

" Python mode config
let g:pymode_rope = 0   "Turn off rope
let g:pymode_python='python3'
let g:pymode_syntax=1
let g:pymode_options_colorcolumn = 0
let g:pymode_indent = 1
let g:pymode_doc = 0
set completeopt=menu
let g:pymode_lint_checkers = []

" Standard config
setlocal shiftwidth=4
setlocal softtabstop=4
setlocal tabstop=4
set expandtab
filetype indent on

let mapleader=","
imap jk <Esc>

" Use system clipboard
set clipboard=unnamedplus

" Pretty scroll/cursor stuff
set cursorline
set scrolloff=5

" Turns on code folding as long as you indent your
" code like a good little programmer
set foldmethod=indent
set foldlevel=99
"nnoremap <space> za

nnoremap <silent> <F9> :!clear;python %<CR>

" Leader mappings
noremap <leader>s :update<CR>
nnoremap <leader>sl :wq<CR>

noremap <leader>h <C-PageUp>
noremap <leader>l <C-PageDown>

" Split behavior
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

filetype plugin on

"Colors/theme
syntax enable
set t_Co=256
if (empty($TMUX))
    if (has("nvim"))
        "For Neovim 0.1.3 and 0.1.4 <
        "https://github.com/neovim/neovim/pull/2198 
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    endif
    if (has("termguicolors"))
        set termguicolors
    endif
endif

"Sets white line numbers
set number
highlight LineNr ctermfg=white

" Theme
set background=dark
colorscheme monokai

"ctrl+shift+P shows the label for given syntax (i.e. cBlock)
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if &term =~ '256color'
    " Disable Background Color Erase (BCE) so that color schemes
    " work properly when Vim is used inside tmux and GNU screen.
    set t_ut=
endif
