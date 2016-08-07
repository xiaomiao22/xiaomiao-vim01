"
"Author    : miaoguoxiang
"Lastmod   : 2016.7.25
"Summary   : This is in $HOME configure for vim
"


let g:man_os_platform="Linux" 
let g:man_config_level = 3

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'tpope/vim-pathogen'
	Plugin 'vim-scripts/taglist.vim'
	Plugin 'vim-scripts/minibufexpl.vim'
	Plugin 'xiaomiao22/winmanager'
	Plugin 'xiaomiao22/vim-autocomplpop'
	Plugin 'wesleyche/SrcExpl'
	Plugin 'vim-scripts/ack.vim'
	Plugin 'majutsushi/tagbar'
	Plugin 'dyng/ctrlsf.vim'
	Plugin 'scrooloose/syntastic'
	Plugin 'scrooloose/nerdtree'
	Plugin 'tomasr/molokai'
	Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

" Basic configure ui
function Basic_config_ui()
	"set nu
	set laststatus=2
	set ruler
	"set number
	"set cursorline
	"set cursorcolumn
	set gcr=a:block-blinkon0
	syntax enable
	syntax on
	set t_Co=256
	colorscheme molokai
endfunction


" Basic configure tab 
function Basic_config_tab()
	filetype indent on
	set tabstop=4
	set shiftwidth=4
	set softtabstop=4
endfunction

" Basic configure characters codings
function Basic_config_char()
	let &termencoding=&encoding
	set fileencodings=utf-8,gbk,ucs-bom,cp936
endfunction

" Basic configure file type check
function Basic_config_file_type()
	set nocp
	filetype on
	filetype plugin on
endfunction

" Basic configure Special key settings
function Basic_config_key()
	set backspace=indent,eol,start 
endfunction

" Basic configure History record
function Basic_config_history()
	if has("autocmd")
		au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
		\| exe "normal g'\"" | endif
	endif
endfunction

" Basic configure search settings
function Basic_config_search()
	set incsearch
	set hlsearch
	set noignorecase
endfunction

" Basic configure copy and paste
function Basic_config_copy_paste()
	set viminfo='1000,<500
endfunction

" System Linux include path
function Inc_path_linux()
	set path+=/usr/include
	set path+=/usr/local/include
	set path+=./
endfunction

" System Microsoft include path
function Inc_path_microsoft()
	set path+=./
endfunction

" System MacOS include path
function Inc_path_macos()
	set path+=./
endfunction

" Basic Package quickfix
function Basic_package_quickfix()
	nmap <C-x>o :copen<cr>
	nmap <C-x>c :cclose<cr>
	nmap <F6> :cn<cr>
	nmap <F7> :cp<cr>
endfunction

" Basic Package grep
function Basic_package_grep()
	" grep
	"nnoremap <silent> <F3> :Grep<CR>
endfunction

" Basic Package ack
function Package_ack()
	nmap <C-s>f :CtrlSF<CR>
endfunction

" Package manager
function Package_manager_pathogen()
	runtime bundle/pathogen/autoload/pathogen.vim
	execute pathogen#infect()
	execute pathogen#helptags() 
endfunction

" Package MiniBufExplorer
function Package_minibufexplorer()
	nmap <C-x>l :MBEToggle<cr>
endfunction

" Package winmanager
function Package_winmanager()
	let g:winManagerWindowLayout='FileExplorer' 
	" nmap <C-x>f :WMToggle<cr>
endfunction

" Package Taglist
function Package_taglist()
	let Tlist_Show_One_File=1 
	let Tlist_Exit_OnlyWindow=1
	let Tlist_Exit_OnlyWindow=1 
	let Tlist_Auto_Update=1  
	" let Tlist_Use_Right_Window=1  
	" let Tlist_Sort_Type="name"  
	let Tlist_Process_File_Always=1  
	nmap <C-x>t :Tlist<cr>
endfunction

" Package tagbar
function Package_tagbar()
	nmap <C-x>b :TagbarToggle<CR>
endfunction

" Package SrcExpl
function Package_srcexpl()
	nmap <C-x>e :SrcExplToggle<CR>             
endfunction

" Package NERDTree
function Package_nerdtree()
	nmap <C-x>f :NERDTreeMirror<CR>
	nmap <C-x>f :NERDTreeToggle<CR>
endfunction

" Pakage 

" Package autocomplpop and omnicppcomplete
function Package_omni_complete()
	set completeopt=menu,menuone  
	set omnifunc=omni#cpp#complete#Main
	let OmniCpp_MayCompleteDot=1 
	let OmniCpp_MayCompleteArrow=1
	let OmniCpp_MayCompleteScope=1
	let OmniCpp_NamespaceSearch=1
	let OmniCpp_GlobalScopeSearch=1  
	let OmniCpp_DefaultNamespace=["std"]  
	let OmniCpp_ShowPrototypeInAbbr=1
	let OmniCpp_SelectFirstItem = 2
	" ctags -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q
	" --language-force=C++ -f cpp .
	"
endfunction

" Package Syntaxtic
function Package_syntaxtic()
	" configure syntastic syntax checking to check on open as well as save
	let g:Syntastic_check_on_open=1
	let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
	let g:syntastic_always_populate_loc_list = 1
	"let g:syntastic_auto_loc_list = 1
	let g:syntastic_check_on_wq = 0
	"set statusline+=%#warningmsg#
	"set statusline+=%{SyntasticStatuslineFlag()}
	"set statusline+=%*

	let g:syntastic_c_include_dirs = ['/usr/include/']
	let g:syntastic_c_include_dirs += ['/usr/local/include/']
	let g:syntastic_c_include_dirs += ['/usr/include/sys/']
