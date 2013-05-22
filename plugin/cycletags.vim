if exists("loaded_cycletags")
    finish
endif
let loaded_cycletags = 1

" Line continuation used here
let s:cpo_save = &cpo
set cpo&vim

let g:cycletags_cw = ''

function! CycleTags(cw)

	" Debugging
	" echo 'searching ' . a:cw . ' old ' . g:cycletags_cw

	try
		if a:cw != g:cycletags_cw
			execute 'tag ' . a:cw
			call search(a:cw,'c',line('.'))
		else
			try
				execute 'tnext'
			catch /.*/
				execute 'trewind'
			endtry
			call search(a:cw,'c',line('.'))
		endif
		let g:cycletags_cw = a:cw
	catch /.*/
		echo "No tags for " . a:cw
	endtry

endfunction

if !exists("g:cycletags_no_mappings") || ! g:cycletags_no_mappings
	map <C-]> :call CycleTags(expand('<cword>'))<CR>
endif

" restore 'cpo'
let &cpo = s:cpo_save
unlet s:cpo_save

