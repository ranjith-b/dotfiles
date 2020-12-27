" Author:               Ranjith
" Last Modified:        7-Dec-2020
" Local Path:           ~/.vimrc
" Latest Copy At:       https://github.com/ranjith-b/dotfiles
" License:              Public Domain (PD)
"
" TO DO:
"fix  :'bd' command exits vim completely even though other buffers are
"present with the nextTREE enable (mac)
"FZF file open opens prev buffer along with the intended file with
"NERDTreeToggle on 
"    
"---------PLUGINS-------------------------
"
" VIM Plug: Plugin Manager
"Ref: https://github.com/junegunn/vim-plug


call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
"file system explorer 

Plug 'Xuyuanp/nerdtree-git-plugin'
"git plugin for nerdtree

Plug 'francoiscabrol/ranger.vim'
"global-text based file manager for linux/unix. First, install it via brew (for mac)

Plug 'liuchengxu/vim-which-key'
"port of emacs-whcij-key: displays aviaable keybindingsin the popup

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Intellisense engine---as vscode

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"command line fuzzy finder wrapper for vim

Plug 'junegunn/fzf.vim'
"install bat via brew for syntax highlighing in files preview

Plug 'morhetz/gruvbox'
" Color scheme

Plug 'ryanoasis/vim-devicons'
"icons based on the file type

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"airline themes

Plug 'justinmk/vim-sneak'
"Jump to any location specified by two characters.
"
Plug 'mhinz/vim-startify'
"a start screen for Vim

Plug 'sheerun/vim-polyglot'
"A collection of language packs for Vim
"
Plug 'airblade/vim-gitgutter'
"shows a git diff in the sign column

Plug 'tpope/vim-fugitive'
"Plugin for Git

Plug 'christoomey/vim-tmux-navigator'
"Tmux navigator for vim
"
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
"markdown preview for vim
"
Plug 'jparise/vim-graphql', {'for': ['graphql', 'javascript', 'typescript']}
"...
"
Plug 'jxnblk/vim-mdx-js', {'for': ['markdown', 'markdown.mdx']}
"mdx for vim

Plug 'pangloss/vim-javascript'    
" JavaScript support

Plug 'leafgarland/typescript-vim' 
" TypeScript syntax

Plug 'maxmellon/vim-jsx-pretty'   
" JS and JSX syntax

Plug 'jparise/vim-graphql'        
" GraphQL syntax

Plug 'norcalli/nvim-colorizer.lua'
"color highlighter for Neovim

call plug#end()

"-------------END: PLUGINS---------------------------------


"---settings-----------------------------------
set nocompatible

set hidden
" Required to keep multiple buffers open multiple buffers"
"
set iskeyword+=-                      	
" treat dash separated words as a word text object"

syntax enable                           
" Enables syntax highlighing

set wrap                              
" Display long lines as just one line

set formatoptions-=cro                  
" Stop newline continution of comments

set nobackup
" Some servers have issues with backup files, see #649/recommended by coc

set encoding=utf-8                      
" The encoding displayed

set pumheight=10                        
" Makes popup menu smaller

set fileencoding=utf-8                  
" The encoding written to file

set ruler              			            
" Show the cursor position all the time

"set scrolloff=5
"??

set cmdheight=2
" Better display for messages

set mouse=a
" Enable your mouse
" text copy from vim to exteral program

set splitright          
" split to right of current window

set splitbelow          
" split below my current window
"

set t_Co=256                            
" Support 256 colors

set conceallevel=0                      
" So that I can see `` in markdown files

set tabstop=2                           
" Insert 2 spaces for a tab

set softtabstop=2
"mix of tabs and spaces

set shiftwidth=2                        
" Change the number of space characters inserted for indentation

set smarttab                            
" Makes tabbing smarter will realize you have 2 vs 4

set expandtab                           
" Converts tabs to spaces

set smartindent                         
" Makes indenting smart

set autoindent                          
" Good auto indent

set laststatus=2                        
" Always display the status line

set showcmd
" cmd's on the status bar

set number
"Normal line numbers

"set spell spelllang=en_us
" Enable English spell check

