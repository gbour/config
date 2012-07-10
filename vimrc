
set nocompatible

set bs=2
set columns=80
set background=dark
set wrapmargin=8
set ruler

set number
syntax on
filetype  indent plugin on
set showmatch

set tabstop=4
set shiftwidth=4
set softtabstop=4

set wildmenu    "affiche le menu
set wildmode=list:longest,list:full    "affiche toutes les possibilités
set wildignore=*.o,*.r,*.so,*.sl,*.tar,*.tgz    "ignorer certains types de fichiers pour la complétion des includes

"set foldmethod=syntax     "Réduira automatiquement les fonctions et blocs (#region en C# par exemple)
"set foldtext=MyFoldFunction()    "on utilise notre fonction (optionnel)


" Toujours laisser des lignes visibles (içi 3) au dessus/en dessous du curseur quand on
" atteint le début ou la fin de l'écran :
set scrolloff=3

" Afficher en permanence la barre d'état (en plus de la barre de commande) :
set laststatus=2

" Format de la barre d'état (tronquée au début, fichier, flags,  :
set statusline=%<%f%m\ %r\ %h\ %w%=%l,%c\ %p%%

" Permettre l'utilisation de la touche backspace dans tous les cas :
set backspace=2

" Tenter de rester toujours sur la même colonne lors de changements de lignes :
set nostartofline

" shebang automatique lors de l'ouverture nouveau
" d'un fichier *.py, *.sh (bash), modifier l'entête selon les besoins :
:autocmd BufNewFile *.sh,*.bash 0put =\"#!/bin/bash\<nl># -*- coding: UTF8 -*-\<nl>\<nl>\"|$
:autocmd BufNewFile *.py 0put=\"#!/usr/bin/env python\"|1put=\"# -*- coding: utf8 -*-\<nl>\<nl>\"|$

" GBO(2011/09/26) - replace heading spaces by tabs at read
"                   reverse at save
":autocmd BufReadPre *.py !~/.local/space2tab <afile>
":autocmd BufWritePost *.py !~/.local/tab2space <afile>


" sauvegarder les fichier ~ dans ~/.vim/backup avec crréation du répertoire si celui-ci n'existe pas
if filewritable(expand("~/.vim/backup")) == 2
  set backupdir=$HOME/.vim/backup
else
  if has("unix") || has("win32unix")
    call system("mkdir $HOME/.vim/backup -p")
    set backupdir=$HOME/.vim/backup
  endif
endif

" by acieroid
" -----------
" Pour highlighter la ligne courante (pour mieux se repérer) en bleu :
set cursorline
"highlight CursorLine ctermbg=darkgray

" match les parentheses
 set   showmatch

" completion
set  wildmenu    "affiche le menu
set  wildmode =list:longest,list:full    "affiche toutes les possibilités
set  wildignore =*.o,*.r,*.so,*.sl,*.tar,*.tgz    "ignorer certains types de fichiers pour la complétion des includes

" corrections orthographiques
"set spelllang=en,fr
"set spell
"set spellsuggest=4

" completion
imap   <C-Space> <C-X><C-O>

"colorscheme murphy
colorscheme torte

" minbuf explorer
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"
"
set noexpandtab
autocmd FileType python set expandtab
