" =====================vundle======================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()
" alternatively, pass a path where Vundle should install plugins
"let path = '~/some/path/here'
"call vundle#rc(path)

" let Vundle manage Vundle, required
" Plugin 'gmarik/vundle'
" Plugin 'pseewald/vim-anyfold.git'

filetype plugin indent on     " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line






"==============================================================================
"=== general settings
set nobackup                    "auto backup file
set number                      "show line number
set incsearch                   "incremental search
"set nowrapscan                  "wrap scan for search
set nohls
set history=100
set backspace=2                 "allow backspacing over everything in insert mode
set ww=<,>,[,]                  "cursor can run over line
" set t_kb
set hlsearch

" tag file
"if $DEVROOT != ""
"  set tags=$DEVROOT/tags
"endif

noremap <C-]> :cstag <C-R>=expand("<cword>")<CR><CR>

"set swapfile!                     "disable swapfile (side-effect: can not do recovery)
"set directory=/tmp                "dir for swapfile

"==============================================================================
"=== deal with tab
set tabstop=4           "tabsize
set expandtab           "replace \t with suitable spaces for alignment


"=== For plugins
"=== omnicppcomplete ==========================================================
"set nocp "already set

"filetype plugin on
"let OmniCpp_ShowPrototypeInAbbr = 1
"let OmniCpp_MayCompleteScope = 1
"let OmniCpp_SelectFirstItem = 0

"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"==============================================================================
"=== deal with syntax highlighting and coloring
"filetype off
"set filetype=cpp

syntax on
"highlight Comment ctermfg=darkcyan
"highlight Search term=reverse ctermbg=4 ctermfg=7
"highlight Normal ctermbg=black ctermfg=white
hi Pmenu        term=standout     cterm=standout     ctermfg=DarkBlue      ctermbg=Gray
hi PmenuSel     term=bold         cterm=bold         ctermfg=Blue       ctermbg=White
"hi PmenuSbar    term=standout     cterm=bold         ctermfg=White      ctermbg=White
hi PmenuThumb   term=bold         cterm=bold                            ctermbg=Blue



au BufNewFile,BufRead *.src  if exists("cynlib_syntax_for_cpp")|set ft=cynlib|else|set ft=cpp|endif

"back to the previous edit line
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"==============================================================================
"=== deal with indent
"set noautoindent        "not auto indent
set autoindent
set cindent             "use c-style indent
set shiftwidth=4              "set indent shift width


"==============================================================================
"open buffers
"map <F1>    :b1                         <cr>
"map <F2>    :b2                         <cr>
"map <F3>    :b3                         <cr>
"map <F4>    :b4                         <cr>

"map <F5>    :e                          <cr>
"map <F6>    :rewind                     <cr>
"map <F7>    :w! <bar> n                 <cr>
"map <F8>    :w! <bar> e#                <cr>

"map <F9>    :s[Aet hls!<bar>set hls?      <cr>
"map <F10>   :e $t                       <cr>

"use $t1 as scrap-book
"map <F11>   :.w! $t1 <bar> .w >> $t     <cr>
"map <F12>   :read $t1                   <cr>

"highline search token
"map <F9>    :q                         <cr>
"map <F8>    :w                         <cr>
"map <F9>    :e $s                       <cr>
"map <FX>    :e ./Work/make.err.check   <cr>
"map <FX>    :w<bar> ! mygo             <cr>
"map <FX>   :w! <bar> e $t              <cr>

"==============================================================================
"=== spiliter abbreviations
ab sp0 //##############################################################################
ab sp1 //++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
ab sp2 //==============================================================================
ab sp3 //------------------------------------------------------------------------------
ab sp4 //<<<---------------------------------------------------------------------------
ab sp5 //--------------------------------------------------------------------------->>>
ab sp9 //@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

cabbr wq1 wq!


"Spellcheck for Latex
"helptags ~/.vim/doc
"au BufRead,BufNewFile *.tex SPCheck



:color elflord
set laststatus=2
set statusline+=%1*\[%n]                                  "buffernr
set statusline+=%2*\ %<%F\                                "File+path
set statusline+=%3*\ %=\ %{''.(&fenc!=''?&fenc:&enc).''}\ "Encoding
set statusline+=%4*\ %{(&bomb?\",BOM\":\"\")}\            "Encoding2
set statusline+=%5*\ %{&ff}\                              "FileFormat (dos/unix..)
set statusline+=%6*\ row:%l/%L\ col:%03c\ (%03p%%)\             "Rownumber/total (%)
"set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
hi User2 ctermfg=3  ctermbg=0
hi User6 ctermfg=3  ctermbg=4
set laststatus=2



filetype plugin on
filetype indent on

set foldmethod=syntax
" set foldnestmax=2

"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>
"
set splitbelow
set splitright
"" for ctrl+s to save
"noremap <silent> <C-S>          :update<CR>
"vnoremap <silent> <C-S>         <C-C>:update<CR>
"inoremap <silent> <C-S>         <C-O>:update<CR>
"

" # Function to permanently delete views created by 'mkview'
function! MyDeleteView()
    let path = fnamemodify(bufname('%'),':p')
    " vim's odd =~ escaping for /
    let path = substitute(path, '=', '==', 'g')
    if empty($HOME)
    else
        let path = substitute(path, '^'.$HOME, '\~', '')
    endif
    let path = substitute(path, '/', '=+', 'g') . '='
    " view directory
    let path = &viewdir.'/'.path
    call delete(path)
    echo "Deleted: ".path
endfunction

" # Command Delview (and it's abbreviation 'delview')
command Delview call MyDeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'Delview' : 'delview')<CR>

vnoremap < <gv
vnoremap > >gv
set tabpagemax=100
:nnoremap , @a

