syntax on
set number
set norelativenumber "设置距离当前行号多少行
set cursorline "在当前行显示下划线
set wrap
set showcmd
set wildmenu
" set hlsearch
" exec "nohlsearch"
set incsearch
set ignorecase
set smartcase
set nocompatible              " be iMproved, required


filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}
Plugin 'w0rp/ale'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'arcticicestudio/nord-vim' 
Plugin 'ycm-core/YouCompleteMe'
Plugin 'mbbill/undotree'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

map R :source $MYVIMRC<CR>
map S :w<CR>
map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map st :set nosplitbelow<CR>:split<CR> 
map sb :set splitbelow<CR>:split<CR>

map <space> <C-w>
" map << :res +5<CR>
map > :vertical resize-5<CR>
map < :vertical resize+5<CR>

" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = ""
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "i"


" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" ===
" === MarkdownPreview
" ===
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_refresh_slow = 0
let g:mkdp_command_for_global = 0
let g:mkdp_open_to_the_world = 0
let g:mkdp_open_ip = ''
let g:mkdp_browser = 'chromium'
let g:mkdp_echo_preview_url = 0
let g:mkdp_browserfunc = ''
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1
    \ }
let g:mkdp_markdown_css = ''
let g:mkdp_highlight_css = ''
let g:mkdp_port = ''
let g:mkdp_page_title = '「${name}」'

" ===
" === Python-syntax
" ===
let g:python_highlight_all = 1
" let g:python_slow_sync = 0

" ===
" === ale
" ===
let b:ale_linters = ['pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" ===
" === You Complete ME
" ===
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap g/ :YcmCompleter GetDoc<CR>
nnoremap gt :YcmCompleter GetType<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
let g:ycm_autoclose_preview_window_after_completion=0
let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_use_clangd = 0
let g:ycm_python_interpreter_path = "/usr/local/bin/python3"
let g:ycm_python_binary_path = "/usr/local/bin/python3"

"""""""""""""""""""""" "Quickly Run """""""""""""""""""""" 
map <C-b> :call CompileRunGcc()<CR> 
func! CompileRunGcc() 
    exec "w" 
    if &filetype == 'c' 
	exec "!g++ % -o %<" 
        exec "!time ./%<" 
    elseif &filetype == 'cpp' 
        exec "!g++ % -o %<" 
	exec "!time ./%<" 
    elseif &filetype == 'java' 
        exec "!javac %" 
	exec "!time java %<" 
    elseif &filetype == 'sh' 
	:!time bash % 
    elseif &filetype == 'python' 
	exec "!time python3 -m ipdb %" 
    elseif &filetype == 'html' 
	exec "!chrome % &" 
    elseif &filetype == 'go' 
	" exec "!go build %<" 
	exec "!time go run %" 
    elseif &filetype == 'mkd' 
	exec "!~/.vim/markdown.pl % > %.html &" 
	exec "!chrome %.html &" 
    endif
endfunc


" w 下一个词 b 上一个词  0 移动到行首
" f 寻找 f: 寻找到冒号位置
" change word ->  cw 删除光标后的单词，完全删除需要将光标移动至单词最前面 ci' 删除在引号重的词
" change in word -> 删除光标所在的单词
" yiw 复制单词 yw 复制光标后单词  
" df: 删除至冒号位置
" dw 删除光标后单词 diw删除光标所在单词
" shift + v 选中行
" I 在行首插入 A在行尾追加
" 选中行输入 :normal+ 操作 如:normal Itest 在选中的行首插入test
