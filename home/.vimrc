" Environment {
  set nocompatible
  filetype on
  filetype off
" }

" NeoBundle {
  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
  endif

  call neobundle#rc(expand('~/.vim/bundle/'))

  " Bundles
  " on Github
  NeoBundle 'Shougo/vimproc' " After install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Lokaltog/vim-easymotion'
  NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'kien/ctrlp.vim'
  NeoBundle 'ervandew/supertab'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'myusuf3/numbers.vim'
  NeoBundle 'lepture/vim-css'
  NeoBundle 'wavded/vim-stylus'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  " vim-scripts repos
  NeoBundle 'L9'
  NeoBundle 'FuzzyFinder'
  if executable('ack')
    NeoBundle 'ack.vim'
  endif

  " Installation check.
  if neobundle#exists_not_installed_bundles()
    echomsg 'Not installed bundles : ' .
          \ string(neobundle#get_not_installed_bundle_names())
    echomsg 'Please execute ":NeoBundleInstall" command.'
    "finish
  endif
" }

" General {
  syntax on
  filetype plugin indent on  " automatically detect file types
  set mouse=a                " automatically enable mouse usage
  set mousehide              " hide the mouse cursor while typing
  set encoding=utf-8
  scriptencoding utf-8
  set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936

  if has ('x') && has ('gui') " on Linux use + register for copy-paste
    set clipboard=unnamedplus
  elseif has ('gui') " one mac and windows, use * register for copy-paste
    set clipboard=unnamed
  endif

  set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
  set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
  set virtualedit=onemore         " allow for cursor beyond last character
  set history=800                 " Store a ton of history (default is 20)
  set hidden                      " allow buffer switching without saving
  "set autochdir                   " change directory to the current window

  set backup
  if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
  endif
" }

" Formatting {
  set nowrap                      " wrap long lines
  set autoindent                  " indent at the same level of the previous line
  set expandtab                   " tabs are spaces, not tabs
  set shiftwidth=2                " use indents of 2 spaces
  set tabstop=2                   " an indentation every two columns
  set softtabstop=2               " let backspace delete indent
  set diffopt+=iwhite,vertical    " ignore the difference of indents
  set matchpairs=(:),{:},[:],<:>
  set foldmethod=marker
  set colorcolumn=80

  " Remove trailing whitespaces and ^M chars
  autocmd BufWritePre <buffer> call StripTrailingWhitespace()
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
" }

" UI {
  set tabpagemax=15

  set t_Co=512
  colorscheme molokai
  hi ColorColumn ctermbg=black

  if has('cmdline_info')
    set ruler                   " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd                 " show partial commands in status line and
                                " selected characters/lines in visual mode
  endif

  if has('statusline')
    set laststatus=2
  endif

  set rnu                         " relative line number
  set numberwidth=4               " set the width of line number gutter column
  set linespace=2                 " set spaces between rows
  set ignorecase                  " case insensitive search
  set backspace=indent,eol,start  " backspace for dummies
  set smartcase                   " case sensitive when uc present
  set showmatch                   " show matching brackets/parenthesis
  set hlsearch                    " highlight search terms
  set incsearch                   " find as you type search
  set wildmenu                    " show list instead of just completing
  set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all
  set whichwrap=b,s,h,l,<,>,[,]   " backspace and cursor keys wrap to
  set scrolljump=5                " lines to scroll when cursor leaves screen
  set scrolloff=3                 " minimum lines to keep above and below cursor
  set foldenable                  " auto fold code
  set cursorline                  " highlight current line
  set anti                        " make text pretty
  set list
  set listchars=tab:▸\ ,trail:·
" }

" Key Mapping {
  nnoremap <F3> :NumbersToggle<CR>
" }

" Functions {
  function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line('.')
    let c = col('.')
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
  endfunction
" }
