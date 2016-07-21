call plug#begin('~/.config/nvim/plugged')

" Support bundles
Plug 'jgdavey/tslime.vim'
Plug 'Shougo/vimproc.vim'
Plug 'scrooloose/syntastic'
Plug 'moll/vim-bbye'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'haya14busa/incsearch.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'

" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'
Plug 'airblade/vim-gitgutter'

" Bars, panels, and files
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'

" Text manipulation
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'Shougo/neosnippet'
Plug 'honza/vim-snippets'
Plug 'Shougo/neosnippet-snippets'
Plug 'tpope/vim-abolish'

" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

" Markdown support (depends on tabular)
Plug 'plasticboy/vim-markdown'
Plug 'JamshedVesuna/vim-markdown-preview'

" Haskell
Plug 'dag/vim2hs'
Plug 'lukerandall/haskellmode-vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'Twinside/vim-hoogle'

" Scala
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
Plug 'GEverding/vim-hocon'
Plug 'ensime/ensime-vim'

" Colorscheme
Plug 'vim-scripts/wombat256.vim'

" Local plugins
Plug '~/Projects/vim-follow-my-lead'
Plug '~/.vim/bundle/vim-sbtquickfix'

" Add plugins to &runtimepath
call plug#end()

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<Space>"

" Turn on filetype plugins (:help filetype-plugin).
if has('autocmd')
  filetype plugin indent on
endif

" Enable syntax highlighting.
if has('syntax')
  syntax enable
endif

" Disable folding
set nofoldenable

" Use the system register *
set clipboard=unnamedplus

" Use 'shiftwidth' when using `<Tab>` in front of a line.
" By default it's used only for shift commands (`<`, `>`).
set smarttab

" Disable octal format for number processing.
set nrformats-=octal

" Allow for mappings including `Esc`, while preserving
" zero timeout after pressing it manually.
set ttimeout
set ttimeoutlen=100

" Indent using two spaces.
set tabstop=2
set shiftwidth=2
set expandtab

" Clear the highlighting of :set hlsearch.
nnoremap <silent> <leader>l :nohlsearch<CR><C-L>

" Show the line and column number of the cursor position.
set ruler

" Show the size of block one selected in visual mode.
set showcmd

" Set default whitespace characters when using `:set list`
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Delete comment character when joining commented lines
if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j
endif

" Search upwards for tags file instead only locally
if has('path_extra')
  setglobal tags-=./tags tags^=./tags;
endif

" Support all kind of EOLs by default.
set fileformats+=mac

" `Ctrl-U` in insert mode deletes a lot. Use `Ctrl-G` u to first break undo,
" so that you can undo `Ctrl-U` without undoing what you typed before it.
inoremap <C-U> <C-G>u<C-U>

" Keep flags when repeating last substitute command.
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Y yanks from the cursor to the end of line as expected. See :help Y.
nnoremap Y y$

" Don't move the cursor after yanking
vnoremap <expr>y "my\"" . v:register . "y`y"

" Use more readable color scheme by default.
" It works well with `:set colorline` option.
colorscheme wombat256mod

" Highlight line under cursor. It helps with navigation.
set cursorline

" Keep 8 lines above or below the cursor when scrolling.
set scrolloff=8

" Keep 15 columns next to the cursor when scrolling horizontally.
set sidescroll=1
set sidescrolloff=15

" If opening buffer, search first in opened windows.
set switchbuf=usetab

" Hide buffers instead of asking if to save them.
set hidden

" No wrap lines by default
set nowrap

" For autocompletion, complete as much as you can.
set wildmode=longest,full

" Show line numbers on the sidebar.
set number

" Disable any annoying beeps on errors.
set noerrorbells
set visualbell

" Don't parse modelines (google "vim modeline vulnerability").
set nomodeline

" Turn backup off, since most stuff is in Git anyway...
set nobackup
set nowb
set noswapfile

" Since backup is turned off we persist undo tree just in case
set undofile

" Save up to 100 marks, enable capital marks.
set viminfo='100,f1

" Enable search highlighting.
set hlsearch

" Ignore case when searching.
set ignorecase

" Show mode in statusbar, not separately.
set noshowmode

" Don't ignore case when search has capital letter
" (although also don't ignore case by default).
set smartcase

" Use dash as word separator.
set iskeyword+=-

" Keep cursor position when switching buffers
set nostartofline

" Disable output, vcs, archive, rails, temp and backup files.
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*.swp,*~,._*

" Auto center on matched string.
noremap n nzz
noremap N Nzz

" Visually select the text that was last edited/pasted (Vimcast#26).
noremap gV `[v`]

