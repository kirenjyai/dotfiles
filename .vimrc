" vim:set ts=2 et:
"------------------------------------------------------------
" vim固有の環境変数設定
"------------------------------------------------------------
if has("win32") || has("win64")
  set path+=C:/Programs/vim73-kaoriya-win32
  "set shell='C:\MinGW\msys\1.0\bin\bash.exe'
  let $TEMP=$HOME."/tmp"
  let $PATH="C:/MinGW/msys/1.0/bin;C:/MinGW/msys/1.0/mingw/bin;".$PATH
  let $PATH="C:/Python27;".$PATH
  let $PATH="C:/Programs/ctags;".$PATH
  "let $PATH="C:/Programs/vim73-kaoriya-win32;".$PATH
else
  let $TEMP="/tmp"
  " ヘッダインクルードパス設定
  set path+=.,/usr/include
endif

" VIM 7.2用
" au BufNewFile,BufRead *.json  setf javascript
" Markdown
" au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mkdn,README.md  setf markdown

au BufNewFile,BufRead syslog.debug setf messages

"------------------------------------------------------------
" VAM
"------------------------------------------------------------
" call vam#ActivateAddons(['neosnippet'])

"------------------------------------------------------------
" neobundle
"------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!
filetype plugin indent off     " required!

" defaultのプロトコルをhttpsに(gitプロトコルがなぜだか使えないので)
let g:neobundle_default_git_protocol = 'https'

if has('vim_starting')
  if has("win32") || has("win64")
    set runtimepath+=$HOME/vimfiles/bundle/neobundle.vim/
    call neobundle#rc(expand('~/vimfiles/bundle/'))
  else
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    "call neobundle#rc(expand('~/.vim/bundle/'))
    call neobundle#begin(expand('~/.vim/bundle/'))
  endif
endif
" let NeoBundle manage NeoBundle
" required! 
"NeoBundle 'Shougo/neobundle.vim'
" recommended to install
NeoBundle 'Shougo/vimproc'
" after install, turn shell ~/.vim/bundle/vimproc, (n,g)make -f your_machines_makefile
"NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
"NeoBundle 'MarcWeber/vim-addon-manager'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'sudo.vim'
" QFixGrepに変更
"NeoBundle 'grep.vim'
NeoBundle 'rking/ag.vim'
" タグリスト
"NeoBundle 'taglist-plus' なんか重い
NeoBundle 'Tagbar'
"" ソース解析に便利なやつ
"NeoBundle 'Source-Explorer-srcexpl.vim'
"" バッファをタブ表示
"NeoBundle 'buftabs'
" ウィンドウを崩さずバッファ削除する
NeoBundle 'kwbdi.vim'
" 変更行に印を付ける
"NeoBundle 'Changed'
"" SubVersionプラグイン
"NeoBundle 'vcscommand.vim'
" QFixHowm
"NeoBundle 'fuenor/qfixhowm'
NeoBundle 'fuenor/qfixgrep'
" Powerline for vim
" NeoBundle 'Lokaltog/vim-powerline'

" Color Scheme
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'Lokaltog/vim-distinguished'
NeoBundle 'nanotech/jellybeans.vim'

" git
NeoBundle 'tpope/vim-fugitive'

" C言語
NeoBundle 'vim-scripts/ifdef-highlighting'
NeoBundle 'vim-scripts/cpp.vim--Skvirsky'
" python
NeoBundle 'davidhalter/jedi-vim'

call neobundle#end()

filetype plugin indent on     " required!

""------------------------------------------------------------
"" vimshell
""------------------------------------------------------------
"" Initialize execute file list.
"let g:vimshell_execute_file_list = {}
"call vimshell#set_execute_file('txt,vim,c,h,cpp,d,xml,java,js', 'vim')
"let g:vimshell_execute_file_list['rb'] = 'ruby'
"let g:vimshell_execute_file_list['pl'] = 'perl'
"let g:vimshell_execute_file_list['py'] = 'python'
"" call vimshell#set_execute_file('html,xhtml', 'gexe firefox')
"
"" 起動キー
"nnoremap <silent><Space>s :<C-u>VimShellPop<CR>

