call plug#begin('~/.config/nvim/plugged')

Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
" 底栏
Plug 'winmanager'
Plug 'taglist.vim'

Plug 'tpope/vim-commentary'
" 简洁代码注释  gc 操作
Plug 'tpope/vim-surround'
" vim 文本操作 插件 

Plug 'ervandew/supertab'

Plug 'vim-utils/vim-man',{'for':['c','cpp']}
" 在 vim 看 man
Plug 'justmao945/vim-clang',{'for':['c','cpp','cc']}
Plug 'scrooloose/syntastic',{'for':['c','cpp','cc','php']}
" 语法检测

"Plug 'Shougo/vimproc',{'for':'php'} " vim 的异步执行库，需要进入 Make 一下，具体看文档
"Plug 'Shougo/unite.vim',{'for':'php'}
"Plug 'm2mdas/phpcomplete-extended-laravel',{'for':'php'}
"Plug 'm2mdas/phpcomplete-extended',{'for':'php'}
Plug 'StanAngeloff/php.vim',{'for':'php'}
"Plug 'shawncplus/phpcomplete.vim',{'for':'php'}
Plug 'phpvim/phpcd.vim',{'for':'php'}
Plug 'mkusher/padawan.vim'
Plug 'vim-scripts/progressbar-widget' " 用来显示索引进度的插件

Plug 'fatih/vim-go',{'for':'go'}

call plug#end()

"{ 
set t_Co=256
colorscheme molokai
"} 配色

set visualbell
set background=dark

set expandtab shiftwidth=2 softtabstop=2


"{ 基本配置 
filetype on                   " 打开文件检测功能
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
"{ 系统粘贴设置  尽针对 nvim
set clipboard+=unnamedplus
"}

" {  PHPcd 补全 
autocmd FileType php setlocal omnifunc=phpcd#CompletePHP
"启动 nvim 默认的 php 补全
" 安装方式 
" 需求 : PHP 5.3+ neovim PCNTL扩展 Composer支持 
"        Msgpack 0.5.7+ : 安装略麻烦，需要先安装  pecl ， 再安装特定版本的
"        Msgpack-0.5.7 
"        参考 ： 
"        msgpack : https://github.com/msgpack/msgpack-php
"        pecl 安装 : 参照 
"                   但最后的 pecl-http 安装 可能装不上,但 pecl
"                   已经装上了，好像不管也可以
"        Msgpack :  http://blog.sina.com.cn/s/blog_6262a50e0101rcrb.html
"        但要注意你要装的是 0.5.7 而不是 0.5.5Msgpack
" 使用方法
"     在 composer 管理的 应用根目录下 , composer update ，好像加载什么缓存
"      再打开 neovim 利用 索引进度插件，可以看到进度，完成后使用
"} 
"{ Padawan.vim 
" let $PATH=$PATH . ':' . expand('~/.composer/vendor/bin')
" let g:padawan#composer_command = "php /usr/local/bin/composer"
"}

"{ spell 自动单词检验 
" 使用提示 
" ]s 跳到下个出错位置
" [s 跳刀上个出错位置
" z= 进行修改
" zg 加入个人单词表
" zw 从个人单词中删除
" set spell   "开启语法检测 
" set spelllang=en  " 只对英语进行拼写检查
 autocmd FileType tex setlocal spell spelllang=en
 autocmd FileType markdown set spell spelllang=en,cjk " 根据文件类型 md 执行 set spell 和 set spelllang=en 命令
 
"{
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline
"} 修改配色，以下滑线的方式列出错误
"}

"{ clang 配置
let g:clang_cpp_options = '-std=c++11 -lpthread '
"}

"{ 补全建设置 
"let g:SuperTabRetainCompletionType=0 "是否记忆上次补全 
"let g:SuperTabDefaultCompletionType="<C-X><C-O>" 默认补全，初始值为 P 
inoremap <C-O>             <C-X><C-O>
inoremap <C-P>             <C-X><C-P>
inoremap <C-F>             <C-X><C-F>
inoremap <C-D>             <C-X><C-D>
inoremap <C-L>             <C-X><C-L> 
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
command  Q  q
command  Wq wq
command  WQ wq
command  W  w

"}

