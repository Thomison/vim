"--------------------------------------------------------------
"一些基本的设置
"--------------------------------------------------------------
"删除光标指向的单词

"显示行号
set number

"显示高亮
syntax on

"底部显示：命令模式or插入模式
set showmode

"命令模式下，在底部显示当前键入的命令。
set showcmd

"支持鼠标
set mouse=a

"使用utf-8编码
set encoding=utf-8

"启用256色
set t_Co=256

"开启文件类型检查，载入对应的缩进规则：~/.vim/indent/..
"Filetype indent on

"回车键，自动缩进与上一行缩进保持一致
set autoindent

"tab键的缩进空格数
set tabstop=4

"在文本上按下>>增加一级缩进，<<取消一级缩进，==取消全部缩进
set shiftwidth=4

"自动将tab转化为两个空格
set expandtab
set softtabstop=2

"显示光标所在行的当前行号，其他行都为其相对行号
set relativenumber

"光标所在的当前行高亮
set cursorline

"设置行宽
set textwidth=80

"自动折行，将较长的行分成几行显示
set wrap

"只有遇到指定符号才折行，不会在单词内部折行
set linebreak

"指定折行处与编辑窗口有边缘空出的字符数
set wrapmargin=2

"垂直滚动时，光标距离底部/顶部的位置
set scrolloff=5

"是否显示状态栏
set laststatus=2

"在状态栏显示光标的位置
set ruler

"光标遇到括号时，自动高亮对应的另一个括号
set showmatch

"搜索时高亮显示搜索结果
set hlsearch

"输入搜索模式时，每输入一个字符，就自动跳到第一个匹配的结果
set incsearch

"搜索时忽略大小写
set ignorecase

"打开英文单词的拼写检查
set spell spelllang=en_us

"不创建备份文件 文件末尾~
"set nobackup

"不创建交换文件，用于系统崩溃时回复文件，文件名开头是. 结尾是.swp
"set noswapfile

"保留撤销历史，用于下次打开文件一样能执行撤销操作，撤销文件是隐藏文件，文件名以.un~开头
set undofile

"设置备份文件、交换文件、操作历史文件的保存位置
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//
set undodir=~/.vim/.undo//

"将工作目录自动切换到正在编辑文件的目录
set autochdir

"出错时禁止发出响声
set noerrorbells

"出错时，发出视觉提示，屏幕闪烁
set visualbell

"vim需要记住多少次历史操作
set history=1000

"打开文件监视，若文件编辑过程中发生外部改变，则发出提示
set autoread

"如果行尾有多余空格（包括tab），则让这些空格可视化
"set listchars=tab:»■,trail:■
"set list

"命令模式下，地步操作指令按下tab自动补全，第一次tab显示清单，第二次tab依次选择
set wildmenu
set wildmode=longest:list,full


"按键映射

"退出、保存
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

"全选
map <leader>sa ggVG

"窗口切换
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

"分割窗口
"map <C-s> <C-W>s
map <C-v> <C-W>v

"调整窗口的大小
nmap w= :resize +3<CR>
nmap w- :resize -3<CR>
nmap w, :vertical resize -3<CR>
nmap w. :vertical resize +3<CR>

"取消撤销操作
map U <C-r>

"进入命令模式/返回普通模式
nnoremap ; :
inoremap jj <Esc>

"保存没权限修改的文件
cmap w!! w !sudo tee > /dev/null

"行首、行尾光标移动按键映射
nnoremap H ^
nnoremap L $

"-------------------------------------------------------------
" 定义函数 SetTitle 自动插入文件头部
"-----------------------------------------------------------
"新建.c,.h,.sh,.java文件，自动插入文件头
"
" 打开文件检测
filetype on
filetype plugin on
filetype indent on 

nnoremap ST :call SetTitle()<CR>

autocmd BufNewFile *.c exec ":call SetTitle()"

""定义函数SetTitle，自动插入文件头

func SetTitle()

    "如果文件类型为.sh文件

    if &filetype == 'c'

        call setline(1, "/*************************************************************************")

        call append(line("."), "    > File Name: ".expand("%"))

        call append(line(".")+1, "    > Author: tangyiheng")

        call append(line(".")+2, "    > Mail: 1021953309tyh@gmail.com ")

        call append(line(".")+3, "    > Created Time: ".strftime("%c"))

        call append(line(".")+4, " ************************************************************************/")

        call append(line(".")+5, "")
   
        call append(line(".")+6, "#include <stdio.h>")
        
        call append(line(".")+7, "#include <stdlib.h>")

        call append(line(".")+8, "#include <string.h>")

        call append(line(".")+9, "#include <unistd.h>")

        call append(line(".")+10, "#include <pthread.h>")

        call append(line(".")+11, "")

        call append(line(".")+12, "int main(int argc, char *argv[]) {")

        call append(line(".")+13, "")
        
        call append(line(".")+14, "    return 0;")

        call append(line(".")+15, "}")

    endif

    "新建文件后，自动定位到文件末尾

    autocmd BufNewFile * normal G

endfunc


    "启动vim则打开侧边文件目录