set relativenumber                              
"  relative Line numbers

"set cursorline                          
autocmd InsertEnter * set cursorline
autocmd InsertLeave * set nocursorline 
"highlight current line in insert mode; vim-tip #1279
" Enable highlighting of the current line
"
set background=dark                     
" tell vim what the background color looks like

set showtabline=2                       
" Always show tabs

set showmode                          
" We don't need to see things like -- INSERT -- anymore

set nobackup                            
" This is recommended by coc

set nowritebackup                       
" This is recommended by coc

set shortmess+=c                        
" Don't pass messages to |ins-completion-menu|.

set signcolumn=yes                      
" Always show the signcolumn, otherwise it would shift the text each time

set updatetime=300                      
" Faster completion

set timeoutlen=100                      
" By default timeoutlen is 1000 ms

if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif
" Copy paste between vim and everything else

set ignorecase
" don't bother about case, just searched

set noincsearch
" begin searching only when I press enter

"set mouse=a
"if exists('$TMUX')  " Support resizing in tmux
"  set ttymouse=xterm2
"endif
"??
set nocompatible
"
set showmatch
"show matching braces for "matchtime"
"
set backspace=2
"backspace rams over anyting in insert mode 
"set tw=80
":autocmd VimResized * | set columns=72

set linebreak 
set tw=72
set termguicolors
"---------END:"SETTINGS---------------------


"---------KEY MAPPINGS--------------------------------


imap <C-h> <C-w>h
imap <C-j> <C-w>j
imap <C-k> <C-w>k
imap <C-l> <C-w>l
"basic key mappings

nnoremap <SPACE> <Nop>
let mapleader =" "
"set SPACE  as the leader key

nnoremap <silent> <TAB> :bnext<CR>
" TAB in general mode will move to text buffer

nnoremap <silent> <S-TAB> :bprevious<CR>
" SHIFT-TAB will go back

inoremap jk <Esc>
inoremap kj <Esc>
"ESC maping 

vnoremap < <gv
vnoremap > >gv
"Better indenting

xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
" Move selected line / block of text in visual mode
  " shift + k to move up
  " shift + j to move down

nmap tp :tabedit %<CR>
nmap tc :tabclose<CR>
"pop out a window to new tab and restore it
"!!

"------------END: KEY MAPPINGS------------------------

"-----------------COC-config-----------------------------
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" Use `[g` and `]g` to navigate diagnostics

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap keys for gotos

nnoremap <silent> K :call <SID>show_documentation()<CR>
" Use K to show documentation in preview window

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')
" Highlight symbol under cursor on CursorHold

"-----------------END COC-config-----------------------------

"----------------VIM Which-KEY---------------------------------------------------
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
" Map leader to which_key

let g:which_key_map =  {}
" Create map to add keys to
let g:which_key_sep = '→'
" Define a separator

let NERDTreeShowHidden=1
" to show all the hidden files too in nerdtree 

let g:which_key_use_floating_win = 0
" Not a fan of floating windows for this

highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function
" Change the colors if you want

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" Hide status line

let g:which_key_map['/'] = [ '<Plug>NERDCommenterToggle'  , 'comment' ]
let g:which_key_map['e'] = [ ':CocCommand explorer'       , 'explorer' ]
let g:which_key_map['f'] = [ ':Files'                     , 'search files' ]
let g:which_key_map['h'] = [ '<C-W>s'                     , 'split below']
let g:which_key_map['n'] = [ ':NERDTreeToggle'                    , 'NERDTreeToggle' ]
let g:which_key_map['r'] = [ ':Ranger'                    , 'ranger' ]
let g:which_key_map['S'] = [ ':Startify'                  , 'start screen' ]
let g:which_key_map['T'] = [ ':Rg'                        , 'search text' ]
let g:which_key_map['v'] = [ '<C-W>v'                     , 'split right']
"let g:which_key_map['z'] = [ 'Goyo'                       , 'zen' ]
" Single mappings

