" The default vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2017 Jun 13
"
" This is loaded if no vimrc file was found.
" Except when Vim is run with "-u NONE" or "-C".
" Individual settings can be reverted with ":set option&".
" Other commands can be reverted as mentioned below.



" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set wildmenu		" display completion matches in a status line

set ttimeout		" time out for key codes
set ttimeoutlen=100	" wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine.  By enabling it you
" can position the cursor, Visually select and scroll with the mouse.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " Revert with ":filetype off".
  filetype plugin indent on

  " Put these in an autocmd group, so that you can revert them with:
  " ":augroup vimStartup | au! | augroup END"
  augroup vimStartup
    au!

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid, when inside an event handler
    " (happens when dropping a file on gvim) and for a commit message (it's
    " likely a different one than last time).
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif

  augroup END

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If set (default), this may break plugins (but it's backward
  " compatible).
  set nolangremap
endif




execute pathogen#infect()

let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.

syntax on
colorscheme archery


set tabstop=4
set softtabstop=4
set number
set showcmd                        " Mostrar números de linha não deve ser justificada.
set cursorline                     " Descobri que isso facilita o acompanhamento da linha que você deixou de mudar
set wildmenu                       " Autocompletar visual para menu de comando
set number                         " exibi numeros na lateral
set autoindent                     " auto indentacao
set title                          " exibe titulo arquivo
set nowrap                         " nao quebra linha quando tem uma string grande
set scrolloff=5                    " exibi sempre 5 linha não deicha cursor tocar no fim do arquivo
set paste                          "  indenta no ato de coloar
set wildmode=list:longest,full
set shiftwidth=4
set showtabline=2
set laststatus=2
set encoding=utf8
set mouse=a		                     " Enable mouse usage (all modes)
set linebreak                      " Quebra a linha sem quebrar a palavra
set nobackup                       " Não salva arquivos de backup~
set wildmode=longest,list          " Completa o comando com TAB igual o bash
set ignorecase                     " Ignora o case sensitive nas buscas
set smartcase                      " Se tiver alguma letra maiúscula, ativa o case sensitive
set gdefault                       " Sempre substitui todas as palavras, não só a primeira
set smartindent                    " Auto-indenta
set expandtab                      " Identa com espaços
set tabstop=2                      " Quantidade de espaços por indentação
set shiftwidth=2                   " Quantidade de espaços da auto-indentação
set guioptions-=T                  " Deixa a GUI sem a toolbar
set autochdir                      " Vai pro diretório do arquivo aberto
set cursorline                     " Mostra linha atual mais clara
set hlsearch                       " Termo procurado em destaque
set pumheight=15                   " Máximo de palavras no popup de autocomplete
set completeopt=menu,preview       " Como mostrar as possibilidade de inserção
set spelllang=pt                   " Escolhe o dicionário


filetype plugin indent on
"nnoremap <silent> <leader>a :ArgWrap<CR>

"----------------------Dicionario autocomplete--------------------------

au BufNewFile,BufRead *.py set dictionary=/opt/dicionarioVim/python.dict
map <F2> :tabnew<CR>    "abre um novo arquivo em outra aba
map <F3> gt             "navega arquivo em outra aba


filetype indent on                "carregar arquivos de recuo específicos do tipo de arquivo
let g:molokai_original = 100
let g:airline_theme = 'archery'

" Abas
inoremap <C-T> <C-O>:tabnew<CR>
inoremap <C-TAB> <C-O>:tabnext<CR>
inoremap <C-S-TAB> <C-O>:tabprevious<CR>
inoremap <C-F4> <C-O>:x!<CR>

nmap <F4> :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1
let NERDTreeIgnore = [
  \'\.DS_Store$',
  \'\.bundle$',
  \'\.capistrano$',
  \'\.git$',
  \'\.gitkeep$',
  \'\.keep$',
  \'\.localized$',
  \'\.routes$',
  \'\.sass-cache$',
  \'\.swo$',
  \'\.swp$',
  \'tags$'
\]



function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
  else
      return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"criei um arquivo chamado dicionario onde coloco todas as palavras que
"ultiilizo para codigo entao adicionei esse trexo abaixo para dar o auto
"coplite no vim apertando Ctrl+x e Ctrl+k ai ele completa
"set dictionary=/opt/dicionarioVim/*
au BufNewFile,BufRead *.py set dictionary=/opt/dicionarioVim/python.dict
au BufNewFile,BufRead *.php set dictionary=/opt/dicionarioVim/php.dict
au BufNewFile,BufRead *.html set dictionary=/opt/dicionarioVim/html.dict
au BufNewFile,BufRead *.css set dictionary=/opt/dicionarioVim/css.dict
au BufNewFile,BufRead *.java set dictionary=/opt/dicionarioVim/java.dict
au BufNewFile,BufRead *.js set dictionary=/opt/dicionarioVim/node.dict


"au BufNewFile,BufRead *.txt source /opt/snippetVim/sintaxTxt.vim
"add cabeçario em arquivos
"au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/bash") | endif
"au BufEnter *.py if getline(1) == "" | :call setline(1, "#!/bin/env python") | endif
"au BufEnter *.py if getline(1) == "#!/bin/env python" | :call setline(2, "## -*- coding: utf-8 -*-") | endif
" autocomandos para python
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

"linguagem pt correcao
"au! BufNewFile,BufRead *.txt let b:spell_language="brasileiro"
"map <F7> :SpellCheck<CR>
"map <F8> :SpellProposeAlternatives<CR>