endfunction

" Package CtrlSF
function Package_ctrlsf()
	nmap <C-s>s :CtrlSF<CR>
endfunction

" Package ctags
function Package_ctags()
	set tags=tags;
	set autochdir
endfunction

" Package cscope
function Package_cscope()
	nmap <C-/>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-/>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-/>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-/>d :cs find d <C-R>=expand("<cword>")<CR><CR>

	nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>
endfunction

" Pakage YCM
function Package_ycm()
	" YCM-Completion menu color
	highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
	highlight PmenuSel ctermfg=4 ctermbg=5 guifg=#AFD700 guibg=#106900

	" Completion feature is also effective in the comments
	let g:ycm_complete_in_comments=1

	" .ycm_extra_conf.py Allow vim to load files, no longer prompts
	let g:ycm_confirm_extra_conf=0

	" Open YCM tag completion Engine
	"let g:ycm_collect_identifiers_from_tags_files=1

	" YCM integrated OmniCppComplete completion engine, set its Shortcuts
	inoremap <leader>; <C-x><C-o>

	" Completion content is not to divide the child window form, only the
	" completion list
	set completeopt-=preview

	" Type the characters from the first match to start list
	"let g:ycm_min_num_of_chars_for_completion=1

	" Disable caching match, every match regenerate
	let g:ycm_cache_omnifunc=0

	" Syntax keyword completion
	let g:ycm_seed_identifiers_with_syntax=1

	" Please refer to the detailed: 
	nmap <C-x>] :YcmCompleter GoToDeclaration<CR>
	" Only #include or open file
	nmap <C-x>\ :YcmCompleter GoToDefinition<CR>
endfunction

" Myself manknow
function Myself_manknow()
	let &rtp=&rtp . ',/home/miaoguoxiang/manknow/tools'
	source /home/miaoguoxiang/manknow/manknow.vim
endfunction

"
" Now start  packaging configuration
"

" By default, the configuration of this file is not used

" Basic configure
function Man_basic_config()
	call Basic_config_ui()
	call Basic_config_tab()
	call Basic_config_char()
	call Basic_config_file_type()
	call Basic_config_key()
	call Basic_config_history()
	call Basic_config_search()
	call Basic_config_copy_paste()

	call Basic_package_quickfix()
	call Basic_package_grep()

	call Package_manager_pathogen()
endfunction


" The basic development environment of C language	
function Man_basic_dev_c()
	if (g:man_os_platform == "Linux")
		call Inc_path_linux()
	elseif (g:man_os_platform == "MacOS")
		call Inc_path_macos()
	elseif (g:man_os_platform == "Microsoft") 
		call Inc_path_microsoft()
	endif

	call Package_ack()
	call Package_ctags()
	call Package_minibufexplorer()
	call Package_winmanager()
	call Package_taglist()
	call Package_nerdtree()
	call Package_omni_complete()
	call Package_syntaxtic()
endfunction

" Extended development environment
function Man_exten_dev_c()
	call Package_tagbar()
	call Package_srcexpl()
	call Package_ctrlsf()
	call Package_cscope()
	call Package_ycm()
endfunction

"
" Now start execute configuration
"
while 1==1 
	if (g:man_config_level == 0)
		break
	endif

	call Man_basic_config()
	
	if (g:man_config_level == 1)
		break
	endif

	call Man_basic_dev_c()
	
	if (g:man_config_level == 2)
		break
	endif

	call Man_exten_dev_c()

	if (g:man_config_level == 3)
		break
	endif

	break
endwhile


" Section 7: Other technical information =====================================
" 7.1 Custom shortcut list
" +---------+-------------+--------------------------------+
" |  class  |   option    |            describe            |
" +---------+-------------+--------------------------------+ 
" |         | <C-x>t      | open and close taglist         |
" |         | <C-x>f      | open and close NERDTree        |
" |  C-x    | <C-x>l      | open and close MiniBufExplorer |
" |         | <C-x>b      | open and close Tagbar          |
" |         | <C-x>e      | open and close SrcExplToggle   |
" |         | <C-x>o      | open quickfix window           |
" |         | <C-x>c      | close quickfix window          |
" |         | <C-x>]      | ycm goto the Declaration       |
" |         | <C-x>\      | ycm goto the Definition        |
" +---------+-------------+--------------------------------+
" |         | <C-s>s      | start current dir file search  |
" |         | <C-s>f      | start Special dir file search  |
" +---------+-------------+--------------------------------+
" |  F      | F6          | quickfix cn                    |
" |  F      | F7          | quickfix cp                    |
" |         |             |                                |
" +---------+-------------+--------------------------------+
"
"


" Section 8: Project customization configure =================================
" project 1. mdc6-fafnir -----------------------------------------------------

"if filereadable("/home/miaoguoxiang/fafnir-src/fafnir-src.vim")
"	source /home/miaoguoxiang/fafnir-src/fafnir-src.vim
"endif


" project 2. nginx -----------------------------------------------------------
"if filereadable("/home/miaoguoxiang/project/nginx-1.0.14/nginx.vim")
"	source /home/miaoguoxiang/project/nginx-1.0.14/nginx.vim
"endif

nmap <F2> GoDate: <Esc>:read !date<CR>kJ



