set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"======== Visual Look && Feel =========
Plugin 'bling/vim-airline'
Plugin 'chriskempson/base16-vim'
Plugin 'tomasr/molokai'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'altercation/vim-colors-solarized'

"======== File Management =========
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-fugitive'

"======== Editing  =========
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'tmhedberg/SimpylFold'
Plugin 'scrooloose/nerdcommenter'

" ================ Snippets & AutoComplete ====================
Plugin 'scrooloose/syntastic'
Plugin 'Valloric/YouCompleteMe'
Plugin 'marijnh/tern_for_vim'
Plugin 'Raimondi/delimitMate'

" ================ Miscellaneous ====================
Plugin 'Townk/vim-autoclose'
Plugin 'Valloric/MatchTagAlways'

" ================ HTML / CSS Syntax ====================
Plugin 'digitaltoad/vim-jade'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'
"Plugin 'wavded/vim-stylus'
Plugin 'mattn/emmet-vim'
Plugin 'elzr/vim-json'
Plugin 'othree/html5.vim'
Plugin 'slim-template/vim-slim'
Plugin 'rstacruz/sparkup'
Plugin 'posva/vim-vue'
"Plugin 'curist/vim-angular-template'
"Plugin 'burnettk/vim-angular'

" ================ Javascript Syntax ====================
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'pangloss/vim-javascript'
"Plugin 'kchmck/vim-coffee-script'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'einars/js-beautify'
Plugin 'walm/jshint.vim'
Plugin 'ajh17/Spacegray.vim'
call vundle#end()            " required

"syntax"
syntax enable
filetype plugin indent on

" highlight the code"
set cursorline

" speed up from normal to insert mode
set ttimeoutlen=5 ttimeoutlen=0

" theme"
set background=dark
set t_Co=256 
colorscheme molokai
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_semantic_tigger={
	\	'css': ['re!^\s{4}', 're!:\s+'],		
	\	'html': ['</'],
	\}
let g:tern#arguments=["--no-port-file","--persistent"]
let g:tern_map_keys=1
let g:tern_show_signature_in_pum=1
let g:tern_show_arguments_hints='on_hold'

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#left_sep = ' '

" Add a different color for the cursor line
hi CursorLine guibg=#000000 ctermbg=0 gui=none

" font
set guifont=Meslo\ LG\ M\ Regular\ for\ Powerline:h11

" editing
set mouse=a
set backspace=2
set pastetoggle=<F2>
let mapleader=';'

" folder 
set foldmethod=indent
au BufWinLeave * silent mkview  " 保存文件的折叠状态
au BufRead * silent loadview    " 恢复文件的折叠状态

" line wrapping
set wrap
set linebreak
set nolist  " list disables linebreak
set ruler                     " show the line number on the bar
"set more                      " use more prompt
set autoread                  " watch for file changes
set number

" set speed of esc from insert to normal mode
set timeoutlen=1000 ttimeoutlen=0

" crtl P open file in whole window
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*/node_modules/*,*.so,*.swp,*.zip     
let g:ctrlp_custom_ignore = {'dir':  '\v[\/]\.(git|hg|svn)$', 'file': '\v\.(exe|so|dll)$'}

" highlight and partial search results "
set hlsearch
set incsearch
set smartcase

"smarty
let smarty_left_delimiter='{%'
let smarty_right_delimiter='%}'

" auto closing
:inoremap ( ()<Esc>i
:inoremap { {}<Esc>i
:inoremap " ""<Esc>i

nmap <Space> :nohl<Enter>
imap <C-H> <Left>
imap <C-J> <Down>
imap <C-K> <Up>
imap <C-L> <Right>

" call jsbeautify
map <c-f> :call JsBeautify()<cr>
" NERDTree
map \ :NERDTreeToggle<cr>
" 当不带参数打开Vim时自动加载项目树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"当所有文件关闭时关闭项目树窗格
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', '\~$', 'node_modules'] "ignore files in NERDTree
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1

"file
set encoding=utf-8
set fileencoding=utf-8
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4 
set showcmd          " show command in bottom bar
set wildmenu            " visual autocomplete for command menu"
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]:

" Buffers to change buffer files" 
map <S-x> :bd<CR>
map <D-k> :bnext<CR>
map <D-j> :bprev<CR>
noremap <C-s> :update<cr>
vnoremap <C-s> <C-C>:update<cr>
inoremap <C-s> <C-O><C-s>

"setlocal spell spelllang=en
"set spell spelllang=en
set spellfile=~/.vim/spell/en.utf-8.add

"to save file pressing esc twice 
map <Esc><Esc> :w<CR>

set laststatus=2

"syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1 
let g:syntastic_auto_loc_list = 1 
let g:syntastic_check_on_open = 1 
let g:syntastic_check_on_wq = 0 
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint'
let g:syntastic_vue_checkers = ['eslint']
