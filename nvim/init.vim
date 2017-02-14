" READMEN : 
" 剪切板生效需要安装工具 : xclip 
"
call plug#begin('~/.config/nvim/plugged')
Plug 'tomasr/molokai'
Plug 'justmao945/vim-clang',{'for':['c','cpp','cc']}
Plug 'supertab'
Plug 'scrooloose/syntastic',{'for':['c','cpp','cc']}
" 语法检测
Plug 'vim-airline/vim-airline'
" 底栏
Plug 'winmanager'
Plug 'taglist.vim'

Plug 'vim-utils/vim-man'
" 在 vim 看 man

Plug 'tpope/vim-commentary'
" 简洁代码注释  gc 操作

Plug 'StanAngeloff/php.vim',{'for':'php'}
"Plug 'shawncplus/phpcomplete.vim'

" Markdown 
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'


call plug#end()

"{ 
set t_Co=256
colorscheme molokai
"} 配色

set visualbell
set background=dark

set expandtab shiftwidth=2 softtabstop=2
autocmd Filetype python setlocal shiftwidth=4 softtabstop=4
"{ Spell 
autocmd FileType markdown setlocal spell spelllang=en_us,cjk
" 根据 markdown 文件类型执行 spell 功能
"}


"{ 基本配置 
set autoindent                " 设置自动对齐(缩进)
set smartindent                    " 智能对齐方式
set wrap              " 自动换行
set linebreak              " 整词换行

set cindent                   " 使用 C/C++ 语言的自动缩进方式
set backspace=2               " 设置退格键可用
set mouse=a                   " 使用鼠标
set number                   " 显示行号
set cul                          " 显示当前行下划线

set tabstop=8                   " 设置制表符(tab键)的宽度
set softtabstop=8                " 设置软制表符的宽度
set expandtab             " Tab替换空格


set cursorline                    " 高亮当前行
                   
set nobackup
set noswapfile                   "禁止生成临时文件
set wildmenu                     "补全命令

set scrolloff=4                  " 光标移动到buffer的顶部和底部时保持3行距离,再往下移动页面时，光标与最后一行始终保持4格的距

" 
"{ clang 配置
let g:clang_cpp_options = '-std=c++11 -lpthread '
"}


"{设置超级TAB的补全
let g:SuperTabRetainCompletionType=0
let g:SuperTabDefaultCompletionType="<C-X><C-U>"
"}

"{   syntastic
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"}


"{设置分屏浏览
let Tlist_Show_One_File=0
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<CR>
"}


"{ 日常习惯设置
"插入模式下的非递归映射，自动补全的映射
inoremap <C-F>  <C-X><C-D>
cnoremap Q! q!
cnoremap Q1 q!
"command  Q  q
"command  Wq wq
"command  WQ wq
"command  W  w

"}

