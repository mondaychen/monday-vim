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
  NeoBundle 'Shougo/vimproc', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make',
        \     'linux' : 'make',
        \     'unix' : 'gmake',
        \    },
        \ }
  NeoBundle 'Shougo/neocomplcache'
  NeoBundle 'Lokaltog/vim-easymotion' "<Leader><Leader>w
  NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'ervandew/supertab'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'myusuf3/numbers.vim'
  NeoBundle 'majutsushi/tagbar' " Dependencies: vim 7.0 & Exuberant ctags 5.5
  NeoBundle 'othree/html5.vim'
  NeoBundle 'digitaltoad/vim-jade'
  NeoBundle 'hail2u/vim-css3-syntax'
  NeoBundle 'skammer/vim-css-color'
  NeoBundle 'wavded/vim-stylus'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'plasticboy/vim-markdown'
  NeoBundle 'rstacruz/sparkup', {'rtp': 'vim/'}
  NeoBundle 'fatih/vim-go' " Go lang
  NeoBundle 'derekwyatt/vim-scala' " Scala
  if executable('ag')
    NeoBundle 'rking/ag.vim'
  endif
  " vim-scripts repos
  NeoBundle 'L9'
  NeoBundle 'FuzzyFinder'

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

  set nobackup
  if has('persistent_undo')
    set undofile
    set undodir=$HOME/.vim/undo
    set undolevels=1000
    set undoreload=10000
  endif
" }

" Bundles settings {
  " Use neocomplcache.
  let g:neocomplcache_enable_at_startup = 1
  " Use smartcase.
  let g:neocomplcache_enable_smart_case = 1
  " Set minimum syntax keyword length.
  let g:neocomplcache_min_syntax_length = 3
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

  "use ag as the ctrlp command
  let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden
              \ --ignore .git
              \ --ignore out
              \ --ignore .svn
              \ --ignore .hg
              \ --ignore .DS_Store
              \ -g ""'
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
  set completeopt-=preview        " disable scratch preview window
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
  nmap <F6> :TagbarToggle<CR>
  let g:tagbar_autofocus = 1
  " Tab page
  nmap <S-Left> :tabp<CR>
  nmap <S-Right> :tabn<CR>
  nmap <Bslash>t :tabnew<CR>
  nmap <Bslash>1 :tabn 1<CR>
  nmap <Bslash>2 :tabn 2<CR>
  nmap <Bslash>3 :tabn 3<CR>
  nmap <Bslash>4 :tabn 4<CR>
  nmap <Bslash>5 :tabn 5<CR>
  nmap <Bslash>6 :tabn 6<CR>
  nmap <Bslash>7 :tabn 7<CR>
  nmap <Bslash>8 :tabn 8<CR>
  nmap <Bslash>9 :tabn 9<CR>
  nmap <Bslash>0 :tablast<CR>
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

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" Run python code in Vim
autocmd FileType python nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>
