set nocompatible
set autoindent                         " Auto indent

if &term == "xterm"
	set background=dark                " Background if xterm
elseif !has("win32")
	set background=dark
endif

set backspace=indent,eol,start        " Backspace over everything
set backup                            " Keep backup file
if version >= 600
	set foldenable                    " Enable folding (zo:open; zc:close)
	set foldmethod=marker             " Marker folding is to be used
endif
set history=50                        " Limit history to 50 lines
set incsearch                         " Incremental searching
set linebreak                         " When wrapping is on, wrap at a break character
set listchars=precedes:<,extends:>,space:·,tab:>- " Indicate wrapping with < and > along with characters to show for list mode
set matchpairs=(:),{:},[:],<:>        " Match pairs for when % is pressed
set noexpandtab                       " Use tabs, not spaces
set nosmarttab                        " Use tabs, not spaces
set noloadplugins                     " Don't load plugins
set nowrap                            " Don't wrap lines
set ruler                             " Show ruler
set showcmd                           " Show partial command in status
set showmode                          " Show the mode: insert/replace/etc
set softtabstop=0                     " Disable this
set shiftwidth=4                      " Shift width to 4
set splitbelow                        " When splitting, bring it to the bottom
set tabstop=4                         " Tab spaces to 4

vnoremap <BS> d                       " Delete a selection with backspace

" Detect file type for syntax highlighting
if has("autocmd")
	augroup filetype
		autocmd!
		autocmd BufRead,BufNewFile *.proto setfiletype proto
		autocmd BufRead,BufNewFile *.md    setfiletype markdown
	augroup END

	filetype plugin indent on

	" Restore previous cursor position
	augroup VimrcEx
		autocmd!
		autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal g`\""                            |
			\ endif
	augroup END
endif

" Use syntax highlighting and switch on last search pattern if terminal has colors
if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

" win32 specific settings
if has("win32")
	set directory=.,$TEMP
endif
