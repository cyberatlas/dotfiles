set nocompatible              " be iMproved, required
filetype off                  " required

let g:python_host_prog='/usr/bin/python'

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" Git plugin
Plug 'tpope/vim-fugitive'

" Fuzzy file matching
Plug 'ctrlpvim/ctrlp.vim'

" Highlight trailing whitespace
Plug 'ntpeters/vim-better-whitespace'

" Checking syntax (linting) with LSP
 Plug 'dense-analysis/ale'

"""Setting up the LSP and autocompletion""""

" Get LSP
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Sensible Vim: Defaults everyone can agree on
Plug 'tpope/vim-sensible'

" Filesystem explorer
Plug 'scrooloose/nerdtree'


" One stop shop for vim colorschemes
Plug 'flazz/vim-colorschemes'

" TODO figure this out
Plug 'neomake/neomake'

" Not using this in favor of xclip
" Vim yoink - yank and put with sys clipboard
" Plugin 'svermeulen/vim-yoink'

" Vim Cutlass - Delete and not yank
" Plugin 'svermeulen/vim-cutlass'

"TODO actually implement someday
"Vim subversive - makes it easy to perform quick substitutions
" Plugin 'svermeulen/vim-subversive' 

" Helps with folding 
"Plugin 'tmhedberg/SimpylFold'


" Status bar
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/nvim/'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Install nerd commenter - commment functions so powerful - no commment necessary
" https://github.com/preservim/nerdcommenter
" [count]<leader>cc - comment out current/selected lines
" [count]<leader>cu - uncomment selected lines
"  [count]<leader>c<space> |NERDCommenterToggle| 
"  Toggles the comment state of the selected line(s). If the topmost selected line is commented, all selected lines are uncommented and vice versa.

Plug 'preservim/nerdcommenter'

" Trying to get a live preview for markdown
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

Plug 'heavenshell/vim-pydocstring'

"""""""""""""""""""""
" End of My Plugins "
"""""""""""""""""""""
call plug#end()

" PlugInstall [name ...] [#threads] 	Install plugins
" PlugUpdate [name ...] [#threads] 	Install or update plugins
" PlugClean[!] 	Remove unlisted plugins (bang version will clean without prompt)
" PlugStatus 	Check the status of plugins
" PlugDiff 	Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path] 	Generate script for restoring the current snapshot of the plugins

"""""""""""""""""""
" Plugin Settings "
"""""""""""""""""""
" For Yoink
" let g:yoinkIncludeDeleteOperations = 1
" let g:yoinSyncSystemClipboardOnFocus = 1

"For indentLine
" let g:indentLine_enabled = 1

" Keep sign gutter open Ale
let g:ale_sign_column_always = 1

" For SimplyFold
" See the docstrings in folded code
let g:SimplyFold_docstring_preview=1

" Let's make python look nice
let python_highlight_all=1
syntax on

" Start deoplete on startup
let g:deoplete#enable_at_startup = 1

" Run Neomake on read/write operations
autocmd! BufReadPost,BufWritePost * Neomake

""""""""""""""""""""""""""
" End of Plugin Settings "
""""""""""""""""""""""""""

" Reenable filetype, syntax
filetype plugin indent on
syntax enable

"Trying to make leader key
let mapleader = ";"
" Allows to quickly save
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>

 """"""""""""""""""
 " My Other Stuff "
 """"""""""""""""""

 " Encoding UTF8
 set encoding=utf-8

 set mouse=a
 set number

 " changes the number based on location for ease of movement
 set relativenumber

 " Allows the use of the system clipboard crossplatform
 " set clipboard^=unnamed,unnamedplus
 " set clipboard^=unnamedplus,unnamed
"  set clipboard=unnamedplus
  set clipboard+=unnamedplus

 " Set the colorscheme
 "colorscheme stingray

" nmap p <plug>(YoinkPaste_p)
" nmap P <plug>(YoinkPaste_P)
" nmap y <plug>(YoinkYankPreserveCursorPosition)
" xmap y <plug>(YoinkYankPreserveCursorPosition)
" nmap <c-=> <plug>(YoinkPostPasteToggleFormat)

 " Setting my default tab
 setl ts=4 sw=4 et

 " Indentation display
 "set list lcs=tab:'┊'
 " set listchars=eol:¬,tab:▸\
 "set list
 "set listchars=tab:▸▸
 "set listchars=tab:.▸

 " Enable folding
 set foldmethod=indent
 set foldlevel=99

 " Remap the folding key
 noremap <space> za

" Set the standard webdev indentations
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shamelessly stolen from https:github.com/alexandercampbell/dotfiles"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" jump to last edited position in file instead of always starting at the
" top line, leftmost column
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
			\| exe "normal! g'\"" | endif
"
" better indentation
set autoindent
set smartindent

" Allows for backspacing over indent, line breaks, start of insert
set backspace=indent,eol,start
set complete-=i
set smarttab

" recognize file extensions as the correct filetypes
au BufRead,BufNewFile *.md set ft=markdown
au BufRead,BufNewFile *.yaml se ft=yaml
au BufRead,BufNewFile *.py3 se ft=python
au BufRead,BufNewFile README se spell
au FileType markdown setl spell
au FileType gitcommit setl spell

" Use the canonically accepted indentation in certain filetypes.
au FileType yaml                setl ts=4 sw=4 et
au FileType tex                 setl ts=4 sw=4 et
"au FileType javascript          setl ts=4 sw=4 et
au FileType java                setl ts=4 sw=4 et
au FileType json                setl ts=4 sw=4 et
au FileType python              setl ts=4 sw=4 et
au FileType elm                 setl ts=4 sw=4 et
au FileType elixir              setl ts=4 sw=4 et
au FileType lua                 setl ts=4 sw=4 et
au FileType dart                setl ts=2 sw=2 et
"au FileType html                setl ts=2 sw=2 et
au FileType haskell             setl ts=4 sw=4 et
au FileType tex                 setl ts=4 sw=4 et
au FileType pug 		setl ts=4 sw=4 et

"""""""""""""""""""""""""""

"""""""""Neomake""""

"" -d is where we can specify errors to ignore"""
let g:neomake_python_flake8_maker= {
  \ 'args': [
  \ '-d', 'C0103, C0111', 'W391',
  \ '-f', 'text',
  \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg}"',
  \ '-r', 'n'
  \ ],
  \ 'errorformat':
  \ '%A%f:%l:%c:%t: %m,' .
  \ '%A%f:%l: %m,' .
  \ '%A%f:(%l): %m,' .
  \ '%-Z%p^%.%#,' .
  \ '%-G%.%#',
  \ }

let g:neomake_python_enabled_makers = ['flake8']

""""""""""""""""""""""""""""""""""""""

""LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    "\ 'python': ['/usr/local/bin/pyls'],
    \ 'python': ['~/.local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap  gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"" closes small window from deoplete
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set splitbelow

""Some Good Resources"""
"https://jdhao.github.io/2018/12/24/centos_nvim_install_use_guide_en/
"https://jdhao.github.io/2018/09/20/disable_warning_neomake_pylint/
