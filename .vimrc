"adfa/close Configuration file for vim
set modelines=0		" CVE-2007-2438

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup
" ノーマルモード時だけ ; と : を入れ替える
"nnoremap ; :
"nnoremap : ;

colorscheme molokai
syntax on
 set hidden
 set noswapfile
 set wildmenu
 set showcmd
 set number
 highlight LineNr ctermfg=red

 set list
 set listchars=tab:>-,extends:<,trail:-,eol:$
 set wrap
 set hlsearch
 set ignorecase
 set smartcase
 set backspace=indent,eol,start
 "set noautoindent
 set nostartofline
 set ruler
 set confirm
 set visualbell
 set t_vb=
 set mouse=a
 " コマンドラインの高さを2行に
 set cmdheight=2

 set notimeout ttimeout ttimeoutlen=200
 set shiftwidth=2
 set softtabstop=2
 set expandtab
 "------------------------------------------------------------
 " Mappings {{{1
 " マッピング
 map Y y$
 set laststatus=2       " ステータスラインを2行に
 set statusline=%<%f\ #%n%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%y%=%l,%c%V%8P

 " Charset, Line ending -----------------
 set termencoding=utf-8
 set encoding=utf-8
 set fileencodings=utf-8,cp932,euc-jp,iso-2022-jp
 set ffs=unix,dos,mac     " LF, CRLF, CR
 if exists('&ambiwidth')
  set ambiwidth=double    " UTF-8の□や○でカーソル位置がずれないようにする
endif

let g:hi_insert = 'hi StatusLine gui=None guifg=Black guibg=Yellow cterm=None ctermfg=Black ctermbg=Yellow'

if has('syntax')
  augroup InsertHook
  autocmd!
  autocmd InsertEnter * call s:StatusLine('Enter')
  autocmd InsertLeave * call s:StatusLine('Leave')
  augroup END
endif


let s:slhlcmd = ''
function! s:StatusLine(mode)
    if a:mode == 'Enter'
      silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
      silent exec g:hi_insert
    else
      highlight clear StatusLine
      silent exec s:slhlcmd
    endif
endfunction
                          

function! s:GetHighlight(hi)
    redir => hl
    exec 'highlight '.a:hi
    redir END
    let hl = substitute(hl, '[\r\n]', '', 'g')
    let hl = substitute(hl, 'xxx', '', '')
  return hl
endfunction

""""""""""""""""""""""""""""""
" 全角スペースの表示
""""""""""""""""""""""""""""""
highlight ZenkakuSpace cterm=reverse ctermfg=DarkMagenta gui=reverse guifg=DarkMagenta
match ZenkakuSpace /　/       " 全角スペースの色を変更
""""""""""""""""""""""""""""""

set cursorline       " カーソル行をハイライト
 augroup cch
 autocmd! cch
 autocmd WinLeave * set nocursorline
 autocmd WinEnter,BufRead * set cursorline
 augroup END
:hi clear CursorLine
:hi CursorLine gui=underline
hi CursorLine ctermbg=black guibg=black


" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
    "b:nerdstatus = 1 : NERDTree 表示中
    "b:nerdstatus = 2 : NERDTree 非表示中

    if !exists('g:nerdstatus')
        execute 'NERDTree ./'
        let g:windowWidth = winwidth(winnr())
        let g:nerdtreebuf = bufnr('')
        let g:nerdstatus = 1

    elseif g:nerdstatus == 1
        execute 'wincmd t'
        execute 'vertical resize' 0
        execute 'wincmd p'
        let g:nerdstatus = 2
    elseif g:nerdstatus == 2
        execute 'wincmd t'
        execute 'vertical resize' g:windowWidth
        let g:nerdstatus = 1

    endif
endfunction
noremap <c-e> :<c-u>:call ExecuteNERDTree()<cr>
"</cr></c-u></c-e>

""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
""""""""""""""""""""""""""""""

" IndentGuidesEven
" vim立ち上げたときに、自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup=1
" ガイドをスタートするインデントの量
let g:indent_guides_start_level=2
" 自動カラーを無効にする
let g:indent_guides_auto_colors=0
" 奇数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#262626 ctermbg=DarkMagenta
" 偶数インデントのカラー
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#3c3c3c ctermbg=lightgreen
" ハイライト色の変化の幅
let g:indent_guides_color_change_percent = 30
" ガイドの幅
let g:indent_guides_guide_size = 1


set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'Shougo/neobundle.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/dbext.vim'
Bundle 'nathanaelkane/vim-indent-guides'
" コメントON/OFFを手軽に実行
Bundle 'tomtom/tcomment_vim'
Bundle 'toyamarinyon/vim-swift'
" 行末の半角スペースを可視化
"Bundle 'bronson/vim-trailing-whitespace'
"filetype plugin  on

nnoremap <silent> gp :bprevious<CR>
nnoremap <silent> gn :bnext<CR>
