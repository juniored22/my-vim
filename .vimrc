"--------------------- The Ho_My_VI vimrc file-------------
"
"   Maintainer:	Bram Moolenaar <tesserato.csi@gmail.com>
"   Last change:	2017 Nov 05
"
"-----------------------------------------------------------

execute pathogen#infect()


au BufNewFile,BufRead *.py set dictionary=/opt/dicionarioVim/python.dict
au BufNewFile,BufRead *.py set dictionary=/opt/dicionarioVim/python.dict
au BufNewFile,BufRead *.php set dictionary=/opt/dicionarioVim/php.dict
au BufNewFile,BufRead *.html set dictionary=/opt/dicionarioVim/html.dict
au BufNewFile,BufRead *.css set dictionary=/opt/dicionarioVim/css.dict
au BufNewFile,BufRead *.java set dictionary=/opt/dicionarioVim/java.dict
au BufNewFile,BufRead *.js set dictionary=/opt/dicionarioVim/node.dict
"au BufNewFile,BufRead *.txt source /opt/snippetVim/sintaxTxt.vim
"au BufEnter *.sh if getline(1) == "" | :call setline(1, "#!/bin/bash") | endif
"au BufEnter *.py if getline(1) == "" | :call setline(1, "#!/bin/env python") | endif
"au BufEnter *.py if getline(1) == "#!/bin/env python" | :call setline(2, "## -*- coding: utf-8 -*-") | endif
"au! BufNewFile,BufRead *.txt let b:spell_language="brasileiro"
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

let g:user_emmet_mode='n'          " Only enable normal mode functions.
let g:user_emmet_mode='inv'        " Enable all functions, which is equal to
let g:user_emmet_mode='a'          " Enable all function in all mode.
let g:molokai_original = 100
let g:airline_theme = 'archery'
let g:user_emmet_install_global = 0 "Emmet

syntax on
colorscheme archery
autocmd FileType html,css EmmetInstall "Emmet
filetype indent on                "carregar arquivos de recuo específicos do tipo de arquivo
filetype plugin indent on



inoremap <C-T> <C-O>:tabnew<CR>    " Abas
inoremap <C-TAB> <C-O>:tabnext<CR>
inoremap <C-S-TAB> <C-O>:tabprevious<CR>
inoremap <C-F4> <C-O>:x!<CR>
inoremap <C-U> <C-G>u<C-U>
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

map Q gq
map <F2> :tabnew<CR>               " Abre um novo arquivo em outra aba
map <F3> gt                        " Navega arquivo em outra aba
"map <F7> :SpellCheck<CR>
"map <F8> :SpellProposeAlternatives<CR>
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


set backspace=indent,eol,start     " Allow backspacing over everything in insert mode.
set history=200		                 " keep 200 lines of command line history
set ruler		                       " Exibi o cursor na posição que o arquivo foi encerado
set showcmd		                     " Exibi comandos incompletos
set ttimeout		                   " Tempo limites para códigos-chaves
set ttimeoutlen=100	               " Espera ate 1000ms após ESC para chaves especiais
"set display=truncate              " Show @@@ in the last line if it is truncated.
set nrformats-=octal               " Não reconhece números octais
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
"set paste                          "  indenta no ato de coloar
set wildmode=list:longest,full
set shiftwidth=4
set showtabline=2
set laststatus=2
set encoding=utf8
"set mouse=a		                     " Enable mouse usage (all modes)
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



" Verificar compatibilidade.
if &compatible
  set nocompatible
endif

" When the +eval feature is missing, the set command above will be skipped.
" Use a trick to reset compatible only when the +eval feature is missing.
silent! while 0
  set nocompatible
silent! endwhile

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

if has('mouse')
  set mouse=a
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  let c_comment_strings=1
endif

if has("autocmd")
  filetype plugin indent on
  augroup vimStartup
    au!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
  augroup END
endif " has("autocmd")

if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langremap')
  set nolangremap
endif

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
      return "\<C-N>"
  else
      return "\<Tab>"
  endif
endfunction



"---------------------- NOTAS VIM--------------------------
"criei um arquivo chamado dicionario onde coloco todas as palavras que
"ultiilizo para codigo entao adicionei esse trexo abaixo para dar o auto
"coplite no vim apertando Ctrl+x e Ctrl+k ai ele completa
"set dictionary=/opt/dicionarioVim/*


"nnoremap <silent> <leader>a :ArgWrap<CR>

"Emmet----------
" html:5   (Contrl+y+,) 
":Emmet h1
"https://docs.emmet.io/customization/snippets/
