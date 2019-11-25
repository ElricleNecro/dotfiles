" ================ PLUGIN SETUP ======================== {{{
call plug#begin('~/.nvim/plugged') 
    " Github plugins
    Plug 'Shougo/deoplete.nvim',            { 'do': ':UpdateRemotePlugins'} 
    Plug 'Shougo/defx.nvim',                { 'do': ':UpdateRemotePlugins'} 
    Plug 'fatih/vim-go',                    { 'do': ':GoInstallBinaries' }
    Plug 'Shougo/deoplete-lsp'
    Plug 'natebosch/vim-lsc',
    Plug 'hrsh7th/deoplete-vim-lsc'
    Plug 'Shougo/neco-vim',
    Plug 'kristijanhusak/defx-git'
    Plug 'kristijanhusak/defx-icons'
    Plug 'junegunn/fzf.vim' 
    Plug 'pbogut/fzf-mru.vim'
    Plug 'tpope/vim-fugitive' 
    Plug 'jreybert/vimagit'
    Plug 'andymass/vim-matchup' 
    Plug 'machakann/vim-sandwich'
    Plug 'tpope/vim-repeat'
    Plug 'airblade/vim-gitgutter'
    Plug 'tomtom/tcomment_vim'
    Plug 'osyo-manga/vim-anzu'
    Plug 'haya14busa/vim-asterisk'
    Plug 'haya14busa/is.vim'
    Plug 'Yggdroot/indentLine'
    Plug 'matze/vim-move'
    Plug 'itchyny/lightline.vim'
    Plug 'chaoren/vim-wordmotion'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'alvan/vim-closetag'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tommcdo/vim-lion'
    Plug 'tmsvg/pear-tree'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'AndrewRadev/linediff.vim'
    Plug 'airblade/vim-rooter'
    Plug 'rhysd/accelerated-jk'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'sheerun/vim-polyglot'
    Plug 'liuchengxu/vista.vim'
    
    " Local plugins
    Plug '/usr/local/opt/fzf'
    if isdirectory(fnameescape(expand('~/Fortify/SSR/repos/vim-fortify')))
        Plug fnameescape(expand('~/Fortify/SSR/repos/vim-fortify'))
    elseif isdirectory(fnameescape(expand('~/Dev/vim-fortify')))
        Plug fnameescape(expand('~/Dev/vim-fortify'))
    endif
    if isdirectory(fnameescape(expand('~/Development')))
        Plug fnameescape(expand('~/Development/GitRepos/cobalt2.vim'))
    elseif isdirectory(fnameescape(expand('~/Dev')))
        Plug fnameescape(expand('~/Dev/cobalt2.vim'))
    endif
call plug#end()

" VIM-FORTIFY
execute 'source' fnameescape(expand('~/.config/nvim/fortify.vim'))

" FZF
execute 'source' fnameescape(expand('~/.config/nvim/fzf.vim'))

" LIGHTLINE 
execute 'source' fnameescape(expand('~/.config/nvim/lightline.vim'))

" DEFX
execute 'source' fnameescape(expand('~/.config/nvim/defx.vim'))

" VIM-LSC
execute 'source' fnameescape(expand('~/.config/nvim/lsc.vim'))

" INDENTLINE
let g:indentLine_color_gui = '#17252c'
let g:indentLine_fileTypeExclude = g:special_buffers 
let g:indentLine_faster     = 1
let g:indentLine_setConceal = 0

" VIM-MOVE
" run `cat -v` in terminal and then the <Opt> combos to find out the char to use
let g:move_map_keys = 0
vmap ∆ <Plug>MoveBlockDown
nmap ∆ <Plug>MoveLineDown
vmap ˚ <Plug>MoveBlockUp
nmap ˚ <Plug>MoveLineUp
vmap ˙ <Plug>MoveBlockLeft
nmap ˙ <Plug>MoveBlockLeft
vmap ¬ <Plug>MoveBlockRight
nmap ¬ <Plug>MoveBlockRight

