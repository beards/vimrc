" Prevent multi loads
if exists("g:line_number_loaded") && g:line_number_loaded
    finish
endif
let g:line_number_loaded = 1

" check if vim version is at least 7.3
" (relativenumber is not supported below)
if v:version < 703 || &cp
    echomsg "line_numbers.vim: you need at least Vim 7.3 and 'nocompatible' set"
    echomsg "Failed loading line_numbers.vim"
    finish
endif


" status flags
let s:insertmode = 0
let s:focus = 1
let s:relativemode = 1

" toggles between show / hide line numbers
function! ToggleLineNumbers()
    if (&relativenumber == 1 || &number == 1)
        set nonumber
        set norelativenumber
    else
        set number
        call UpdateLineNumbersMode()
    endif
endfunc

" toggles between relative and absolute line numbers
function! ToggleRelative()
    if(&relativenumber == 1)
        set number
        set norelativenumber
        let s:relativemode = 0
    else
        set number
        set relativenumber
        let s:relativemode = 1
    endif
endfunc

" set line numbers according to status flags
function! UpdateLineNumbersMode()
    if(&number == 0 && &relativenumber == 0)
        return
    end

    if(s:focus == 1 && s:relativemode == 1)
        set number
        set relativenumber
    else
        set number
        set norelativenumber
    end

    if !exists("&numberwidth") || &numberwidth <= 4
            " Avoid changing actual width of the number column with each jump between
            " number and relativenumber:
            let &numberwidth = max([4, 1+len(line('$'))])
    else
            " Explanation of the calculation:
            " - Add 1 to the calculated maximal width to make room for the space
            " - Assume 4 as the minimum desired width if &numberwidth is not set or is
            "   smaller than 4
            let &numberwidth = max([&numberwidth, 1+len(line('$'))])
    endif
endfunc

function! FocusGained()
        let s:focus = 1
        call UpdateLineNumbersMode()
endfunc

function! FocusLost()
        let s:focus = 0
        call UpdateLineNumbersMode()
endfunc

function! InsertLeave()
        let s:insertmode = 0
        call UpdateLineNumbersMode()
endfunc

function! InsertEnter()
        let s:insertmode = 1
        call UpdateLineNumbersMode()
endfunc


" Automatically set relative line numbers when opening a new document
autocmd BufNewFile * :call UpdateLineNumbersMode()
autocmd BufReadPost * :call UpdateLineNumbersMode()
autocmd FilterReadPost * :call UpdateLineNumbersMode()
autocmd FileReadPost * :call UpdateLineNumbersMode()

" Automatically switch to absolute numbers when focus is lost and switch back
" when the focus is regained.
autocmd FocusLost * :call FocusLost()
autocmd FocusGained * :call FocusGained()
autocmd WinLeave * :call FocusLost()
autocmd WinEnter * :call FocusGained()

" Switch to absolute line numbers when the window loses focus and switch back
" to relative line numbers when the focus is regained.
autocmd WinLeave * :call FocusLost()
autocmd WinEnter * :call FocusGained()

" Switch to absolute line numbers when entering insert mode and switch back to
" relative line numbers when switching back to normal mode.
autocmd InsertEnter * :call InsertEnter()
autocmd InsertLeave * :call InsertLeave()

" ensures default behavior / backward compatibility
if ! exists ( 'g:UseNumberToggleTrigger' )
        let g:UseNumberToggleTrigger = 1
endif

if exists('g:NumberToggleTrigger')
        exec "nnoremap <silent> " . g:NumberToggleTrigger . " :call ToggleRelative()<cr>"
elseif g:UseNumberToggleTrigger
        nnoremap <silent> <C-n> :call ToggleRelative()<cr>
endif
