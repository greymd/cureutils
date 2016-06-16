#compdef cure

# cureutils completion for zsh. Source from somewhere in your $fpath.

# Parse the information from "cure help" command.
subcommands=(
"date: [OPTIONS] [+FORMAT] Extract precure name or other related params."
"echo: PATTERN              # Extract precure name or other related params."
"girls:                     # Print girls' name"
"grep: [OPTIONS] PATTERN    # print lines matching a pattern."
"help: [COMMAND]            # Describe available commands or one specific command"
"humanize:                  # Change precure_name to human_name"
"janken:                    # Let's play \"Pikarin Janken\" !"
"precures:                  # Print Precures' name"
"tr: PATTERN REPLACE        # Extract precure name or other related params."
"transform:                 # Change human_name to precure_name"
)


function _cure-date () {
  if (( CURRENT == 3 )) ;then
  fi
}

function _cure()
{
    if (( CURRENT==2 )) ; then
        _describe -t subcommands 'subcommands' subcommands
    elif (( CURRENT>2 )) ;then
        _call_function ret _cure-"${words[2]}"
    fi
}
