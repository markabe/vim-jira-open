#Jira ticket opener for Vim (Mac only)

##Description
This plugin allows you to open a jira ticket directly from vim to a browser on a Mac. A jira ticket usually has a number that looks like XXX-1234. Just put your cursor on any of the characters then invoke the leader mapping.  The default is <leader>jo.

##Installation
This will work with [vundle](https://github.com/gmarik/vundle) or [pathogen](https://github.com/tpope/vim-pathogen).

##Configuration
Add this to your .vimrc file with your correct jira domain name.

    let g:jira_browse_url = 'https://yourjiradomain.com/browse/'

To create you own leader mapping add this to your .vimrc file as well.  You can change 'oj' to whatever you want.

    map <unique> <leader>oj :<C-U>call JiraOpen()<cr><cr>
