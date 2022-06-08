function GuiTabLabel()
	let buflist = tabpagebuflist(v:lnum)

	" add the tab number
	let label = '[' . tabpagenr()

	" count number of open windows in the tab
	let wincount = tabpagewinnr(v:lnum, '$')
	if wincount > 1
		let label .= ':' . wincount
	endif

	let label .= '] '

	" add the file name without path information
	let file   = bufname(buflist[tabpagewinnr(v:lnum) - 1])
	let label .= fnamemodify(file, ':t')

	" modified since the last save?
	for bufnr in buflist
		if getbufvar(bufnr, '&modified')
			let label .= '+'
			break
		endif
	endfor

	return label
endfunction

set guitablabel=%{GuiTabLabel()}

colorscheme desert
highlight Statement gui=none
highlight Type      gui=none
highlight ModeMsg   gui=none

if &colorcolumn != 0
	highlight ColorColumn guibg=black
endif

" gvim-win32 specific settings
if has("win32")
	set lines=30 columns=125
	set guifont=Consolas:h9
	set printfont=Consolas:h9
	source $VIMRUNTIME/mswin.vim
else
	set lines=30 columns=125
	set guifont=Monospace\ 10
	set printfont=Monospace\ 10
endif

" Toggle scroll bar if needed
augroup ScrollbarViz
	autocmd!
	autocmd VimEnter,VimResized *
		\ if line('$') > &lines |
		\   set guioptions+=r   |
		\ else                  |
		\   set guioptions-=r   |
		\ endif                 |
augroup END

:runtime! plugin/tohtml.vim
