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
        Plug 'vim-pandoc/vim-pandoc'
        Plug 'vim-pandoc/vim-pandoc-syntax' 
        Plug 'airblade/vim-rooter'
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'nginx/nginx', { 'rtp': 'contrib/vim' }
        Plug 'ap/vim-css-color'
        Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    " HTML / Javascript / React / JSX
        Plug 'mattn/emmet-vim'
        Plug 'pangloss/vim-javascript'
        Plug 'yuezk/vim-js'
        Plug 'maxmellon/vim-jsx-pretty'
    " Color-schemes
        Plug 'vim-airline/vim-airline'
        Plug 'morhetz/gruvbox'
        Plug 'ericbn/vim-solarized'
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
    set cmdheight=2
    colorscheme solarized
    set background=light

    " Use jj as escape
    inoremap jj <Esc>

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

    " Vim-jsx-pretty
    let g:vim_jsx_pretty_colorful_config = 1

    " Vim-go
    let g:go_highlight_extra_types = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_parameters = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_variable_declarations = 1
    let g:go_highlight_variable_assignments = 1

    " Vim-coc

    " Use tab for trigger completion with characters ahead and navigate.
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config.
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
    if has('nvim')
        inoremap <silent><expr> <c-space> coc#refresh()
    else
        inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
    " position. Coc only does snippet and additional edit on confirm.
    " <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
    if exists('*complete_info')
        inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
    else
        inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
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

    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying codeAction to the current buffer.
    nmap <leader>ac  <Plug>(coc-codeaction)
    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Use CTRL-S for selections ranges.
    " Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

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

    " Mappings for CoCList
    " Show all diagnostics.
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions.
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands.
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document.
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols.
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list.
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
endif