"------------------------------------------------------------
" vimfiler
"------------------------------------------------------------
" ファイル関連付け
call vimfiler#set_execute_file('vim', 'vim')
call vimfiler#set_execute_file('txt', 'vim')
call vimfiler#set_execute_file('c', 'vim')
call vimfiler#set_execute_file('h', 'vim')
call vimfiler#set_execute_file('py', 'vim')
call vimfiler#set_execute_file('html', 'vim')
call vimfiler#set_execute_file('js', 'vim')
call vimfiler#set_execute_file('cpp', 'vim')
let g:vimfiler_as_default_explorer = 1
" safemode OFF (OFFにしておかないとコピーとかできない)
let g:vimfiler_safe_mode_by_default = 0

" Use trashbox.
" Windows only and require latest vimproc.
if has("win32") || has("win64")
  let g:unite_kind_file_use_trashbox = 1
endif

" 起動キー
nnoremap <silent><Space>f :<C-u>VimFiler<CR>

"------------------------------------------------------------
" neocomplcache設定
"------------------------------------------------------------
let g:acp_enableAtStartup = 0
" neocomplcacheを有効にする
" neocomplcache_enable_at_startupが効かない場合↓
"NeoComplCacheEnable
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字/小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
" camel caseは大文字を区切りとしたワイルドカードのように振る舞うという機能
"let g:neocomplcache_enable_camel_case_completion = 1
" _区切り補完を有効
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスをキャッシュする最小文字長
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" PopUpでリストに表示する候補数
let g:neocomplcache_max_list = 300
let g:neocomplcache_max_keyword_width = 60
"let g:neocomplcache_max_menu_width = 30

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell/command-history',
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

"ctags設定
if !exists('g:neocomplcache_ctags_arguments_list')
    let g:neocomplcache_ctags_arguments_list = {}
endif
" \ 'c' : '-R --language-force=c --c-kinds=+p',
" \ 'c' : '-R --language-force=c --regex-c="/^extern ([^ ]*){2,} \*?([a-zA-Z0-9_\-]*) ?\(/\2/p/"',
let g:neocomplcache_ctags_arguments_list  = {
  \ 'c' : '-R --language-force=c --regex-c="/^extern ([^ ]*){2,} \*?([a-zA-Z0-9_\-]*) ?\(/\2/f/"',
  \ }

"シンタックス補完を無効に
if !exists('g:neocomplcache_plugin_disable')
    let g:neocomplcache_plugin_disable = {}
endif
let g:neocomplcache_plugin_disable = {
  \ 'syntax_complete' : 1,
  \ }

" インクルード補完
if !exists('g:neocomplcache_include_paths')
    let g:neocomplcache_include_paths = {}
endif
let g:neocomplcache_include_paths = {
  \ 'c'   : '.,/usr/include',
  \ 'cpp' : '.,/usr/include,/usr/include/c++/4.4',
  \ }
if !exists('g:neocomplcache_include_patterns')
    let g:neocomplcache_include_patterns = {}
endif
let g:neocomplcache_include_patterns = {
  \ 'c'   : '^\s*#\s*include',
  \ 'cpp' : '^\s*#\s*include',
  \ }

" Enable omni completion.
autocmd FileType c setlocal omnifunc=ccomplete#Complete
autocmd FileType cpp setlocal omnifunc=ccomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
if !isdirectory(expand("~/.vim/bundle/jedi-vim/"))
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
else
  autocmd FileType python setlocal omnifunc=jedi#completions
  autocmd FileType python setlocal completeopt-=preview
endif
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
" let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
" let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
" 前回行われた補完をキャンセル
inoremap <expr><C-g> neocomplcache#undo_completion()
" 補完候補の中から共通する部分を補完
inoremap <expr><C-l> neocomplcache#complete_common_string()
" 候補選択中は<CR>で決定
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"
" <TAB>キー補完
"inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><TAB> pumvisible() ? neocomplcache#complete_common_string() : "\<TAB>"
" PopUpクローズなどオリジナル補完キーを念の為再設定
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
"inoremap <expr><C-x><C-o> &filetype == 'vim' ? "\<C-x><C-v><C-p>" : neocomplcache#manual_omni_complete()
"inoremap <expr><C-x><C-f>  neocomplcache#manual_filename_complete()

"------------------------------------------------------------
" neosnippet
"------------------------------------------------------------
" " ユーザ定義
" let g:neocomplcache_snippets_dir=$HOME.'/.neocon_snippets'
" " プレースホルダ中の移動対策
" nnoremap j gj
" onoremap j gj
" xnoremap j gj
" nnoremap k gk
" onoremap k gk
" xnoremap k gk

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"------------------------------------------------------------
" unite.vim設定
"------------------------------------------------------------
" The prefix key.
nnoremap    [unite]   <Nop>
nmap    \ [unite]

nnoremap <silent> [unite]c  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b  :<C-u>UniteWithBufferDir -buffer-name=files -prompt=%\  buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r  :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> [unite]o  :<C-u>Unite outline<CR>
nnoremap <silent> [unite]f  :<C-u>Unite source<CR>
" buffer
nnoremap <silent> [unite]l  :<C-u>Unite buffer<CR>
" yank履歴
let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <silent> [unite]y  :<C-u>Unite history/yank<CR>
" grep
nnoremap <silent> [unite]g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]r  :<C-u>UniteResume search-buffer<CR>

