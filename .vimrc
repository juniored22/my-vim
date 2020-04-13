"-------------------- The Ho_My_VI vimrc file-------------
"
"   Maintainer:	Edgard Junior <tesserato.csi@gmail.com>
"   Last change:	2017 Nov 05
"
"   Ref:
"   https://woliveiras.com.br/vimparanoobs/chapters/marcas.html
"
"
"                                              _
"             _ __ ___  _   _     __   _(_)_ __ ___
"            | '_ ` _ \| | | |____\ \ / / | '_ ` _ \
"           _| | | | | | |_| |_____\ V /| | | | | | |
"          (_)_| |_| |_|\__, |      \_/ |_|_| |_| |_|
"                                |___/
"
"
"
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

 autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
 autocmd vimenter * NERDTree "open a NERDTree automatically when vim starts up
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif  "close vim if the only window left open is a NERDTree
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif "open NERDTree automatically when vim starts up on opening a directory
 autocmd StdinReadPre * let s:std_in=1
 autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif "open a NERDTree automatically when vim starts up if no files were specified?
 autocmd FileType html,css EmmetInstall "Emmet
 autocmd BufRead *.html  let g:user_emmet_expandabbr_key='<Tab>'
 autocmd BufRead *.html  imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

 let g:user_emmet_mode='n'          " Only enable normal mode functions.
 let g:user_emmet_mode='inv'        " Enable all functions, which is equal to
 let g:user_emmet_mode='a'          " Enable all function in all mode.
 let g:molokai_original = 100
 let g:NERDTreeDirArrowExpandable = '🗀 '
 let g:NERDTreeDirArrowCollapsible = '🗁 '
 let g:user_emmet_install_global = 0 "Emmet
 let g:lightline = {'colorscheme': 'archery'}
 let NERDTreeShowHidden = 1
 let RDTreeIgnore = [
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
"let g:airline_theme = 'delek'
"let g:airline_theme = 'archery'
 
 set listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
 set cursorcolumn
 set cursorline
"set list lcs=trail:·,tab:..
 set list
 set cc=80
 set smartindent                     " Liga a identação inteligente
 set backspace=indent,eol,start      " Allow backspacing over everything in insert mode.
 set history=200		                  " keep 200 lines of command line history
 set ruler		                        " Exibi o cursor na posição que o arquivo foi encerado
 set ttimeout		                    " Tempo limites para códigos-chaves
 set ttimeoutlen=100	                " Espera ate 1000ms após ESC para chaves especiais
 set nrformats-=octal                " Não reconhece números octais
 set ts=2                            "tab 
 set tabstop=4
 set softtabstop=4
 set number
 set showcmd                         " Mostrar números de linha não deve ser justificada.
 set cursorline                      " Descobri que isso facilita o acompanhamento da linha que você deixou de mudar
 set wildmenu                        " Autocompletar visual para menu de comando
 set number                          " exibi numeros na lateral
 set autoindent                      " auto indentacao
 set title                           " exibe titulo arquivo
 set nowrap                          " nao quebra linha quando tem uma string grande
 set scrolloff=5                     " exibi sempre 5 linha não deicha cursor tocar no fim do arquivo
 set wildmode=list:longest,full
 set shiftwidth=4
 set showtabline=2
 set laststatus=2
 set encoding=utf8
 set linebreak                       " Quebra a linha sem quebrar a palavra
 set nobackup                        " Não salva arquivos de backup~
 set wildmode=longest,list           " Completa o comando com TAB igual o bash
 set ignorecase                      " Ignora o case sensitive nas buscas
 set smartcase                       " Se tiver alguma letra maiúscula, ativa o case sensitive
 set gdefault                        " Sempre substitui todas as palavras, não só a primeira
 set smartindent                     " Auto-indenta
 set expandtab                       " Identa com espaços
 set tabstop=2                       " Quantidade de espaços por indentação
 set shiftwidth=2                    " Quantidade de espaços da auto-indentação
 set guioptions-=T                   " Deixa a GUI sem a toolbar
 set autochdir                       " Vai pro diretório do arquivo aberto
 set cursorline                      " Mostra linha atual mais clara
 set hlsearch                        " Termo procurado em destaque
 set pumheight=15                    " Máximo de palavras no popup de autocomplete
 set completeopt=menu,preview        " Como mostrar as possibilidade de inserção
 set spelllang=pt                    " Escolhe o dicionário
 set eb                              " Apita cada vez que você errar um comando.
"set display=truncate               " Show @@@ in the last line if it is truncated.
"set bk                             "ativa backup
"set backupdir=expand('~/.vim/backup/')  "pasta de backuo 
"set spell                          " checking ortografia
"set spell spelllang=pt             " set idioma
"set paste                          " indenta no ato de colar
"set mouse=a		                    " Enable mouse usage (all modes)

syntax on

"colorscheme archery
"colorscheme delek
"colorscheme torte
 colorscheme dracula
 
 filetype indent on                "carregar arquivos de recuo específicos do tipo de arquivo
 filetype plugin indent on

 highlight Normal ctermbg   =Black
 highlight Cursor ctermbg   =Green
 highlight NonText ctermbg  =Black
 highlight Special ctermbg  =DarkMagenta
 highlight Comment ctermbg  =DarkGray
 highlight Constant ctermbg =Blue
 highlight Comment cterm    =underline ctermbg=Blue ctermfg=White
 highlight clear SpellBad
 highlight SpellBad term=reverse cterm=underline
"highlight Comment ctermbg  =Blue ctermfg=White

 inoremap <C-T> <C-O>:tabnew<CR>    " Abas
 inoremap <C-TAB> <C-O>:tabnext<CR>
 inoremap <C-S-TAB> <C-O>:tabprevious<CR>
 inoremap <C-F4> <C-O>:x!<CR>
 inoremap <C-U> <C-G>u<C-U>
 inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
 inoremap <c-z> <c-o>:u<CR>
"inoremap ( ()<esc>i                "fecha automaticamente (), {},[], \"" e '' 
"inoremap { {<Char-13>}<esc>i       "fecha automaticamente (), {},[], \"" e '' 
"inoremap [ []<esc>                 "fecha automaticamente (), {},[], \"" e '' 
"inoremap " ""<esc>i                "fecha automaticamente (), {},[], \"" e '' 
"inoremap ' ''<esc>i                "fecha automaticamente (), {},[], \"" e '' 

 map Q gq
 map <F2> :tabnew<CR>               " Abre um novo arquivo em outra aba
 map <C-S> :w <CR> 
 map <C-C> y
 map <C-X> x
"map <F3> gt                        " Navega arquivo em outra aba
"map <F7> :SpellCheck<CR>
"map <F8> :SpellProposeAlternatives<CR>

 nmap <F3> :vimgrep<space><CR>
 nmap <F4> :NERDTreeToggle<CR>
 nmap  <C-Z> <esc>u
 nmap <C-v> <esc>p i
 nmap <silent> <M-Down> :call ScrollOtherWindow("down")<CR>
 nmap <silent> <M-Up> :call ScrollOtherWindow("up")<CR>

 imap <C-V> <esc>p i
 imap  <C-Z> <esc>u
 imap ><Tab> ><Esc>mt?<\w<Cr>:let @/=""<Cr>lyiw`ta</><Esc>P`tli "Fechamento automático de Tags HTML
"imap ( ()<esc>i                 "fecha automaticamente (), {},[], \"" e '' 

 vmap <C-V> <esc>p i

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

"if has("autocmd")
"  filetype plugin indent on
"  augroup vimStartup
"    au!
"    autocmd BufReadPost *
"      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
"      \ |   exe "normal! g`\""
"      \ | endif
"  augroup END
"endif " has("autocmd")

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

" recarregar o vimrc
" Source the .vimrc or _vimrc file, depending on system
if &term == "win32" || "pcterm" || has("gui_win32")
        map ,v :e $HOME/_vimrc<CR>
        nmap <F12> :!source ~/_vimrc <BAR> echo "Vimrc recarregado!"<CR>
else
        map ,v :e $HOME/.vimrc<CR>
        nmap <F12> :<C-u>source ~/.vimrc <BAR> echo "Vimrc recarregado!"<CR>
endif


autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

 " rola janela alternativa
 fun! ScrollOtherWindow(dir)
        if a:dir == "down"
                let move = "\<C-E>"
        elseif a:dir == "up"
                let move = "\<C-Y>"
        endif
        exec "normal \<C-W>p" . move . "\<C-W>p"
 endfun

fu! ToggleCurline ()
  if &cursorline && &cursorcolumn
    set nocursorline
    set nocursorcolumn
  else
    set cursorline
    set cursorcolumn
  endif
endfunction

map <silent><leader>cl :call ToggleCurline()<CR>
"---------------------- NOTAS VIM--------------------------
"criei um arquivo chamado dicionario onde coloco todas as palavras que
"ultimai-o para codigo entao adicionei esse trexo abaixo para dar o auto
"coplite no vim apertando Ctrl+x e Ctrl+k ai ele completa
"set dictionary=/opt/dicionarioVim/*


"nnoremap <silent> <leader>a :ArgWrap<CR>

"Emmet----------
" html:5   (Contrl+y+,)
":Emmet h1
"https://docs.emmet.io/customization/snippets/
"
"map - Criamos um Mapeamento em modo comando

"imap - Mapeamento em modo de inserção.

"cmap - Mapeamento em modo de linha de comando

"vmap - Mapeamento no modo visual

"nmap - apenas no modo Normal


"Comandos externos
"Digite :! comando para executar um comando externo ao editor.
"
"
"
"Oculta linhas e exibe se preciso
"zf<numero_de_linha>j
"
"ex:
"zf10j
"
"exibir
"zo
"
"Uma maneira mais fácil de criar os folders é entrando no modo visual (v),
"selecionando o bloco e pressionando zf.
"
"zfap - Cria uma dobra para o parágrafo atual

"zf/palavra - Cria uma dobra até a "palavra"

"zo - Abre a dobra onde o cursor estiver

"zR - Abre todas as dobras do arquivo atual

"zc - Fecha a dobra onde o cursor estiver

"zd - Apaga o folder (o conteúdo não é apagado)

"zj - Desce até a próxima dobra

"zk - Sobe até a próxima dobra
"
"
"
"]s vai para a próxima palavra.
"[s vai para a palavra anterior.

"z= mostra a lista de sugestões para a palavra.

"zg adiciona a palavra sob o cursor no dicionário, assim ela não será mais marcada como errada.
" zug desfaz a última palavra adicionada.
"zw remove a palavra sob o cursor do dicionário, assim ela será marcada como errada.
"zuw desfaz ultima palavra removida.

"Tecla            : Tecla mapeada
"<CR>             : Enter
"<ESC>            : Escape
"<LEADER>         : normalmente \
"<BAR>            : | pipe
"<CWORD>          : Palavra sob o cursor
"<CFILE>          : Arquivo sob o cursor
"<CFILE><         : Arquivo sob o cursor sem extensão
"<SFILE>          : Conteúdo do arquivo sob o cursor
"<LEFT>           : Salta um caractere para esquerda
"<UP>             : Equivale clicar em 'seta acima'
"<M-F4>           : A tecla ALT -> M  mais a tecla F4
"<C-f>            : Control f
"<BS>             : Backspace
"<space>          : Espaço
"<TAB>            : Tab
"<C-X>            : onde 'C'  corresponde a CTRL e 'X' a uma tecla qualquer
"<Left>           : seta para a esquerda
"<Right>          : seta para a direita
"<C-M-A>          : CTRL+ALT+A
"
"
"
" \s ................ espaço
" \+ ................ uma ou mais vezes
" $ ................. no final da linha
" \| ................ ou
" " " ............... espaço (veja imagem acima)
" \+ ................ uma ou mais vezes
" \ze ............... até o fim
" \t ................ tabulação

"
"MACRO
"
"define macro @s = :w para salvar 
"let @s=":w"
"Para executar a macro 's' definida acima faça:
"@s



"COMANDOS
"contr+w  2x                     " muda de janela
"contr+w+n                       " abre nova janela na mesma janela do arquivo atual
"contr+n+k                       " lista sugestão
"contr+v                         " escolhe linhas e shift i inseri o texto e ESC para aplicar o texto
"/string <CR> cgn strin ESC ...  " Substituir todos os textos selecionados
"execute "rightbelow vsplit novoAquivo.txt"
":tab nome_do_arquivo            " Abre o arquivo em uma nova aba
":tabnew                         " Abre uma nova aba em branco
"gt                              " Vai para a próxima aba
"gT                              " Volta a aba anterior
"CTRL+Page Down                  " Mesmo que gt
"CTRL+Page Up                    " Mesmo que gT
":tabc                           " Fecha a aba atual
":tab split                      " Copia o conteúdo da aba atual em uma nova aba
":vsp                            " Divide janela verticalmente
":sp                             " Divide horizontalmente
":vsp arquivo_x                  " Arquivos na para divisão