" VIM-WORDMOTION
let g:wordmotion_prefix = '<Leader>'

" VIM-CLOSETAG
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.jsp'
let g:closetag_filetypes = 'html,xhtml,phtml,fortifyrulepack,xml,jsp'
let g:closetag_xhtml_filenames = '*.xml,*.xhtml,*.jsp,*.html'
let g:closetag_xhtml_filetypes = 'xhtml,jsx,fortifyrulepack'

" ULTISNIPS
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" VIM-MARKDOWN
let g:vim_markdown_folding_disabled = 1

" MATCHUP
let g:matchup_matchparen_status_offscreen = 0                            " Do not show offscreen closing match in statusline
let g:matchup_matchparen_nomode = "ivV\<c-v>"                            " Enable matchup only in normal mode
let g:matchup_matchparen_deferred = 1                                    " Defer matchup highlights to allow better cursor movement performance

" ANZU / IS.VIM / ASTERISK
let g:anzu_enable_CursorMoved_AnzuUpdateSearchStatus=1
map n <Plug>(is-nohl)<Plug>(anzu-n-with-echo)
map N <Plug>(is-nohl)<Plug>(anzu-N-with-echo)
map * <Plug>(asterisk-z*)<Plug>(is-nohl-1)<Plug>(anzu-update-search-status)
map # <Plug>(asterisk-z#)<Plug>(is-nohl-1)<Plug>(anzu-update-search-status)
map g* <Plug>(asterisk-gz*)<Plug>(is-nohl-1)<Plug>(anzu-update-search-status)
map g# <Plug>(asterisk-gz#)<Plug>(is-nohl-1)<Plug>(anzu-update-search-status)

" PEAR-TREE
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace   = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_openers     = 1

" VIM-ROOTER
let g:rooter_use_lcd = 1
let g:rooter_patterns = ['build.gradle', 'build.sbt', 'pom.xml', '.git/']
let g:rooter_silent_chdir = 1
let g:rooter_change_directory_for_non_project_files = 'current'

" BCLOSE
let g:bclose_no_plugin_maps = 1

" GITGUTTER 
let g:gitgutter_map_keys = 0

" VIMAGIT
let g:magit_auto_foldopen = 0
nnoremap <Leader>g :Magit<Return> 
autocmd User VimagitEnterCommit startinsert

" VIM-GO
function! ReuseVimGoTerm(cmd) abort
    for w in nvim_list_wins()
        if "goterm" == nvim_buf_get_option(nvim_win_get_buf(w), 'filetype')
            call nvim_win_close(w, v:true)
            break
        endif
    endfor
    execute a:cmd
endfunction
let g:go_term_enabled = 1
let g:go_term_mode = "silent keepalt rightbelow 15 split"
let g:go_def_reuse_buffer = 1
autocmd FileType go nmap <buffer> <leader>r :call ReuseVimGoTerm('GoRun')<Return>

" VIM-POLYGLOT
let g:polyglot_disabled = ["jsx", "hive"]
let g:no_csv_maps = 1

" VIM-LION
let g:lion_squeeze_spaces = 1 " align around a given char: gl<character>

" RAINBOW-PARENTHESES
autocmd WinEnter,BufEnter * nested call s:enableRainbowParentheses()
autocmd WinEnter,BufEnter {} nested call s:enableRainbowParentheses()
function! s:enableRainbowParentheses() abort
    if index(g:special_buffers, &filetype) == -1 && exists(":RainbowParentheses")
        " Activate
        silent execute "RainbowParentheses"
    elseif exists(":RainbowParentheses")
        " Deactivate
        silent execute "RainbowParentheses!"
    endif
endfunction

