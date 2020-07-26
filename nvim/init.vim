if exists('g:vscode')
    " VSCode extension
else
    " Install vim-plug if not already installed
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    endif


    " Plug-ins
    call plug#begin('~/.config/nvim/plugged')
    " Tools
        Plug 'mhinz/vim-signify'
        Plug 'luochen1990/rainbow'
        Plug 'tpope/vim-surround'
        Plug 'tpope/vim-repeat'
        Plug 'tpope/vim-commentary'
        Plug 'mhinz/vim-startify'
        Plug 'voldikss/vim-floaterm'
        Plug 'unblevable/quick-scope'
        Plug 'vimwiki/vimwiki'
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax' 
        Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
        Plug 'junegunn/fzf.vim'
        Plug 'airblade/vim-rooter'
        Plug 'nginx/nginx', { 'rtp': 'contrib/vim' }
        Plug 'ap/vim-css-color'
        Plug 'easymotion/vim-easymotion'

    " HTML / Javascript / React / JSX
        Plug 'mattn/emmet-vim'
        Plug 'pangloss/vim-javascript'
        Plug 'yuezk/vim-js'
        Plug 'maxmellon/vim-jsx-pretty'
    " Color-schemes
        Plug 'vim-airline/vim-airline'
        Plug 'morhetz/gruvbox'
    call plug#end()

    " General settings
    let mapleader = ","
    set linebreak showbreak=>
    set nowrap
    set whichwrap=<,>,[,],b,s
    set autowrite
    set splitright splitbelow
    set autochdir
    set list listchars=tab:»\ ,trail:·,extends:>,precedes:<
    set confirm
    set pastetoggle=<F2>
    set showmode
    set showmatch
    set smartindent
    set ignorecase smartcase
    set sidescrolloff=4 scrolloff=3
    set tabstop=4 softtabstop=4 shiftwidth=4 shiftround expandtab
    set nobackup nowritebackup noswapfile undofile
    set number relativenumber
    set textwidth=79
    set wildmode=longest:full,full
    set wildignore+=*.pyc,*_build/*,*/coverage/*,*/env/*,*/.git/*,*/.venv/*
    set cursorline cursorcolumn termguicolors
    set iminsert=0 imsearch=0
    set timeoutlen=1000
    set updatetime=100
    colorscheme gruvbox

    " Python 3 support
    " cd ~/.pyenv
    " virtualenv -p python3 nvimenv
    " ./nvimenv/bin/pip install pynvim
    let g:python3_host_prog = '~/.pyenv/nvimenv/bin/python'

    " Filetypes support
    " *.conf, *.ini
    au BufRead,BufFilePre,BufNewFile *.conf setf dosini
    au BufRead,BufFilePre,BufNewFile *.ini setf dosini
    au BufRead,BufFilePre,BufNewFile *.cfg setf dosini
    " Enable pandoc markdown syntax so pandoc can work with vimwiki.
    au FileType vimwiki set syntax=markdown.pandoc

    " Show cursor line only in current window.
    au WinLeave * set nocursorline nocursorcolumn
    au WinEnter * set cursorline cursorcolumn
    " Auto source vim configuration
    au! BufWritePost $MYVIMRC source %

    " Comment in normal and visual modes.
    nmap <D-/> :Commentary<CR>j
    vmap <D-/> :Commentary<CR>gv
    " Prevent entering Ex mode.
    map Q <nop>

    " Rainbow Parenthesis
    let g:rainbow_active = 1

    " Floaterm
    let g:floaterm_width = 0.6
    let g:floaterm_height = 0.6
    let g:floaterm_autoclose = 2
    let g:floaterm_position = 'bottom'
    let g:floaterm_keymap_new = '<Leader>tc'
    let g:floaterm_keymap_prev = '<Leader>tp'
    let g:floaterm_keymap_next = '<Leader>tn'
    let g:floaterm_keymap_toggle = '<Leader>tt'
    let g:floaterm_keymap_kill = '<Leader>tk'
    nmap   <silent>   <A-F12>   :FloatermToggle<CR>
    tmap   <silent>   <A-F12>   <C-\><C-n>:FloatermToggle<CR>

    " Vim wiki
    let g:vimwiki_list = [{'path': '~/vimwiki/docs/', 'syntax': 'markdown', 'ext': '.md'}]

    " Startify
    let g:startify_bookmarks = [
            \ { 'c': '~/.config/nvim/init.vim' },
            \ { 'z': '~/.zshrc' },
            \ { 'k': '~/.config/kitty/kitty.conf' },
            \ { 't': '~/.tmux.conf' },
            \ { 'd': '~/.dotfiles' },
            \ { 's': '~/.config/skhd/skhdrc' },
            \ ]

    let g:startify_lists = [
            \ { 'type': 'sessions',  'header': ['   Sessions']       },
            \ { 'type': 'files',     'header': ['   Files']            },
            \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ ]
    let g:startify_session_autoload = 1
    let g:startify_session_delete_buffers = 1
    let g:startify_change_to_vcs_root = 1
    let g:startify_fortune_use_unicode = 1
    let g:startify_session_persistence = 1
    let g:startify_enable_special = 0
    nmap <Leader>ss :w<CR>:bd<CR>:Startify<CR>
    nmap <Leader>sv :w<CR>:vsplit<CR>:Startify<CR>
    nmap <Leader>sh :w<CR>:split<CR>:Startify<CR>
    nmap <Leader>st :w<CR>:tabnew<CR>:Startify<CR>

    " Vim-rooter
    let g:rooter_change_directory_for_non_project_files = 'current'

    " fzf
    map <leader>ff :Files<CR>
    map <leader>fb :Buffers<CR>
    nmap <leader>fg :Rg<CR>
    nmap <leader>fm :Marks<CR>

    " Vim-jsx-pretty
    let g:vim_jsx_pretty_colorful_config = 1
endif
