:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set signcolumn=no
:set hlsearch
:set termguicolors
:set nolist wrap linebreak breakat&vim



" :set cmdheight=0
" set cmdheight=0
" let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

call plug#begin(stdpath('data') . '/plugged')
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'junegunn/goyo.vim'

	" Plug 'https://github.com/vim-airline/vim-airline'
	Plug 'https://github.com/bfrg/vim-cuda-syntax'
	Plug 'itchyny/lightline.vim'
	Plug 'https://github.com/preservim/nerdtree'
	Plug 'https://github.com/tpope/vim-commentary'
	Plug 'https://github.com/rafi/awesome-vim-colorschemes'
	Plug 'https://github.com/ryanoasis/vim-devicons'
	Plug 'https://github.com/tc50cal/vim-terminal'
	Plug 'akinsho/toggleterm.nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}	
	" Plug 'navarasu/onedark.nvim'
	" Plug 'kyoz/purify', { 'rtp': 'vim' }
	Plug 'smolck/command-completion.nvim'
	Plug 'mte90/coq_wordpress', {'do': './install.sh'}
	Plug 'davidgranstrom/nvim-markdown-preview'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

	Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
	" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	Plug 'lervag/vimtex'
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	Plug 'norcalli/nvim-colorizer.lua'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'folke/zen-mode.nvim'
	Plug 'ThePrimeagen/vim-be-good'
	" Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

call plug#end()

syntax on
colorscheme purify

lua require('command-completion').setup()
lua require('colorizer').setup()
lua require("telescope").load_extension "file_browser"

" lua << EOF
" require("catppuccin").setup {
"     flavour = "mocha" -- mocha, macchiato, frappe, latte
" }
" EOF
" colorscheme catppuccin
" :hi Normal guibg=NONE ctermbg=NONE

lua vim.api.nvim_set_hl(0, "TelescopeBorder", {ctermbg=220})
lua vim.api.nvim_set_hl(0, "TelescopeNormal", {bg="#0a0f14"})

lua << EOF
  require("zen-mode").setup {
	plugins = {
	  tmux = { enabled = true },
		},
	}
EOF

nnoremap <silent><C-z> :Goyo<CR>

set encoding=utf-8
" set cmdheight=0
" set showtabline=2

" Telescope file browser

nnoremap <C-t> :Telescope file_browser<CR>

" nnoremap <C-n> :NERDTree<CR>
" nnoremap <C-t> :NERDTreeToggle<CR>
" nnoremap <f8> : ToggleTerm<CR>

" set
let g:toggleterm_terminal_mapping = '<C-t>'
" or manually...
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><f8> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><f8> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><f8> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

nmap <silent> <c-left> :wincmd k<CR>
nmap <silent> <c-up> :wincmd j<CR>
nmap <silent> <c-down> :wincmd h<CR>
nmap <silent> <c-right> :wincmd l<CR>

nmap <silent><f9> :make <bar> :!./app<CR>

verbose nmap <silent><S-Tab> :tabn<CR>
verbose nmap <silent><S-n> :tabnew<CR>
verbose nmap <silent><F3> :Telescope live_grep<CR>
verbose nmap <silent><C-p> :Telescope file_browser<CR>

let g:vimtex_quickfix_ignore_filters = [
      \ 'Underfull',
      \ 'Overfull',
      \]


let g:vimtex_view_general_viewer = "zathura"


let g:lightline = {
	\ 'colorscheme': 'Tomorrow_Night_Eighties',
	\}

" :set cmdheight=0

" Automatically build notes into pdfs
autocmd BufWritePost *notes-*.md silent !/home/clockmovie/.config/scripts/buildnote.sh %:p

" Default to static completion for SQL
let g:omni_sql_default_compl_type = 'syntax'

if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
else
    let &t_SI = "\e[5 q"
    let &t_EI = "\e[2 q"
endif

:set spell
:setlocal spell spelllang=ru,en_us

function! s:goyo_enter()
  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