" Expand %% to path of current buffer in command mode.
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Save all buffers
nnoremap <Leader><Leader> :wa<CR>

" Use Q to intelligently close a window (if there are multiple windows into the same buffer)
" or kill the buffer entirely if it's the last window looking into that buffer.
function! CloseWindowOrKillBuffer()
  let number_of_windows_to_this_buffer = len(filter(range(1, winnr('$')), "winbufnr(v:val) == bufnr('%')"))
  if matchstr(expand("%"), 'NERD') == 'NERD'
    wincmd c
    return
  endif
  if number_of_windows_to_this_buffer > 1
    wincmd c
  else
    bdelete
  endif
endfunction
nnoremap <silent> Q :call CloseWindowOrKillBuffer()<CR>

" Set window title by default.
set title

" Adjust signscolumn and syntastic to match wombat
hi! link SignColumn LineNr
hi! link SyntasticErrorSign ErrorMsg
hi! link SyntasticWarningSign WarningMsg

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search

" Always focus on splited window.
nnoremap <C-w>s <C-w>s<C-w>w
nnoremap <C-w>v <C-w>v<C-w>w

" Source the vimrc file after saving it
augroup sourcing
  autocmd!
  autocmd bufwritepost $MYVIMRC source $MYVIMRC
augroup END

" Open file prompt with current path
nmap <leader>ep :e <C-R>=expand("%:p:h") . '/'<CR>

" Open file prompt with home prefix
nmap <leader>eh :e ~/
" Open file prompt for SELECTED text
vmap <leader>eh :e ~/Projects

" Show undo tree
nmap <silent> <leader>u :MundoToggle<CR>

let g:ctrlp_max_files=0
let g:ctrlp_show_hidden=1
let g:ctrlp_custom_ignore = { 'dir': '\v[\/](.git|.cabal-sandbox)$' }
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_mruf_relative = 1

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

" Use Silver Searcher for CtrlP plugin (if available)
" Fallback to git ls-files for fast listing.
" Because we use fast strategies, disable caching.
let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
    let g:ctrlp_user_command = 'cd %s && ag -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git',
    \ 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f' ]
endif

" bind K to grep word under cursor
nnoremap <leader>k :grep! <C-R><C-W><CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Cursor shape
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" Open window splits in various places
" ------------------------------------
" Open split to the left
nmap <Leader>nh :leftabove  vnew<CR>
" Open split to the right
nmap <leader>nl :rightbelow vnew<CR>
" Open split above
nmap <leader>nk :leftabove  new<CR>
" Open split below
nmap <leader>nj :rightbelow new<CR>

" previous buffer, next buffer
nnoremap <Right> :bp<cr>
nnoremap <Left> :bn<cr>

nnoremap <BS> <C-^>

" delete buffer without closing pane
nnoremap <leader>d :Bd<cr>

" fuzzy find buffers
nnoremap <Tab> :CtrlPBuffer<cr>

let g:ctrlp_map = '<leader>o'

nnoremap <C-p> <C-i>

" fuzzy find MRU files (conflicts with CR)
" nnoremap <C-m> :CtrlPMRUFiles<cr>

function! SaveRegister()
  let @a = @"
endfunction

" Save unamed register into register 'a'
nmap <silent> <leader>a :call SaveRegister()<cr>
" Paste from register 'a'
nmap <leader>p "ap
" Paste from register 'a'
vmap <leader>p "ap

" Close nerdtree after a file is selected
let NERDTreeQuitOnOpen = 1

" Open NERDTree and focus current file
nmap <silent> <leader>f <ESC>:NERDTreeFind<CR>
" Toggle NERDTree window
nmap <silent> <leader>t <ESC>:NERDTreeToggle<CR>


let g:extradite_width = 60
" Hide messy Ggrep output and copen automatically
function! NonintrusiveGitGrep(term)
  execute "copen"
  " Map 't' to open selected item in new tab
  execute "nnoremap <silent> <buffer> t <C-W><CR><C-W>T"
  execute "silent! Ggrep " . a:term
  execute "redraw!"
endfunction

command! -nargs=1 GGrep call NonintrusiveGitGrep(<q-args>)
nmap <leader>gs :Gstatus<CR>
nmap <leader>gts :tabedit %<CR>:Gstatus<CR>
nmap <leader>gg :copen<CR>:GGrep
nmap <leader>gl :Extradite!<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gb :Gblame<CR>

function! CommittedFiles()
  " Clear quickfix list
  let qf_list = []
  " Find files committed in HEAD
  let git_output = system("git diff-tree --no-commit-id --name-only -r HEAD\n")
  for committed_file in split(git_output, "\n")
    let qf_item = {'filename': committed_file}
    call add(qf_list, qf_item)
  endfor
  " Fill quickfix list with them
  call setqflist(qf_list, '')
