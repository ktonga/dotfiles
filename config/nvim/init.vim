call plug#begin('~/.config/nvim/plugged')

" Support bundles
Plug 'jgdavey/tslime.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'w0rp/ale'
Plug 'moll/vim-bbye'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'bkad/CamelCaseMotion'
Plug 'mileszs/ack.vim'
Plug 'dbmrq/vim-ditto'
Plug 'machakann/vim-highlightedyank'

" Search
Plug 'haya14busa/is.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'haya14busa/vim-asterisk'

" Autocompletion
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-neosnippet'

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'gregsexton/gitv', {'on': ['Gitv']}
Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-conflicted'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

" Bars, panels, and files
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'romainl/vim-qf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

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
Plug 'AndrewRadev/linediff.vim'
Plug 'junegunn/vim-easy-align'

" Services
Plug 'mrtazz/simplenote.vim'

" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

" better filetype support
Plug 'plasticboy/vim-markdown' " depends on tabular
Plug 'LnL7/vim-nix'
Plug 'dag/vim-fish'
" Plug 'elzr/vim-json'

" Haskell
Plug 'dag/vim2hs'
Plug 'Twinside/vim-hoogle'
" Plug 'meck/vim-brittany'
Plug 'parsonsmatt/intero-neovim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }

" Scala
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
Plug 'GEverding/vim-hocon'
Plug '~/Repos/contrib/ensime-vim'

" Fix Groovy indent (Jenkinsfile)
Plug 'vim-scripts/groovyindent-unix'

" Colorscheme
Plug 'vim-scripts/wombat256.vim'

" Local plugins
Plug 'ktonga/vim-follow-my-lead'
"Plug '~/Projects/personal/vim-follow-my-lead'
"Plug '~/.vim/bundle/vim-sbtquickfix'

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

" Reload files modified outside vim
au FocusGained * :checktime

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

" Make Conceal colors readable (specific to wombat256mod)
hi Conceal ctermfg=111 ctermbg=NONE guifg=White guibg=Normal

let g:airline_powerline_fonts = 1

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

" Adjust signscolumn to match wombat
hi! link SignColumn LineNr

set statusline+=%#warningmsg#
set statusline+=%*

" Use pleasant but very visible search hilighting
hi Search ctermfg=white ctermbg=173 cterm=none guifg=#ffffff guibg=#e5786d gui=none
hi! link Visual Search

map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)

map *  <Plug>(asterisk-z*)<Plug>(is-nohl-1)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)
map #  <Plug>(asterisk-z#)<Plug>(is-nohl-1)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)

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

" Return to last edit position when opening files (You want this!)
augroup last_edit
  autocmd!
  autocmd BufReadPost *
       \ if line("'\"") > 0 && line("'\"") <= line("$") |
       \   exe "normal! g`\"" |
       \ endif
augroup END

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
nnoremap <leader>bd :Bd<cr>

nnoremap <C-p> <C-i>

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
nmap <silent> <leader>xx <ESC>:NERDTreeFind<CR>
" Toggle NERDTree window
nmap <silent> <leader>xl <ESC>:NERDTreeToggle<CR>

nmap <leader>gs :Gstatus<CR>
nmap <leader>gts :tabedit %<CR>:Gstatus<CR>
nmap <leader>gl :silent Gllog!<CR>
nmap <leader>gL :silent Gllog! --<CR>
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
  call setqflist(qf_list, 'r')
endfunction

" Show list of last-committed files
nnoremap <silent> <leader>g? :call CommittedFiles()<CR>:copen<CR>

function! GitStatusDo(filter, cmd)
  execute "args " . system("git status --porcelain | grep '" . a:filter . "' | awk '{ print $2 }' | xargs")
  execute "argdo " . a:cmd
endfunction

" Sort imports on all modified Scala files
nnoremap <leader>ssi :call GitStatusDo("\.scala$", "call SortScalaImports() \| update")<CR>

set completeopt+=menuone,noselect,noinsert

" let g:LanguageClient_serverCommands = {
"     \ 'haskell': ['ghcide', '--lsp']
"     \ }
"    \ 'haskell': ['hie', '-l', '/tmp/hie.log', "-d"]
" ,
"     \ 'scala': ['metals-vim']

highlight clear SpellBad
highlight clear SpellCap
highlight SpellBad cterm=underline
highlight SpellCap cterm=underline

let g:ale_set_highlights=1
let g:LanguageClient_diagnosticsEnable = 1
let g:LanguageClient_changeThrottle = 0

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

" Show error markers
set signcolumn=yes

" let g:haddock_browser = $BROWSER

" autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Show types in completion suggestions
" let g:necoghc_enable_detailed_browse = 1

" Type of expression under cursor
" nmap <silent> <leader>ht :GhcModType<CR>
" Clear type selection
" nmap <silent> <leader>hl :GhcModTypeClear<CR>
" Insert type of expression under cursor
" nmap <silent> <leader>hT :GhcModTypeInsert<CR>
" GHC Mod errors and lint async
" nmap <silent> <leader>hm :GhcModCheckAndLintAsync<CR>

" Hoogle the word under the cursor
nnoremap <silent> <leader>hh :Hoogle<CR>

" Hoogle and prompt for input
nnoremap <leader>hH :Hoogle<SPACE>

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

let g:ale_linters = {'haskell': [], 'scala': []}

let g:intero_backend = {'command': 'cabal v2-repl'}

function! HaskellFormatImports()
  go 1
  normal V
  /\v(^.)&(^(import)@!)&(^(\{)@!)&(^(module)@!)/-1
  exe "'<,'>!stylish-haskell"
  normal V
endfunction

augroup haskellMappings
  au!
  " Maps for Haskell. Restrict to Haskell buffers so the bindings don't collide.

  au FileType haskell setlocal formatprg=brittany
  au FileType haskell nnoremap <silent> <leader>fi :call HaskellFormatImports()<CR>

  au FileType haskell nnoremap <buffer> <silent> K :call LanguageClient_textDocument_hover()<CR>
  au FileType haskell nnoremap <buffer> <silent> gd :call LanguageClient_textDocument_definition()<CR>

  au FileType haskell nnoremap <silent> <leader>ee :call LanguageClient#explainErrorAtPoint()<CR>
  au FileType haskell nnoremap <silent> <leader>rn :call LanguageClient_textDocument_rename()<CR>
  au FileType haskell nnoremap <silent> <leader>ws :call LanguageClient#workspace_symbol()<CR>
  au FileType haskell nnoremap <silent> <leader>ds :call LanguageClient#textDocument_documentSymbol()<CR>
  au FileType haskell nnoremap <silent> <leader>lr :call LanguageClient#textDocument_references()<CR>

  " Start Ghcid
  au FileType haskell nnoremap <silent> <leader>hg :Ghcid -c cabal v2-repl<CR>
  " Start Ghcid on test package
  au FileType haskell nnoremap <leader>ht :Ghcid -c cabal v2-repl test:tests
  " Kill Ghcid
  au FileType haskell nnoremap <silent> <leader>hk :GhcidKill<CR>

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  " Kill Intero bg process
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open reload Intero ghci session
  au FileType haskell nnoremap <silent> <leader>ir :InteroReload<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iv :InteroOpen<CR><C-W>H
  " Hide Intero window
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Automatically reload on save
  " au BufWritePost *.hs InteroReload

  " Load module in current file
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  " Load current file
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.

  " Show generic type
  au FileType haskell map <silent> <leader>it <Plug>InteroGenericType
  " Show concrete type
  au FileType haskell map <silent> <leader>iT <Plug>InteroType
  " Insert type of expression in the line above
  au FileType haskell nnoremap <silent> <leader>iti :InteroTypeInsert<CR>

  " Navigation
  " au FileType haskell nnoremap <silent> <C-]> :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

" Intero starts automatically. Set this if you'd like to prevent that.
let g:intero_start_immediately = 0

inoremap jk <Esc>

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap <Leader>ev :edit $MYVIMRC<Cr>

" Show quickfix window
nnoremap <silent> <leader>qq :botright cwindow<cr>
" Hide quickfix window
nnoremap <silent> <leader>qc :cclose<cr>

" Show location window
nnoremap <silent> <leader>ll :botright lwindow<cr>
" Hide location window
nnoremap <silent> <leader>lc :lclose<cr>

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

" Unlimited scrollback for terminal
set scrollback=-1

" Send Esc to vim when in the terminal
tnoremap ;<Esc> <C-\><C-n>

" Send Ctrl-L to vim when in the terminal
tnoremap ;l <C-\><C-l>

" Open a terminal in a vertical split
noremap <leader>tt :botright vsplit term://fish<cr>:startinsert<cr>

" Open a terminal in a vertical split
noremap <leader>tn :botright vsplit term://nix-shell --command fish<cr>:startinsert<cr>

" Start SBT in a terminal in a vertical split
noremap <leader>ts :botright vsplit term://sbt<cr>:startinsert<cr>

" Start Ranger on current file's dir in a terminal in a horizontal split
noremap <leader>tr :rightbelow split term://ranger --selectfile %<cr>:startinsert<cr>

" Start Grip on current file in a terminal in a horizontal split
noremap <leader>tg :rightbelow 5split term://grip -b '%'<cr>

let g:scala_sort_across_groups=1
let g:scala_first_party_namespaces='io\.simplemachines'


autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

" Use <TAB> to select the popup menu:
imap <expr> <Tab> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<Tab>"
imap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

imap <C-k> <Plug>(neosnippet_jump)

" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu.
imap <expr> <CR> ncm2_neosnippet#expand_or(pumvisible() ? "\<C-y>" : "\<CR>", 'n')

" Ctrl-Space for omnicompletion
inoremap <C-Space> <C-x><C-o>

let g:vim_markdown_toc_autofit = 1

" Use autocmds to check your text automatically and keep the highlighting
" up to date (easier):
autocmd FileType markdown,text,tex DittoOn  " Turn on Ditto's autocmds
nmap <leader>di <Plug>ToggleDitto           " Turn Ditto on and off

autocmd FileType markdown call <SID>MarkdownSettings()

function! s:MarkdownSettings()
  setlocal wrap
  setlocal conceallevel=2
endfunction

" autocmd FileType json setlocal foldmethod=syntax
autocmd FileType json setlocal foldmethod=indent

autocmd FileType scala call <SID>EnMappings()

function! s:EnMappings()
  nnoremap <buffer> <silent> <Leader>st :EnType<CR>
  xnoremap <buffer> <silent> <Leader>st :EnType selection<CR>
  nnoremap <buffer> <silent> <Leader>su :EnUsages<CR>
  nnoremap <buffer> <silent> K :EnDocBrowse<CR>
  nnoremap <buffer> <silent> <C-]> :EnDeclaration<CR>