" Start insert.
"let g:unite_enable_start_insert = 1

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  nmap <buffer> <ESC>      <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)
  "imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)

  " <C-l>: manual neocomplcache completion.
  inoremap <buffer> <C-l>  <C-x><C-u><C-p><Down>
endfunction"}}}

let g:unite_source_file_mru_limit = 200
let g:unite_cursor_line_highlight = 'TabLineSel'
let g:unite_abbr_highlight = 'TabLine'

" For optimize.
let g:unite_source_file_mru_filename_format = ''

" For unite-session.
" Save session automatically.
"let g:unite_source_session_enable_auto_save = 1
" Load session automatically.
"autocmd VimEnter * UniteSessionLoad

" For ack.
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-S --nocolor --nogroup'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('ack-grep')
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '--no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt = ''
endif

""------------------------------------------------------------
"" grep.vim設定
""------------------------------------------------------------
"" プラグインのfindパスに"("とか含まれているとエスケープしないとダメ
"" なのでgrep.vimに手を入れている
"
"" 対象外ディレクトリ
"let g:Grep_Skip_Dirs = 'RCS CVS SCCS .svn'
"" grepオプション
""let g:Grep_Default_Options = '--color=auto'
"if has("win32") || has("win64")
" let g:Grep_Shell_Escape_Char='^'
" let g:Grep_Shell_Quote_Char='"'
"endif
"nnoremap <F6> :Rgrep <C-R><C-W>
"vnoremap <F6> y:Rgrep<CR><C-R>"

"------------------------------------------------------------
" taglist設定
"------------------------------------------------------------
"" Tlist開いた際にフォーカスを移す
"let g:Tlist_GainFocus_On_ToggleOpen = 0
"" 参照しているファイルのみリストを表示
"let g:Tlist_File_Fold_Auto_Close = 1
"" タグリスト表示を1ファイルに
"let g:Tlist_Show_One_File = 1
"" Tlistウィンドウ幅
"let g:Tlist_WinWidth = 'auto'
"nnoremap <silent><F4> :TlistToggle<CR>

"------------------------------------------------------------
" Tagbar設定
"------------------------------------------------------------
let g:tagbar_sort = 0
nnoremap <silent><F4> :TagbarToggle<CR>

