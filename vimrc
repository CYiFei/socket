" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"filetype plugin indent on

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
"set hidden		" Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
set cuc
set cul
highlight CursorLine cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE 

set laststatus=2
"在底部顯示絕對路徑
highlight StatusLine cterm=bold ctermfg=yellow ctermbg=blue
function! CurDir()
	let curdir = substitute(getcwd(), $HOME, "~", "g")
	return curdir
endfunction
set statusline=[%n]\ %f%m%r%h\ \|\ \ pwd:\ %{CurDir()}\ \ \|%=\|\ %l,%c\ %p%%\ \|\ ascii=%b,hex=%b%{((&fenc==\"\")?\"\":\"\ \|\ \".&fenc)}\ \|\ %{$USER}\ @\ %{hostname()}\




set number

set hlsearch

set tags=tags
set autochdir

set nocompatible              " 去除VI一致性,必须
filetype off                  " 必须

" 设置包括 vundle 和初始化相关的 runtimepath
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 另一种选择, 指定一个 vundle 安装插件的路径
"call vundle#begin('~/some/path/here')
" 让 vundle 管理插件版本,必须
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'


Plugin 'vim-scripts/taglist.vim'

Plugin 'Valloric/YouCompleteMe'




" 所有插件需要在下面这行之前配置
call vundle#end()            " 必须
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on


"配置nerdtree
let NERDTreeHighlightCursorline = 1       " 高亮当前行
let NERDTreeShowLineNumbers     = 1       " 显示行号
" 忽略列表中的文件
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.egg$', '^\.git$', '^\.repo$', '^\.svn$', '^\.hg$' ]
" 启动 vim 时打开 NERDTree
autocmd vimenter * NERDTree
" 当打开 VIM，没有指定文件时和打开一个目录时，打开 NERDTree
autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" 关闭 NERDTree，当没有文件打开的时候
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end

" <leader>nt 打开 nerdtree 窗口，在左侧栏显示
map <leader>nt :NERDTreeToggle<CR>
" <leader>tc 关闭当前的 tab
map <leader>tc :tabc<CR>
" <leader>to 关闭所有其他的 tab
map <leader>to :tabo<CR>
" <leader>ts 查看所有打开的 tab
map <leader>ts :tabs<CR>
" <leader>tp 前一个 tab
map <leader>tp :tabp<CR>
" <leader>tn 后一个 tab
map <leader>tn :tabn<CR>


let g:tagbar_ctags_bin = 'ctags' " tagbar 依赖 ctags 插件
let g:tagbar_width     = 30      " 设置 tagbar 的宽度为 30 列，默认 40 列
let g:tagbar_autofocus = 1       " 打开 tagbar 时光标在 tagbar 页面内，默认在 vim 打开的文件内
let g:tagbar_left      = 1       " 让 tagbar 在页面左侧显示，默认右边
let g:tagbar_sort      = 1       " 标签不排序，默认排序

" <leader>tb 打开 tagbar 窗口，在左侧栏显示
map <leader>tb :TagbarToggle<CR>






let Tlist_Show_One_File           = 1    " 只显示当前文件的tags
let Tlist_GainFocus_On_ToggleOpen = 1    " 打开 Tlist 窗口时，光标跳到 Tlist 窗口
let Tlist_Exit_OnlyWindow         = 1    " 如果 Tlist 窗口是最后一个窗口则退出 Vim
let Tlist_Use_Left_Window         = 1    " 在左侧窗口中显示
let Tlist_File_Fold_Auto_Close    = 1    " 自动折叠
let Tlist_Auto_Update             = 1    " 自动更新

" <leader>tl 打开 Tlist 窗口，在左侧栏显示
map <leader>tl :TlistToggle<CR>









"let g:ycm_key_list_select_com
let g:ycm_global_ycm_extra_conf ='~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_min_num_of_chars_for_completion               = 2 " 输入第 2 个字符开始补全
let g:ycm_seed_identifiers_with_syntax                  = 1 " 语法关键字补全
let g:ycm_complete_in_comments                          = 1 " 在注释中也可以补全
let g:ycm_complete_in_strings                           = 1 " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_tag_files            = 1 " 使用 ctags 生成的 tags 文件
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_cache_omnifunc                                = 0 " 每次重新生成匹配项，禁止缓存匹配项
let g:ycm_use_ultisnips_completer                       = 0 " 不查询 ultisnips 提供的代码模板补全，如果需要，设置成 1 即可
let g:ycm_show_diagnostics_ui                           = 0 " 禁用语法检查
let g:ycm_key_list_select_completion   = ['<Down>']   " 选择下一条补全，Default: ['<TAB>', '<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']     " 选择上一条补全，Default: ['<S-TAB>', '<Up>']
let g:ycm_key_list_stop_completion     = ['<Enter>']  " 中止此次补全，Default: ['<C-y>']   