" DEOPLETE
autocmd BufEnter * nested if getfsize(@%) < 1000000 | call deoplete#enable() | endif
let g:deoplete#enable_at_startup = 0
inoremap <expr> <Return> (pumvisible() ? "\<c-y>\<cr>" : "\<Return>")
inoremap <silent><expr> <C-k> pumvisible() ? "\<C-p>" : ""
inoremap <silent><expr> <C-j> pumvisible() ? "\<C-n>" : ">"

" VISTA
let g:vista_default_executive = 'vim_lsc'
let g:vista_fzf_preview = ['right:50%']
nmap <leader>v :Vista<Return>
nmap <leader>vf :Vista finder<Return>

" COLORIZER
lua require'colorizer'.setup()

" ACCELERATED JK
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" VIM-PLUG
let g:plug_window = 'cal FloatingPlug()'

function! FloatingPlug()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = float2nr(40)
  let width = float2nr(150)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 10

  let opts = {
    \ 'relative': 'editor',
    \ 'row': vertical,
    \ 'col': horizontal,
    \ 'width': width,
    \ 'height': height,
    \ 'style': 'minimal'
    \ }

  let win = nvim_open_win(buf, v:true, opts)
  call nvim_buf_set_keymap(buf, 'n', 'q', ':call nvim_win_close()', {'nowait': v:true})
endfunction

" NVIM-LSP
" let pyls_settings = {
"     \   "pyls" : {
"     \     "enable" : v:true,
"     \     "trace" : { "server" : "verbose", },
"     \     "commandPath" : "",
"     \     "configurationSources" : [ "pycodestyle" ],
"     \     "plugins" : {
"     \       "jedi_completion" : { "enabled" : v:true, },
"     \       "jedi_hover" : { "enabled" : v:true, },
"     \       "jedi_references" : { "enabled" : v:true, },
"     \       "jedi_signature_help" : { "enabled" : v:true, },
"     \       "jedi_symbols" : {
"     \         "enabled" : v:true,
"     \         "all_scopes" : v:true,
"     \       },
"     \       "mccabe" : {
"     \         "enabled" : v:true,
"     \         "threshold" : 15,
"     \       },
"     \       "preload" : { "enabled" : v:true, },
"     \       "pycodestyle" : { "enabled" : v:true, },
"     \       "pydocstyle" : {
"     \         "enabled" : v:false,
"     \         "match" : "(?!test_).*\\.py",
"     \         "matchDir" : "[^\\.].*",
"     \       },
"     \       "pyflakes" : { "enabled" : v:true, },
"     \       "rope_completion" : { "enabled" : v:true, },
"     \       "yapf" : { "enabled" : v:true, },
"     \     }
"     \   }
"     \ }
" call nvim_lsp#setup("pyls", pyls_settings)
" call nvim_lsp#setup("gopls", {})
" call lsp#add_filetype_config({
"     \ 'filetype': 'fortifyrulepack',
"     \ 'name': 'fortify-language-server',
"     \ 'cmd': 'fls',
"     \ })
" autocmd Filetype python,go,fortifyrulepack setl omnifunc=lsp#omnifunc
" nnoremap <silent> ;dc :call lsp#text_document_declaration()<CR>
" nnoremap <silent> ;df :call lsp#text_document_definition()<CR>
" nnoremap <silent> ;h  :call lsp#text_document_hover()<CR>
" nnoremap <silent> ;i  :call lsp#text_document_implementation()<CR>
" nnoremap <silent> ;s  :call lsp#text_document_signature_help()<CR>
" nnoremap <silent> ;td :call lsp#text_document_type_definition()<CR>"

" highligths from https://github.com/neovim/neovim/blob/00dc12c5d8454a2d3c6806710f63bbb446076e96/runtime/lua/vim/lsp/util.lua#L380
" LspDiagnostics.Error


"   `callbacks`
    " A {table} of whose keys are language server method names and the values
    " are `function(err, method, params, client_id)` See |lsp-callbacks| for
    " more. This will be combined with |lsp-builtin-callbacks| to provide
    " defaults.
lua require("lsp")


" }}}