""------------------------------------------------------------
"" Source-Explorer-srcexpl.vim設定
""------------------------------------------------------------
"" 機能有効時にタグファイルを自動で更新するか
"let g:SrcExpl_isUpdateTags = 0
"" タグファイル更新するキー
"let g:SrcExpl_updateTagsKey = "<S-F8>"
"" 表示領域の高さ
"let g:SrcExpl_winHeight = 14
"" タグ更新コマンド
"" ※--jcode=ascii|sjis|euc|utf8
""let g:SrcExpl_updateTagsCmd = 'ctags --jcode=sjis --sort=foldcase -R .'
"let g:SrcExpl_updateTagsCmd = 'ctags --sort=foldcase -R .'
"" ONすると検索ハイライトが消されるので
"nnoremap <silent><F8> :SrcExplToggle<CR>:set hlsearch<CR>

""------------------------------------------------------------
"" buftabs設定
""------------------------------------------------------------
"" バッファタブにパスを省略してファイル名のみ表示
"let g:buftabs_only_basename=1
"" バッファタブをステータスライン内に表示する
"let g:buftabs_in_statusline=1
"" 現在のバッファをハイライト
""let g:buftabs_active_highlight_group="Visual"
"
"" バッファの移動
"nmap , [Buftabs]
""nnoremap <silent> [Buftabs]l :ls<CR>
"nnoremap <silent> [Buftabs]n :bnext<CR>
"nnoremap <silent> [Buftabs]p :bprevious<CR>

"------------------------------------------------------------
" kwbd設定
"------------------------------------------------------------
nmap <silent><F11> \bd

"------------------------------------------------------------
" Changed設定(変更行に印を付けるやつ)
"------------------------------------------------------------
"nnoremap <silent><F5> :Changed<CR>

"------------------------------------------------------------
" QFixGrep
"------------------------------------------------------------
" QFixシリーズのKeymap Leader
let g:qfixmemo_mapleader = ','
" grepプログラム
let g:mygrepprg = 'grep'
" QuickFixウィンドウでプレビューを有効にする
let g:QFix_PreviewEnable = 1
" プレビューウィンドウの開き方
let g:QFix_PreviewOpenCmd = 'botright'
" QuickFixウィンドウの開き方
let QFix_CopenCmd = 'botright'
" QuickFixウィンドウのプレビューでfiletype別のハイライトを有効にする
let QFix_PreviewFtypeHighlight = 1

" QuickFixウィンドウの高さ
let g:QFix_Height = 14
" プレビューウィンドウの高さ(previewheightを使用したくない場合のみ指定)
let g:QFix_PreviewHeight = 18
" QuickFixウィンドウでもプレビューや絞り込みを有効化
" let QFixWin_EnableMode = 1

" カーソル位置の単語を拾う／拾わない
let MyGrep_DefaultSearchWord = 1
" GREP対象外にしたいファイル名の正規表現
let MyGrep_ExcludeReg = '[~#]$\|\.dll$\|\.exe$\|\.lnk$\|\.o$\|\.obj$\|\.pdf$\|\.xls$\|\.svn$\|\.git$\|\.cmd$\|\.a$\|\.so$\|\.ko$\|\.pyc$\|tags$'

""------------------------------------------------------------
"" QFixHowm
""------------------------------------------------------------
"let g:howm_dir = '~/howm'
"let g:calendar_holidayfile = '~/howm/Sche-Hd-0000-00-00-000000.txt'
"" ファイルタイプをmarkdownにする(ファイル拡張子はtxtでもOK)
"let g:QFixHowm_FileType = 'markdown'
""let g:QFixHowm_FileType = 'qfix_memo'
"" メモファイルのファイルエンコーディング
"let qfixmemo_fileencoding  = 'utf-8'
"" メモファイルのファイルフォーマット(改行コード)
"let qfixmemo_fileformat    = 'unix'

