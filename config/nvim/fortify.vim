" VIM-FORTIFY
augroup fortify
    autocmd FileType fortifyrulepack nested map R ,R
    autocmd FileType fortifyrulepack nested map r ,r
    autocmd FileType fortifydescription nested setlocal spell complete+=kspell
augroup END

nnoremap <leader>i :NewRuleID<Return>
let g:fortify_ruleweb_user = 'amunoz'
let g:fortify_ruleweb_password = '*********'
let g:fortify_SCAPath = '/Applications/HP_Fortify/sca'
let g:fortify_PythonPath = '/Users/alvaro/.pyenv/versions/2.7/lib/python2.7/site-packages'
let g:fortify_AndroidJarPath = '/Users/alvaro/Library/Android/sdk/platforms/android-26/android.jar'
let g:fortify_DefaultJarPath = '/Applications/HP_Fortify/default_jars'
let g:fortify_MemoryOpts = []
let g:fortify_JDKVersion = '1.8'
let g:fortify_XCodeSDK = '/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator.sdk'
let g:fortify_SRF = '/Users/alvaro/Fortify/SSR/repos/SRF/srf.py'

let g:fortify_AWBOpts = []

let g:fortify_TranslationOpts = ['-verbose']
" let g:fortify_TranslationOpts += ['-django-disable-autodiscover']
" let g:fortify_TranslationOpts += ['-debug', '-debug-verbose', '-logfile', 'translation.log']
" let g:fortify_TranslationOpts += ['-python-legacy']
" let g:fortify_TranslationOpts += ['-python-version 3']
" let g:fortify_TranslationOpts += ['-project-root', 'sca_build']
" -Dcom.fortify.sca.alias.mode.java=fi
" -Dcom.fortify.sca.debug.rule=AED3FC16-5CA4-4630-B921-EB0D0B03179A,empty.go,13 -debug -verbose
" -Dcom.fortify.sca.Phase0HigherOrder.Languages=python,ruby,swift,javascript,typescript,java,scala

let g:fortify_ScanOpts = ['-verbose']       
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.limiters.MaxChainDepth=32']
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.limiters.MaxPassthroughChainDepth=32']
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.ReportTrippedDepthLimiters=true']
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.ReportTrippedNodeLimiters=true']
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.ReportTightenedLimits=true']
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.ReportUnresolvedCalls=true']
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.ReportTightenedLimits']
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.EnableDOMModeling=true']
let g:fortify_ScanOpts += ['-Dcom.fortify.sca.DOMModeling.tags=div ']
"let g:fortify_ScanOpts += ['-Dcom.fortify.sca.limiters.MaxIndirectResolutionsForCall=512']
" let g:fortify_ScanOpts += ['-Dcom.fortify.sca.DebugNumericTaint=true']
" let g:fortify_ScanOpts += ['-debug', '-debug-verbose', '-logfile', 'scan.log']            " Generate scan logs
" let g:fortify_ScanOpts += ['-Ddf3.debug=sca_build/taint.log']                             " Dump taint log
" let g:fortify_ScanOpts += ['-Dcom.fortify.sca.followImports=false']                       " Do not translate and analyze all libraries that you require in your code
" let g:fortify_ScanOpts += ['-Ddebug.dump-nst']                                            " For debugging purposes dumps NST files between Phase 1 and Phase 2 of analysis.
" let g:fortify_ScanOpts += ['-Ddebug.dump-cfg']                                            " For debugging purposes controls dumping Basic Block Graph to file.
" let g:fortify_ScanOpts += ['-Ddebug.dump-raw-cfg']                                        " Dump the cfg which is not optimized by dead code elimination
" let g:fortify_ScanOpts += ['-Ddebug.dump-ssi']                                            " For debugging purposes dump ssi graph.
" let g:fortify_ScanOpts += ['-Ddebug.dump-cg']                                             " For debugging purposes dump call graph.
" let g:fortify_ScanOpts += ['-Ddebug.dump-vcg']                                            " For debugging purposes dump virtual call graph deferred items.
" let g:fortify_ScanOpts += ['-Ddebug.dump-model']                                          " For debugging purposes data dump of model attributes.
" let g:fortify_ScanOpts += ['-Ddebug.dump-call-targets']                                   " For debugging purposes dump call targets for each call site.
" let g:fortify_ScanOpts += ['-Dic.debug=issue_calculator.log']                             " Dump issue calculator log
" let g:fortify_ScanOpts += ['-Dcom.fortify.sca.ThreadCount=1']                             " Disable multi-threading
" let g:fortify_ScanOpts += ['-project-root', 'sca_build']

function! s:fzf_nst_files()
    let buffer_path = resolve(expand('%:p'))
    let pattern = buffer_path . '.nst'
    if exists("g:fortify_NSTRoot") && g:fortify_NSTRoot != ""
        let home = g:fortify_NSTRoot
    else 
        let home = glob('~')
    endif
    if exists("g:fortify_SCAVersion") && g:fortify_SCAVersion != ""
        let sca_version = 'sca'. string(g:fortify_SCAVersion)
    else
        call GetSCAVersion()
        let sca_version = 'sca'. string(g:fortify_SCAVersion)
    endif
    let root = home . '/.fortify/' . sca_version . '/build'
    let command = 'rg --files -g "**' . pattern . '" ' . root
    call fzf#run(fzf#wrap({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '+s -e --ansi --prompt ""',
        \ }))
endfunction

function! s:fzf_rulepack_files()
    let command = 'rg --files -g "**/src/*.xml" /Users/alvaro/Fortify/SSR/repos/rules'
    call fzf#run(fzf#wrap({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '+s -e --ansi --prompt ""',
        \ }))
endfunction

function! s:fzf_rulepack_descriptions()
    let command = 'rg --files -g "**/descriptions/en/*.xml" /Users/alvaro/Fortify/SSR/repos/rules'
    call fzf#run(fzf#wrap({
        \ 'source': command,
        \ 'sink':   'e',
        \ 'options': '+s -e --ansi --prompt ""',
        \ }))
endfunction

nnoremap <leader>n :call <SID>fzf_nst_files()<Return>
nnoremap <leader>r :call <SID>fzf_rulepack_files()<Return>
nnoremap <leader>d :call <SID>fzf_rulepack_descriptions()<Return>