let g:which_key_map.s = {
      \ 'name' : '+search' ,
      \ '/' : [':History/'     , 'history'],
      \ ';' : [':Commands'     , 'commands'],
      \ 'a' : [':Ag'           , 'text Ag'],
      \ 'b' : [':BLines'       , 'current buffer'],
      \ 'B' : [':Buffers'      , 'open buffers'],
      \ 'c' : [':Commits'      , 'commits'],
      \ 'C' : [':BCommits'     , 'buffer commits'],
      \ 'f' : [':Files'        , 'files'],
      \ 'g' : [':GFiles'       , 'git files'],
      \ 'G' : [':GFiles?'      , 'modified git files'],
      \ 'h' : [':History'      , 'file history'],
      \ 'H' : [':History:'     , 'command history'],
      \ 'l' : [':Lines'        , 'lines'] ,
      \ 'm' : [':Marks'        , 'marks'] ,
      \ 'M' : [':Maps'         , 'normal maps'] ,
      \ 'p' : [':Helptags'     , 'help tags'] ,
      \ 'P' : [':Tags'         , 'project tags'],
      \ 's' : [':Snippets'     , 'snippets'],
      \ 'S' : [':Colors'       , 'color schemes'],
      \ 't' : [':Rg'           , 'text Rg'],
      \ 'T' : [':BTags'        , 'buffer tags'],
      \ 'w' : [':Windows'      , 'search windows'],
      \ 'y' : [':Filetypes'    , 'file types'],
      \ 'z' : [':FZF'          , 'FZF'],
      \ }
" s is for search

let g:which_key_map.g = {
      \ 'name' : '+git' ,
      \ 'a' : [':Git add .'                        , 'add all'],
      \ 'A' : [':CocCommand fzf-preview.GitStatus' , 'actions'],
      \ 'b' : [':Git blame'                        , 'blame'],
      \ 'B' : [':GBrowse'                          , 'browse'],
      \ 'c' : [':Git commit'                       , 'commit'],
      \ 'd' : [':Git diff'                         , 'diff'],
      \ 'D' : [':Gdiffsplit'                       , 'diff split'],
      \ 'g' : [':GGrep'                            , 'git grep'],
      \ 'G' : [':Gstatus'                          , 'status'],
      \ 'h' : [':GitGutterLineHighlightsToggle'    , 'highlight hunks'],
      \ 'H' : ['<Plug>(GitGutterPreviewHunk)'      , 'preview hunk'],
      \ 'i' : [':Gist -b'                          , 'post gist'],
      \ 'j' : ['<Plug>(GitGutterNextHunk)'         , 'next hunk'],
      \ 'k' : ['<Plug>(GitGutterPrevHunk)'         , 'prev hunk'],
      \ 'l' : [':Git log'                          , 'log'],
      \ 'm' : ['<Plug>(git-messenger)'             , 'message'],
      \ 'p' : [':Git push'                         , 'push'],
      \ 'P' : [':Git pull'                         , 'pull'],
      \ 'r' : [':GRemove'                          , 'remove'],
      \ 's' : ['<Plug>(GitGutterStageHunk)'        , 'stage hunk'],
      \ 'S' : [':CocCommand fzf-preview.GitStatus' , 'status'],
      \ 't' : [':GitGutterSignsToggle'             , 'toggle signs'],
      \ 'u' : ['<Plug>(GitGutterUndoHunk)'         , 'undo hunk'],
      \ 'v' : [':GV'                               , 'view commits'],
      \ 'V' : [':GV!'                              , 'view buffer commits'],
      \ }
" g is for git

