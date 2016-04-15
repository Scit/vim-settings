	

    " disable vi compatibility
    set nocompatible
     
    " setting up Vundle - the vim plugin bundler
    filetype off
    let iCanHazVundle=1
    let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
    if !filereadable(vundle_readme)
        echo "Installing Vundle.."
        echo ""
        silent !mkdir -p ~/.vim/bundle
        silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
        let iCanHazVundle=0
    endif
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
    Bundle 'gmarik/vundle'
     
    " custom bundles
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'tpope/vim-surround'
    Bundle 'jiangmiao/auto-pairs'
    Bundle 'ReloadScript'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'scrooloose/syntastic'
    Bundle 'mileszs/ack.vim'
    Bundle 'python_match.vim'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'ntpeters/vim-better-whitespace'
    Bundle 'vim-scripts/XML-Folding'
    "Bundle 'davidhalter/jedi-vim'
    Bundle 'othree/yajs.vim'
    Bundle 'mxw/vim-jsx.git'
    Bundle 'pangloss/vim-javascript'
    Bundle 'vim-scripts/FavEx'
    Bundle 'kien/ctrlp.vim'
     
    " theme options
    set t_Co=256
    set background=light
    colorscheme solarized

    " indent guides colors
    "let g:indent_guides_auto_colors = 0
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=#aaaaaa
    "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=#999999
     
    " common options
    set relativenumber
    set incsearch
    set ignorecase
    set guioptions-=T
    set guioptions-=m
    set guioptions-=e
    set guioptions+=LlRrb
    set guioptions-=LlRrb
    set expandtab
    set tabstop=2
    set shiftwidth=2
    "set softtabstop=4
    set cursorline
    set hidden
    set nobackup
    set autoread
    set ruler
    set laststatus=2
    syntax on
     
    if has("gui_running")
        set guifont=DejaVu\ Sans\ Mono\ 11
    endif
     
    set autoindent
    set smartindent
    "set tabstop=4
    "set shiftwidth=4
    set expandtab
    filetype plugin indent on
    filetype indent on
     
    " plugins' options
    let g:fuf_modesDisable = []
    "let g:netrw_altv=&sp
    let g:netrw_preview=1
    let g:netrw_list_hide='.*\.pyc$'
    
    let g:netrw_altv          = 1
    let g:netrw_fastbrowse    = 2
    let g:netrw_keepdir       = 0
    let g:netrw_liststyle     = 0
    let g:netrw_retmap        = 1
    let g:netrw_silent        = 1
    let g:netrw_special_syntax= 1
    let mapleader=','

    let g:jsx_ext_required = 0
     
    let g:syntastic_enable_signs=1

    let g:syntastic_python_checkers=['flake8']
    let g:syntastic_python_flake8_post_args='--max-line-length=120 --max-complexity=10'

    let g:syntastic_javascript_checkers=['eslint']

    let b:javascript_fold=0
    let g:javascript_enable_domhtmlcss=1

    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlPMRU'
    let g:ctrlp_working_path_mode = 0
     
    " Rexplore nmap
    nmap <silent> - :Rexplore<CR>

    " Search by selection text
    vnoremap // y/<C-R>"<CR>

    " Search by Ack
    nmap <c-a> :Ack<CR>  
     
    " russian keys fix
    set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~
     
    command W w !sudo tee % > /dev/null
     
    " backup to ~/.tmp
    set backup
    set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set backupskip=/tmp/*,/private/tmp/*
    set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
    set writebackup
     
    " toggle center align for search results
    nnoremap <silent> <C-s> :call <SID>SearchMode()<CR>
    function s:SearchMode()
      if !exists('s:searchmode') || s:searchmode == 0
        echo 'Search next: scroll hit to middle if not on same page'
        nnoremap <silent> n n:call <SID>MaybeMiddle()<CR>
        nnoremap <silent> N N:call <SID>MaybeMiddle()<CR>
        let s:searchmode = 1
      elseif s:searchmode == 1
        echo 'Search next: scroll hit to middle'
        nnoremap n nzz
        nnoremap N Nzz
        let s:searchmode = 2
      else
        echo 'Search next: normal'
        nunmap n
        nunmap N
        let s:searchmode = 0
      endif
    endfunction
     
    " If cursor is in first or last line of window, scroll to middle line.
    function s:MaybeMiddle()
      if winline() == 1 || winline() == winheight(0)
        normal! zz
      endif
    endfunction

    if bufwinnr(1)
        map <C>+ <C-W>+
        map <C>- <C-W>-
    endif


    au BufRead,BufNewFile *.handlebars,*.hbs set ft=html syntax=handlebars