"autocmd VimEnter * NERDTree
"
"
"---------------------------------------------------------------
"安装的插件
"---------------------------------------------------------------
call plug#begin('~/.vim/plugged')

"vim启动界面
Plug 'mhinz/vim-startify'

"显示树形目录
Plug 'preservim/nerdtree'

"模糊查找文件
Plug 'ctrlpvim/ctrlp.vim'

"自动生成tags，实现函数跳转
Plug 'ludovicchabant/vim-gutentags'

"状态栏美化
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"语法高亮
Plug 'NLKNguyen/papercolor-theme'

"显示命令模式下缓冲区列表
Plug 'bling/vim-bufferline'

"类结构概述
Plug 'majutsushi/tagbar'

"代码注释
Plug 'preservim/nerdcommenter'

"语法检查
Plug 'w0rp/ale'

"自动补全"
"Plug 'Valloric/YouCompleteMe'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"书签
Plug 'kshenoy/vim-signature'

"匹配括号
Plug 'jiangmiao/auto-pairs'

"编译运行代码
Plug 'skywind3000/asyncrun.vim'

" markdown 语法高亮
Plug 'godlygeek/tabular' "依赖
Plug 'plasticboy/vim-markdown'

" markdown 自动生成目录
Plug 'mzlogin/vim-markdown-toc'

" markdown 预览（浏览器）
Plug 'iamcco/mathjax-support-for-mkdp' "公式
Plug 'iamcco/markdown-preview.vim'

" 片段拓展
"Plug 'SirVer/ultisnips',{'for':'markdown'}

" 粘贴图片到 markdown 文件中
Plug 'ferrine/md-img-paste.vim'

call plug#end()

"---------------------------------------------------------------------------
"配色
"---------------------------------------------------------------------------
colorscheme gruvbox
set background=dark "黑暗模式

"----------------------------------------------------------------------------
"tagbar的设置
"----------------------------------------------------------------------------
nmap <F12> :TagbarToggle<CR>


"-----------------------------------------------------------------------------
" plugin - ale.vim
"-----------------------------------------------------------------------------
"keep the sign gutter open
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'

" show errors or warnings in my statusline
let g:airline#extensions#ale#enabled = 1

"echo message
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
let g:ale_lint_on_text_changed = 'normal'

let g:ale_linters = {
\   'c++': ['gcc'],
\   'c': ['gcc'],
\   'python': ['pylint'],
\}
let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

" use quickfix list instead of the loclist
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1

let g:ale_java_javac_options = '-encoding UTF-8  -J-Duser.language=en'

"前往上一下，下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"触发、关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"
"

"----------------------------------------
"asyncrun.vim
"---------------------------------------
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

" F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" F9 编译单个文件
nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 

" F5 运行单个文件
nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR)

" F7 编译整个项目
let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

" F8 运行整个项目
nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" F6 执行测试
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

" F4 使用cMake 生成Makefile文件
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

"------------------------------------------
"vim-markdown
"-----------------------------------------
"查看所有配置建议
":help vim-markdwon
"[[ "跳转上一个标题
"]] "跳转下一个标题
"]c "跳转到当前标题
"]u "跳转到副标题
"zr "打开下一级折叠
"zR "打开所有折叠
"zm "折叠当前段落
"zM "折叠所有段落
":Toc "显示目录

let g:vim_markdown_math = 1

"------------------------------------------
"vim-markdown-toc
"-----------------------------------------

"在当前光标后生成目录
":GenTocMarked
"更新目录
":UpdateToc
"取消储存时自动更新目录
let g:vmt_auto_update_on_save = 0

"-----------------------------------------
"markdown-preview
"-----------------------------------------

" 打开/关闭预览
":MarkdownPreviewToggel
" 指定浏览器路径
let g:mkdp_path_to_chrome = "/usr/bin/google-chrome"
" 指定预览主题，默认Github
"let g:mkdp_markdown_css=''

"-------------------------------------------
" ultisnippets
"------------------------------------------

"设置tab键为触发键
"let g:UltiSnipsExpandTrigger = '<tab>'
"设置向后跳转键
"let g:UltiSnipsJumpForwardTrigger = '<tab>' 
"设置向前跳转键
"let g:UltiSnipsJumpBackwardTrigger = '<S-tab>' 
"设置文件目录
"let g:UltiSnipsSnippetDirectories=["path/of/snippetDirectories"]
"设置打开配置文件时为垂直打开
"let g:UltiSnipsEditSplit="vertical"

"------------------------------------------
" md-img-paste.vim
"------------------------------------------
"
autocmd Filetype markdown nmap <silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
"there are some defaults for image directory and image name, you can change them
let g:mdip_imgdir = 'img'
let g:mdip_imgname = 'image'

"-----------------------------------------
" nerdtree
"----------------------------------------
"
map <F2> :NERDTreeToggle<CR>
map <S-F2> :NERDTreeFind<CR>


"----------------------------------------
" tagbur
"---------------------------------------
"
map <F3> :Tagbar<CR>

"---------------------------------------
" coc.nvim
"----------------------------------------
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
"verbose imap <tab>
"other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
"if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
 " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
"else
 " imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
"-----------------------------------------------------------------