"------------------------------------------------------------
" im_control.vim
"------------------------------------------------------------
" 「日本語入力固定モード」の動作モード
let IM_CtrlMode = 4
" 「日本語入力固定モード」切替キー
inoremap <silent> <C-j> <C-^><C-r>=IMState('FixMode')<CR>


"------------------------------------------------------------
" vim-powerline
"------------------------------------------------------------
"let g:Powerline_dividers_override = ['>>', '>', '<<', '<']

"------------------------------------------------------------
" solarized
"------------------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_contrast='low'
" Special系(tab等), low=目立たない/normal=普通/high=目立つ
let g:solarized_visibility='low'

"------------------------------------------------------------
" QuickRun
"------------------------------------------------------------
" デフォルトキーマッピングを無効に
let g:quickrun_no_default_key_mappings=1
let g:quickrun_config = {
            \  "_" : {
            \    "outputter/buffer/split" : ":botright 20sp",
            \    "hook/time/enable" : 1
            \  },
            \}

"------------------------------------------------------------
" 各種細かい設定
"------------------------------------------------------------
" vim内部文字コード
set encoding=utf-8
"set encoding=cp932
" ファイルオープン時の文字コード
set fileencodings=ucs-bom,utf-8,euc-jp,iso-2022-jp,sjis,cp932,cp20932
" set fileencodings=ucs-bom,euc-jp,utf-8,iso-2022-jp,sjis,cp932,cp20932
" キーコードやマッピングされたキー列が完了するのを待つ時間
set timeoutlen=3000
" 行末折り返し設定
set nowrap
" 未保存でバッファ切り替えを可能にする
set hidden
" コマンド補完候補の表示
set wildmenu
" カーソル行をハイライト
set cursorline
" マウスを使う
if has("win32") || has("win64")
  set mouse=a
endif
" grepを外部指定
if executable('ag')
  set grepprg=ag\ --nogroup\ -iS
else
  set grepprg=grep\ -nH
