call plug#begin('.config/nvim/plugged')
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
	"Terminal
		Plug 'voldikss/vim-floaterm'
    "Auto Braket
		Plug 'jiangmiao/auto-pairs'
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
	"set tab=4space
    set tabstop=4
	set softtabstop=4
	set shiftwidth=4
	set expandtab
	"Number line hightlight
	set nomodeline
	set cursorline
	au BufRead *.py
    \ set shiftwidth=4|
	\ set cursorlineopt=number
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
		nnoremap <f2> <Esc>i#include <bits/stdc++.h><CR>#define FOR(i,l,r) for (int i=l;i<=r;i++)<CR>#define FOD(i,r,l) for (int i=r;i>=l;i--)<CR>#define faster ios_base::sync_with_stdio(false); cin.tie(NULL); cout.tie(NULL);<CR>#define vt vector<CR>#define ll long long<CR>#define pb push_back<CR>using namespace std;<CR><CR>int main(){<CR>//freopen(".INP","r",stdin)<CR>freopen(".OUT","w",stdout)<CR><Backspace><Backspace><CR><CR>return 0;<CR><Backspace><CR>}
	"Tab in insert mode 
		:inoremap <S-Tab> <C-Q><Tab>w