endfunction

" disable all runtime snippets
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'

function! s:ChangeListenAddress()
  if getcwd() =~ '\v.+/Projects/.+'
    call serverstop($NVIM_LISTEN_ADDRESS)
    call serverstart($TMPDIR . 'nvim_' . fnamemodify(getcwd(),':t') . '.sock')
  endif
endfunction

call <SID>ChangeListenAddress()

set inccommand=split

let g:ensime_server_v2=1

let g:fzf_command_prefix='Fzf'

command! -bang FzfLHist call fzf#run(fzf#wrap({
\ 'source': map(filter(map(extend(map(range(bufnr('$'), 1, -1), 'bufname(v:val)'),
\                                 v:oldfiles),
\                          'fnamemodify(v:val, ":p")'),
\                      'filereadable(v:val) && stridx(v:val, getcwd()) == 0'),
\               'fnamemodify(v:val, ":.")'),
\ 'options': '--prompt "LHist> " --exit-0'}, <bang>0))

" fuzzy find buffers
nnoremap <Tab> :FzfBuffers<cr>
" fuzzy find files
nnoremap <leader>ff :FzfFiles<cr>
" fuzzy find history
nnoremap <leader>fh :FzfLHist<cr>
" grep with fzf ag
nnoremap <leader>fg :FzfAg<SPACE>

function! s:TermMappings()
  setlocal nonumber
  " Move to a different window when in the terminal
  tnoremap <buffer> <C-h> <C-\><C-n><C-w>h
  tnoremap <buffer> <C-j> <C-\><C-n><C-w>j
  tnoremap <buffer> <C-k> <C-\><C-n><C-w>k
  tnoremap <buffer> <C-l> <C-\><C-n><C-w>l
endfunction

function! s:FzfUnmap()
  silent! tunmap <buffer> <C-h>
  silent! tunmap <buffer> <C-j>
  silent! tunmap <buffer> <C-k>
  silent! tunmap <buffer> <C-l>
endfunction

autocmd TermOpen * call <SID>TermMappings()
autocmd FileType fzf call <SID>FzfUnmap()

if executable('ag')
  let g:ackprg = 'ag --vimgrep --smart-case'
endif

" grep with ag
nnoremap \ :LAck!<SPACE>
" grep word under cursor
nnoremap <leader>aw :LAck! <C-R><C-W><CR>
" grep by filename
nnoremap <leader>af :AckFile<SPACE>

" let g:vim_json_syntax_conceal = 0

" copy current file relative path
nnoremap <leader>cf :let @+=expand("%")<CR>
" copy current file absolute path
nnoremap <leader>cF :let @+=expand("%:p")<CR>
" copy current file filename
nnoremap <leader>ct :let @+=expand("%:t")<CR>
" copy current file directory name
nnoremap <leader>ch :let @+=expand("%:p:h")<CR>

set stl+=%{ConflictedVersion()}

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

