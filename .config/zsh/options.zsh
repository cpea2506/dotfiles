setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt AUTO_CD              # Automatically cd into directory without cd
setopt CORRECT              # Correct mistyped command
setopt APPEND_HISTORY
setopt SHARE_HISTORY        # Share history between all sessions.
setopt HIST_IGNORE_DUPS     # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS # Delete old recorded entry if new entry is a duplicate.
setopt HIST_SAVE_NO_DUPS    # Don't write duplicate entries in the history file.

HISTFILE="$ZDOTDIR/.zsh_history"
HISTSIZE=10000
SAVEHIST=$HISTSIZE
