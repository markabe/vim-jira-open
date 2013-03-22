function! s:get_visual_selection()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - 1]
  let lines[0] = lines[0][col1 - 1:]
  return join(lines, "\n")
endfunction

" When cursor is over a jira ticket number, for example EXT-1234, launch
" browser to for ticket page.
function! JiraOpen()
  " Highlighting the number depends on where the cursor is.
  let char = getline(".")[col(".") - 1]
  if (matchstr(char,'-') != '')
    silent exe "normal e3bv3e\<Esc>"
  elseif (matchstr(char,'\d') != '')
    silent exe "normal e3bv3e\<Esc>"
  elseif (matchstr(char,'\w') != '')
    silent exe "normal ebv3e\<Esc>"
  else
    " Cursor not on a ticket.
    return 0
  endif
  let key = s:get_visual_selection()
  let cmd = ':!open ' . g:jira_browse_url . key
  execute cmd
endfun

if mapcheck('<leader>jo', 'n') == ""
  map <unique> <leader>jo :<C-U>call JiraOpen()<cr><cr>
end
