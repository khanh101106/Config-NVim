call plug#begin('~/.config/nvim/plugged')
"Plugin
	"Theme
		Plug 'joshdick/onedark.vim'
	"File brower
		Plug 'preservim/nerdtree'
		Plug 'Xuyuanp/nerdtree-git-plugin'
		Plug 'ryanoasis/vim-devicons'
		Plug 'scrooloose/nerdtree', { 'commit': '8d005db' }
	"Status bar
		Plug 'vim-airline/vim-airline'
		Plug 'vim-airline/vim-airline-themes'
	"Tagbar
		Plug 'preservim/tagbar'	
	"File search
		Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
		Plug 'junegunn/fzf.vim'
	"Ai Complete
		Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"Terminal
		Plug 'voldikss/vim-floaterm'
	"Background Image
		"Plug 'tribela/vim-transparent'
call plug#end()
"More for plugin
	"Theme more
		syntax on
		colorscheme onedark
	"Web brower more
		"More
			" Exit Vim if NERDTree is the only window remaining in the only tab.
				autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

		"Key
			map <silent> <C-b> :NERDTreeToggle<CR>

		"Let
			let g:NERDTreeGitStatusIndicatorMapCustom = {
        		\ 'Modified'  :'✹',
                	\ 'Staged'    :'✚',
                	\ 'Untracked' :'✭',
        	        \ 'Renamed'   :'➜',
	                \ 'Unmerged'  :'═',
                	\ 'Deleted'   :'✖',
         	        \ 'Dirty'     :'✗',
	                \ 'Ignored'   :'☒',
        	        \ 'Clean'     :'✔︎',
                	\ 'Unknown'   :'?',
	                \ }
			
			let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
			let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
	"Tagbar more
		nnoremap <silent> <C-K><C-T> :TagbarToggle<CR>
	"Status bar more
		let g:airline#extensions#tabline#left_sep = ' '
		let g:airline#extensions#tabline#left_alt_sep = '|'
		let g:airline#extensions#tabline#enabled = 1	
	"Coc more
		" May need for vim (not neovim) since coc.nvim calculate byte offset by count
		" utf-8 byte sequence.
		set encoding=utf-8
		" Some servers have issues with backup files, see #649.
		set nobackup
		set nowritebackup

		" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
		" delays and poor user experience.
		set updatetime=300

		" Always show the signcolumn, otherwise it would shift the text each time
		" diagnostics appear/become resolved.
		set signcolumn=yes

		" Use tab for trigger completion with characters ahead and navigate.
		" NOTE: There's always complete item selected by default, you may want to enable
		" no select by `"suggest.noselect": true` in your configuration file.
		" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
		" other plugin before putting this into your config.
		inoremap <silent><expr> <TAB>
        \ coc#pum#visible() ? coc#pum#next(1) :
        \ CheckBackspace() ? "\<Tab>" :
        \ coc#refresh()
		inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

		" Make <CR> to accept selected completion item or notify coc.nvim to format
		" <C-g>u breaks current undo, please make your own choice.
		inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

		function! CheckBackspace() abort
		  let col = col('.') - 1
		  return !col || getline('.')[col - 1]  =~# '\s'
		endfunction

		" Use <c-space> to trigger completion.
		if has('nvim')
	    	inoremap <silent><expr> <c-space> coc#refresh()
		else
		    inoremap <silent><expr> <c-@> coc#refresh()
		endif
	"Terminal more
		"Config Terminal	
			let g:floaterm_position="topright"
			let g:floaterm_height=1.0
			let g:floaterm_width=0.6
		
		"Map
			"New Terminal
				nnoremap   <silent>   <A-3>    :FloatermNew<CR>
				tnoremap   <silent>   <A-3>    <C-\><C-n>:FloatermNew<CR>	
			"Open/Close terminal
				nnoremap   <silent>   <A-4>   :FloatermToggle<CR>
				tnoremap   <silent>   <A-4>   <C-\><C-n>:FloatermToggle<CR>

"Set
	set number
	set encoding=UTF-8	
	set mouse=a
	"Set tab=4space
	set tabstop=4
	set softtabstop=0 noexpandtab
	set shiftwidth=4
	"Number line hightlight
	set cursorlineopt=number
	set cursorline
"Map" 	
	"Save file
		imap <C-s> <Esc>:w<CR>	
	"New file
		nmap <C-n> <Esc>:tabnew<CR>
	"Tab
		"Close tab
			map <silent> <C-w> <Esc>:bw<CR>
		"First tab
			nnoremap <silent><A-1> <Cmd>:bf<CR>
		"Last tab
			nnoremap <silent><A-2> <Cmd>:bl<CR>
		"Next tab
			nnoremap <silent><A-q> <Cmd>:bn<CR>
	"Close nvim
		map  <S-W> <Esc>:q!<CR>
	"Ctrl z in insert mode
		:inoremap <C-z> <Cmd>u<cr>
	"Auto run code
		autocmd filetype python nnoremap <F4> :w <bar> exec '!python3 '.shellescape('%')<CR>
		autocmd filetype cpp nnoremap <F4> :w <bar> exec '!g++ '.shellescape('%').' -o '.shellescape('%:r').' && ./'.shellescape('%:r')<CR>
	"C++ fast init
		nnoremap <f2> <Esc>i#include <bits/stdc++.h><CR>#include <cstdio><CR>using namespace std;<CR><CR>int main(){<CR>//freopen(".cpp","r",stdin)<CR>freopen(".cpp","w",stdout)<CR><Backspace><Backspace><CR>return 0;<CR><Backspace><CR>}
	"Tab in insert mode 
		:inoremap <S-Tab> <C-Q><Tab>