let g:which_key_map.l = {
      \ 'name' : '+lsp' ,
      \ '.' : [':CocConfig'                          , 'config'],
      \ ';' : ['<Plug>(coc-refactor)'                , 'refactor'],
      \ 'a' : ['<Plug>(coc-codeaction)'              , 'code action'],
      \ 'A' : ['<Plug>(coc-codeaction-selected)'     , 'selected action'],
      \ 'b' : [':CocNext'                            , 'next action'],
      \ 'B' : [':CocPrev'                            , 'prev action'],
      \ 'c' : [':CocList commands'                   , 'commands'],
      \ 'd' : ['<Plug>(coc-definition)'              , 'definition'],
      \ 'D' : ['<Plug>(coc-declaration)'             , 'declaration'],
      \ 'e' : [':CocList extensions'                 , 'extensions'],
      \ 'f' : ['<Plug>(coc-format-selected)'         , 'format selected'],
      \ 'F' : ['<Plug>(coc-format)'                  , 'format'],
      \ 'h' : ['<Plug>(coc-float-hide)'              , 'hide'],
      \ 'i' : ['<Plug>(coc-implementation)'          , 'implementation'],
      \ 'I' : [':CocList diagnostics'                , 'diagnostics'],
      \ 'j' : ['<Plug>(coc-float-jump)'              , 'float jump'],
      \ 'l' : ['<Plug>(coc-codelens-action)'         , 'code lens'],
      \ 'n' : ['<Plug>(coc-diagnostic-next)'         , 'next diagnostic'],
      \ 'N' : ['<Plug>(coc-diagnostic-next-error)'   , 'next error'],
      \ 'o' : [':Vista!!'                            , 'outline'],
      \ 'O' : [':CocList outline'                    , 'search outline'],
      \ 'p' : ['<Plug>(coc-diagnostic-prev)'         , 'prev diagnostic'],
      \ 'P' : ['<Plug>(coc-diagnostic-prev-error)'   , 'prev error'],
      \ 'q' : ['<Plug>(coc-fix-current)'             , 'quickfix'],
      \ 'r' : ['<Plug>(coc-references)'              , 'references'],
      \ 'R' : ['<Plug>(coc-rename)'                  , 'rename'],
      \ 's' : [':CocList -I symbols'                 , 'references'],
      \ 'S' : [':CocList snippets'                   , 'snippets'],
      \ 't' : ['<Plug>(coc-type-definition)'         , 'type definition'],
      \ 'u' : [':CocListResume'                      , 'resume list'],
      \ 'U' : [':CocUpdate'                          , 'update CoC'],
      \ 'z' : [':CocDisable'                         , 'disable CoC'],
      \ 'Z' : [':CocEnable'                          , 'enable CoC'],
      \ }
" l is for language server protocol

call which_key#register('<Space>', "g:which_key_map")
" Register which key map


"----------------END VIM Which-KEY---------------------------------------




"------------NERD TREE Config------------------------------

nmap <C-n> :NERDTreeToggle<CR>
"vmap ++ <plug>NERDCommenterToggle
"nmap ++ <plug>NERDCommenterToggle

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"If more than one window and previous buffer was NERDTree, go back to it.
" Nerd Tree Toggler
"nnoremap \d :bp<cr>:bd #<cr>
"when nertreetoggle is turned on bd exits vim completely (https://github.com/preservim/nerdtree/issues/400)
"open NERDTree automatically when vim starts up on opening a directory

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"open a NERDTree automatically when vim starts up if no files were specified
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"-----------------


inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

inoremap <silent><expr> <c-space> coc#refresh()
" Use <c-space> to trigger completion.

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


autocmd CursorHold * silent call CocActionAsync('highlight')
" Highlight symbol under cursor on CursorHold

nmap <leader>rn <Plug>(coc-rename)
" Remap for rename current word

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Remap for format selected region

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Create mappings for function text object, requires document symbols feature of languageserver.


let g:airline#extensions#tabline#enabled = 1
" coc config

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-css',
  \ 'coc-pyls',
  \ 'coc-yaml',
  \ 'coc-pyright',
  \ 'coc-vetur',
  \ ]

command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save

nnoremap <silent> K :call <SID>show_documentation()<CR>
" Use K to show documentation in preview window


"-----------end COC----------------------------""

"----Other Config-------------------------------
colorscheme Tomorrow-Night-Bright


syntax on		          
"gimme some colors, start with 2

set hlsearch	
"let my eyes parse this code 

filetype plugin indent on
"this supposedly takes care of indentation and syntax based on filetype

autocmd FocusLost * :wa
"save file when focus is lost; vim-tip #1160


autocmd FileType c,cpp,java set matchpairs+==:;
"showmatch for '=' & ';' in assignment for C and Java

"----END: Other Config-------------------------------
"lua require'colorizer'.setup()
