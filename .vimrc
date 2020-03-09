" Author:               Ranjith
" Last Modified:        Jan-20-2020
" Local Path:           ~/.vimrc
" Latest Copy At:       github:// TODO
" License:              Public Domain (PD)
" add automator script in mac to open files via vim
" When In Doubt:
"    1. Never hesitate to use ":help [<command>]"
"    2. Search on interwebz!
" Remarks:
"    1. vim-tip #nn refers to tip from http://vim.wikia.com/wiki/VimTip<nn>
"    2. To check current value of any "set" option,
"    "set <option> ?"
"    3. Comments strarting with "dagger (ÃÂ¢ÃÂÃÂ )" are vim only

" vim-plugins

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
"for tr

Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


"open NERDTree automatically when vim starts up on opening a directory

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



"---------COC vim----------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300


" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ ]
" also coc-python, coc-css.........."

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


"-----------end COC----------------------------""

" from readme

" General Editing: {
"
set nocompatible        "ÃÂ¢ÃÂÃÂ   
set number              "   who hates line numbers?
set showcmd             "   show last used command on status
set laststatus=2        "   always show status line
set showmode            "   show vim mode
set ruler               "   show current linenumer, column & file position
set showmatch           "   show matching braces for "matchtime"/10 seconds
set ignorecase          "   don't bother about case, just searched
set smartcase           "   ignore only when lowercase is searched
set noincsearch         "   begin searching only when I press enter
set mouse=a             "   I want my mouse
set scrolloff=5         "   don't run my cursor to top/bottom edge of the edge
set pastetoggle=<F2>
set backspace=2         " backspace rams over anything in insert mode!
" }

" Buffer Related Options: {
"
set hidden              "   hide changed buffers without saving
set autowriteall        "ÃÂ¢ÃÂÃÂ   when leaving buffer save it
set encoding=UTF-8

"to change the cusors for command mode and insert mode
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"

let NERDTreeShowHidden=1
" to show all the hidden files too in nerdtree 
" }

" Color Options: {
"
 "  I <3 colors
 "256 colors tests; http://www.frexx.de/xterm-256-notes/
"
colorscheme Tomorrow-Night-Bright          
syntax on		          " gimme some colors, start with 2
set hlsearch		      " let my eyes parse this code 'coz I've no brain!
" }

" FileType Options: {
"       this supposedly takes care of indentation and syntax based on filetype
"
filetype plugin indent on
" }

" Indentation Options: {
"       (as I still donno what's the best practice!)
"
set tabstop=4           "   tab stop at four is enough!
set softtabstop=4       "   enter a mix of tabs and spaces
set shiftwidth=4        "   (auto)indent by 4 space with <</>> or cindent
set expandtab           "   no tabs please, just use spaces!
set autoindent          "   indent according to last line
set smartindent         "   get smart, and use syntax for language!
set smarttab            "   shift width in start of line, softab o/w
" 

" Folding Options: {
" 
"set foldenable
"set foldmethod=syntax
"added by rr on 23082017 to save fold (as default ;) ):
"-----from here
"au BufWinLeave ?* mkview
"au BufWinEnter ?* silent loadview
"until here --------
" }

" Wild Menu Options: {
"        
"        show wildmenu for incomplete commands
"set wildmenu
"        complete the longest possible and show the rest of options for first
"        time then if tab is pressed again complete it.
"set wildmode=longest:full,full
" }

" TypeType Less With Autocmds: {
"           see ":help autocmd" (au)
"
"       save file when focus is lost; vim-tip #1160
autocmd FocusLost * :wa
"       highlight current line in insert mode; vim-tip #1279
autocmd InsertLeave * set nocursorline 
autocmd InsertEnter * set cursorline
"       showmatch for '=' & ';' in assignment for C and Java
autocmd FileType c,cpp,java set matchpairs+==:;
" }

" Wrap Related Options: {
"       these are gentoo defaults which has, so far, server me good
"
"set textwidth=72  "unset on 22.02.17 by rr
"set formatoptions=croql
" }

" Split Window And Tabs Options: {
"
"       when spliting the viewport, show no lines of minimized window
"set winminheight=0      "   for horizontal split
"set winminwidth=0       "   for vertical split
"       remap keys ctrl+hjkl to switch and maximize
nmap <C-j> <C-W>j<C-W>_
nmap <C-k> <C-W>k<C-W>_
nmap <C-h> <c-w>h<c-W><Bar>
nmap <C-l> <c-w>l<c-W><Bar>
map <C-n> :NERDTreeToggle<CR> 
set splitbelow          " split below my current window
set splitright          " split to right of current window

"      pop out a window to new tab and restore it
nmap tp :tabedit %<CR>
nmap tc :tabclose<CR>

" }