endfunction

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>

function! GitStatusDo(filter, cmd)
  execute "args " . system("git status --porcelain | grep '" . a:filter . "' | awk '{ print $2 }' | xargs")
  execute "argdo " . a:cmd
endfunction

" Sort imports on all modified Scala files
nnoremap <leader>ssi :call GitStatusDo("\.scala$", "call SortScalaImports() \| update")<CR>

set completeopt+=longest

au BufEnter *.hs compiler ghc

let g:haddock_browser = $BROWSER

" Disable haskell-vim omnifunc
let g:haskellmode_completion_ghc = 0
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Show types in completion suggestions
let g:necoghc_enable_detailed_browse = 1

" Type of expression under cursor
nmap <silent> <leader>ht :GhcModType<CR>
" Insert type of expression under cursor
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC errors and warnings
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>
" Haskell Lint
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['haskell', 'scala'] }
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle

" Hoogle for detailed documentation (e.g. "Functor")
nnoremap <silent> <leader>hi :HoogleInfo<CR>

" Hoogle for detailed documentation and prompt for input
nnoremap <leader>hI :HoogleInfo

" Hoogle, close the Hoogle window
nnoremap <silent> <leader>hz :HoogleClose<CR>


function! Pointfree()
  call setline('.', split(system('pointfree '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h. :call Pointfree()<CR>

function! Pointful()
  call setline('.', split(system('pointful '.shellescape(join(getline(a:firstline, a:lastline), "\n"))), "\n"))
endfunction
vnoremap <silent> <leader>h> :call Pointful()<CR>


inoremap jk <Esc>

nnoremap <Leader>ev :edit $MYVIMRC<Cr>

nnoremap <silent> <leader>qq :botright cwindow<cr>
nnoremap <silent> <leader>qc :cclose<cr>

" Remap H and L (top, bottom of screen to left and right end of line)
noremap H ^
noremap L $
vnoremap L g_

" Include all sources for FML
let g:fml_all_sources=1

call camelcasemotion#CreateMotionMappings('<leader>')

" Swap p and gp behavior
noremap p gp
noremap P gP
noremap gp p
noremap gP P

" Spelling highlight when in current line
hi SpellBad cterm=underline

" Send Esc to vim when in the terminal
tnoremap <leader><Esc> <C-\><C-n>

" Move to a different window when in the terminal
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='au\.com\.cba'


let g:deoplete#enable_at_startup = 1

" Undo completion
inoremap <expr><C-g> deoplete#mappings#undo_completion()

" Redraw candidates
inoremap <expr><C-l> deoplete#mappings#refresh()

" Ctrl-Space for omnicompletion
inoremap <C-@> <C-x><C-o>

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
imap <silent><expr><CR> pumvisible() ?
      \ (neosnippet#expandable() ? neosnippet#mappings#expand_impl()
      \ : deoplete#mappings#close_popup())
      \ : "\<CR>"

" inoremap <silent><expr><CR> neosnippet#expandable_or_jumpable() ? neosnippet#mappings#expand_or_jump_impl() : "\<CR>"

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (neosnippet#expandable_or_jumpable() ? neosnippet#mappings#expand_or_jump_impl()
      \ : (<SID>is_whitespace() ? "\<Tab>"
      \ : deoplete#mappings#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<C-n>"
      \ : (neosnippet#expandable_or_jumpable() ? neosnippet#mappings#expand_or_jump_impl()
      \ : (<SID>is_whitespace() ? "\<Tab>"
      \ : deoplete#mappings#manual_complete()))

imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace()
  let col = col('.') - 1
  return ! col || getline('.')[col - 1] =~? '\s'
endfunction

let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.scala = [
  \ '[^. *\t]\.\w*',
  \ '[:\[,] ?\w*',
  \ '^import .*'
  \]

let vim_markdown_preview_toggle=3
let vim_markdown_preview_github=1

let g:oblique#incsearch_highlight_all=1

autocmd FileType scala call <SID>EnMappings()

function! s:EnMappings()
  nnoremap <buffer> <silent> <Leader>st :EnType<CR>
  nnoremap <buffer> <silent> K :EnDocBrowse<CR>
  nnoremap <buffer> <silent> <C-]> :EnDeclaration<CR>
endfunction

" disable all runtime snippets
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" let g:neosnippet#enable_completed_snippet = 1

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'

function! s:ChangeListenAddress()
  call serverstop($NVIM_LISTEN_ADDRESS)
  call serverstart('/tmp/nvim_' . fnamemodify(getcwd(),':t') . '.sock')
endfunction

call <SID>ChangeListenAddress()