endif
" 入力がない場合にスワップファイル書き込み発生するまでの時間[ms]
" ※Tagbarの更新間隔はこれを参照しているので短くしている
set updatetime=500
" 非表示文字の設定
set listchars=tab:>.,trail:-,extends:>,precedes:<,nbsp:%
set list
" ctags tagファイル名設定
set tags=tags;
nnoremap <C-]> g<C-]>
" 履歴数
set history=200
"------------------------------------------------------------
" ステータスライン表示内容
"set statusline=%F%r%h%=%l%c%q%n
set statusline=\[%n]%F%r%m%h%w%=\[%Y]\[%{(&fenc!=''?&fenc:&enc)}/%{&ff}]\[%3l,%3v][%L,%3p%%]
" vim-fugitive
set statusline+=%{fugitive#statusline()}
" 「日本語入力固定モード」がオンの場合、ステータス行にメッセージ表示
set statusline+=%{IMStatus('[IM\ ON\ FixMode]')}
" im_control.vimがない環境でもエラーを出さないためのダミー関数
function! IMStatus(...)
  return ''
endfunction
" ステータスラインの表示
set laststatus=2

" ウィンドウ
"set winheight=14
" この行以上小さくできない
"set winminheight=14

"------------------------------------------------------------
" ファイルオープン時にカレントディレクトリ移動
" au BufEnter *.c,*.cpp,*.h,*.py,*.sh,*.html execute ":lcd " . expand("%:p:h")
" au BufEnter * execute ":lcd " . expand("%:p:h")
" fugitiveの:Gdiff時のエラー対策
au BufEnter * if expand('%:p') !~ '://' | lcd %:p:h | endif

"------------------------------------------------------------
" バックアップ設定
set backup
" ネットワークドライブでの保存が遅いので。何かいい方法ある？
set backupdir=$TEMP
set directory=$TEMP,.

"------------------------------------------------------------
" 検索
" 検索結果が末尾まで行ったら先頭に戻らない
set nowrapscan
" 挿入・検索モード時にIM OFF
set iminsert=0
set imsearch=0
" 検索結果をハイライト表示
set hlsearch
nnoremap <silent><ESC><ESC> :nohlsearch<CR><ESC>
" 検索ヒットしたものを画面中央に
"nnoremap n nzz
"nnoremap N Nzz
nnoremap <C-F> :/<C-R><C-W>
vnoremap <C-F> y:/<C-R>"

"------------------------------------------------------------
" カーソル移動
nnoremap [[ [[zz
nnoremap ]] ]]zz

"------------------------------------------------------------
" 置換
nnoremap <C-e> :%s/<C-R><C-W>//gc<Left><Left><Left>
vnoremap <C-e> y:%s/<C-R>"//gc<Left><Left><Left>

" ノーマルモード改行
" ※QuickFixでジャンプできないのでコメントアウト。良い方法ある？
" noremap <CR> o<ESC>


"------------------------------------------------------------
" KeyMap
" マーク
nnoremap <silent> <F2> :marks<CR>

" QuickFix
nmap f [QuickFix]
nnoremap <silent> <F9> :lopen<CR>
nnoremap <silent> <F10> :lclose<CR>
nnoremap <silent> [QuickFix]p :lolder<CR>
"nnoremap <silent> [QuickFix]lp :lolder<CR>
nnoremap <silent> [QuickFix]n :lnewer<CR>
"nnoremap <silent> [QuickFix]ln :lnewer<CR>
nnoremap <silent> [QuickFix]j :lnext<CR>
nnoremap <silent> [QuickFix]k :lprevious<CR>

if has("win32") || has("win64")
  " ESC押下時にIM OFF(im_control.vimを使うのでコメントアウト)
  "inoremap <silent><ESC> <ESC>:set iminsert=0<CR>
  "inoremap <silent><C-[> <ESC>:set iminsert=0<CR>
  
  " 矩形選択を使う(Windows版でペーストが割り当てられている場合)
  " nmap <C-v> <C-v>
else
  " linuxの場合
  "inoremap <silent><ESC> <ESC>:call ForceImeOff()<CR>:Changed<CR>
  "inoremap <silent><C-[> <ESC>:call ForceImeOff()<CR>:Changed<CR>
  inoremap <silent><ESC> <ESC>:call ForceImeOff()<CR>
  inoremap <silent><C-[> <ESC>:call ForceImeOff()<CR>
  function! ForceImeOff()
    let imeoff = system('xvkbd -text "\[Control]\[Shift]\[space]" > /dev/null 2>&1')
  endfunction
endif

"------------------------------------------------------------
if has("syntax")
  syntax on
  " カラー設定
  set t_Co=256
  set background=dark
  "set background=light
  "colorscheme solarized
  colorscheme lucius
  "colorscheme distinguished
  "colorscheme jellybeans
  "
  "colorscheme zmrok
  "colorscheme molokai
  "colorscheme wombat
  "colorscheme zenburn
  "colorscheme desert256
  "colorscheme oceandeep
  "colorscheme railscasts
  "colorscheme jellybeans
  "colorscheme ChocolateLiquor
  "colorscheme anotherdark
  "colorscheme camo
  "colorscheme mars
  "colorscheme mydesert
  "colorscheme default
  " 全角スペースを表示
  highlight ZenkakuSpace cterm=underline ctermfg=darkgray gui=underline guifg=darkgray
  au VimEnter,WinEnter * match ZenkakuSpace /　/
  " タブ文字
  highlight SpecialKey ctermfg=darkgray guifg=#555555
  " カーソル(IM有効時)
  "highlight Cursor ctermfg=NONE ctermbg=White guifg=NONE guibg=White
  "highlight CursorIM ctermfg=NONE ctermbg=Green guifg=NONE guibg=Green
  highlight CursorIM ctermfg=NONE ctermbg=Red guifg=NONE guibg=Red
  "highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE
  " Changedプラグイン
  highlight ChangedDefaultHl cterm=bold ctermbg=red ctermfg=white gui=bold guibg=red guifg=white
endif