" Locale Settings: {
"       don't butt in here!
"
" "fileencoding" defaults to "encoding" which is perfect.
" "encoding" defaults to "latin1" or value from "$LANG".
" Better correct your system locale settings.
" 
" Right now Gentoo sets fileencodings good defaul in /etc/vim/vimrc
" No need to enable here. For reference:
"
" If we have a BOM, always honour that rather than trying to guess.
"if &fileencodings !~? "ucs-bom"
"  set fileencodings^=ucs-bom
"endif
" Always check for UTF-8 when trying to determine encodings.
"if &fileencodings !~? "utf-8"
"  set fileencodings+=utf-8
"endif
" Make sure we have a sane fallback for encoding detection
"set fileencodings+=default
" }

"done by rray on 13-1-12/Sunday/FB481
"set spell spelllang=en_us
" vim: fdm=marker fdl=0 fdc=3 fenc=utf-8 fmr={,}
"
" modified by rray on 180713/Wednesday/VECC:
" taken from Stack Overflow/"Fast Word COunt function in Vim"
" solution posted by Abslom Daak
" Unfortunately, doesn't work!! (Error in line 3 exe...
"function! WordCount()
"let s:old_status=v:statusmsg
"      let position = getpos(".")
"      "the following line has been modified from the original
"      exe "silent normal g \<c-g>"
"      let stat=v:statusmsg
"      let s:word_count=0
"      if stat != '--No lines in buffer--'
"            let s:word_count = str2nr(split(v:statusmsg)[11])
"            let v:statusmsg=s:old_status
"      end
"      call setpos('.', position)
"      return s:word_count
"endfunction
"
"set statusline=wc:%{WordCount()}
"---------------------------------------------
" picing up another solution by Mikael Jannson
" let g:word_count = "<unknown>"
" fun! WordCount()
 "      return g:word_count
 "endfun
"fun! UpdateWordCount()
"      let s = system("wc -w".expand("%p"))
"      let parts = split(s,' ')
"      if len(parts) > 1
"            let g:word_count = parts[0]
"      endif
"endfun
"----------------------------------------------
"UpdateWordCound Alternative by dahu:
 "function UpdateWordCount()
  "     let lnum = 1
   "    let n = 0
   "    while lnum <= line('$')
   "          let n = n + len(split(getline(lnum)))
   "          let lnum = lnum + 1
   "    endwhile
    "   return n
 "endfunction
 
 "augroup WordCounter
  "     au! CursorHold * call UpdateWordCount()
   "    au! CursorHoldI * call UpdateWordCount()
 "augroup END

""how eager are you? (default is 4000 ms)
 "set updatetime=300 "this eager, you see :P :)
"
""modify as you please....
 "set statusline=%{UpdateWordCount()}\ words\ -------\ %{v:statusmsg}\ %=%F\ ---\%l\ out\ of\ %L
"

"""""""""""""""""""""""""""""""""""""""""""
""""""   FILE BROWING IN VIM   """"""""""""
"""""""""""""""""""""""""""""""""""""""""""
""added by rr on 06032018 -- for netrw
"	let g:netrw_banner = 3
"	let g:netrw_liststyle = 3
"	let g:netrw_browse_split = 0
"	let g:netrw_altv = 0
"	let g:netrw_winsize = 50
"	let g:netrw_preview = 1
"	let g:netrw_keepdir=0
	"let g:netrw_QuitOnOpen = 1
"	autocmd BufEnter * silent! lcd %:p:h
	"set autochdir map <C-E> :Lexplore<CR>
""" For openning file in the same window
"augroup ProjectDrawer
 " autocmd!
"  autocmd VimEnter * :Vexplore
"	autocmd StdinReadPre * let s:std_in=1
"	autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | :Vexplore | endif
"augroup END
"augroup NetrwGroup
"  autocmd! BufEnter * call NormalizeWidths()
"augroup END
"""
"""
"" open file vertically to the right
"augroup netrw_mappings
 "   autocmd!
"    autocmd filetype netrw call Netrw_mappings()
"augroup END
"function! OpenToRight()
 " :rightbelow vnew
 " :wincmd p
 " :normal P
"endfunction
"function! Netrw_mappings()
 "   noremap V :call OpenToRight()<cr>
"endfunction
" The main issue with netrw was that i wanted to open netrw if vim is issued without any filename or without netrw if a file is specified... I am still sure that this can be done, but who has the time to do meaningful stuff! right, eh?
"
"""Finally using NERDtree --- 
"""Following suggestions from https://medium.com/@victormours/a-better-nerdtree-setup-3d3921abc0b9
"""Open by default:
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"""Finding the right file:
"nnoremap <Leader>f :NERDTreeToggle<Enter>
"nnoremap <silent> <Leader>v :NERDTreeFind<CR>
"""To close automatically when file is open
"let NERDTreeQuitOnOpen = 1
"""and close tab if only remaining window is NERDtree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"""make me pretty
"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
