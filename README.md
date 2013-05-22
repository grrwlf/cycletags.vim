Cycletags
---------

Cycletags is a small Vim plugin allowing user to cycle through the tags of an
identifier by repeatedly pressing Ctrl-]

Install
-------

Consider using pathogen

https://github.com/tpope/vim-pathogen

Usage
-----

The plugin turns Ctrl+] into tag-cycling command by (relatively) wisely calling
tnext/trewind.  In order to map other key (say, Ctrl+t), place following lines in
your .vimrc:

	let g:cycletags_no_mappings = 1
	map <C-t> :call CycleTags(expand('<cword>'))<CR>


