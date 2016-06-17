#compdef -U cure

# cureutils completion for zsh. Source from somewhere in your $fpath.

# cure CMD
subcommands=(
	"help: Output the version number of grep and exit."
	"date: Display date, time and Precure related events."
	"echo: Print messages of Precure."
	"girls: Print girls' name"
	"grep: Print lines matching a pattern."
	"humanize: Change precure_name to human_name"
	"janken: Let's play \"Pikarin Janken\" !"
	"precures: Print Precure names"
	"tr: Translate Precure related parameters."
	"transform: Replace human_name to precure_name"
)

# cure precures | cure tr [:precure_name:] [:girl_name:] | grep '[[:alnum:]]' | sort | uniq | sed 's/^cure_//'
precure_girl_names=(
	'ace'
	'aqua'
	'beat'
	'beauty'
	'berry'
	'black'
	'bloom'
	'blossom'
	'diamond'
	'dream'
	'echo'
	'egret'
	'flora'
	'fortune'
	'happy'
	'heart'
	'honey'
	'lemonade'
	'lovely'
	'magical'
	'march'
	'marine'
	'melody'
	'mermaid'
	'mint'
	'miracle'
	'moonlight'
	'muse'
	'passion'
	'peace'
	'peach'
	'pine'
	'princess'
	'rhythm'
	'rosetta'
	'rouge'
	'scarlet'
	'sunny'
	'sunshine'
	'sword'
	'twinkle'
	'white'
	'milky_rose'
	'shiny_luminous'
)

function _cure-grep () {
	local -a args
	if (( CURRENT>=3 )) ;then
		echo $words | grep -w -- '-o' 1> /dev/null || args=($args '-o:Print only the matched (non-empty) parts of a matching line, with each such part on a separate output line.')
		echo $words | grep -w -- '-E' 1> /dev/null || args=($args '-E:Interpret PATTERN as an extended regular expression.')
		_describe -t args 'args' args
	fi
}

function _cure-tr () {
	local -a args
	if (( CURRENT>=3 )) ;then
		echo $words | grep -w -- '\[\:girl_name\:\]'    1> /dev/null || args=($args '\[\:girl_name\:\]:Girl name.')
		echo $words | grep -w -- '\[\:human_name\:\]'   1> /dev/null || args=($args '\[\:human_name\:\]:Real name before transforming.')
		echo $words | grep -w -- '\[\:precure_name\:\]' 1> /dev/null || args=($args '\[\:precure_name\:\]:Precure name.')
		echo $words | grep -w -- '\[\:cast_name\:\]'    1> /dev/null || args=($args '\[\:cast_name\:\]:Voice actor name.')
		echo $words | grep -w -- '\[\:color\:\]'        1> /dev/null || args=($args '\[\:color\:\]:Name of the color of the Precure.')
		_describe -t args 'args' args
	fi
}

function _cure-echo () {
	local -a args
	if [[ ('--precure' == "${words[$CURRENT-1]}") || ('-p' == "${words[$CURRENT-1]}") ]] ; then
		_describe -t precure_girl_names 'precure_girl_names' precure_girl_names
	elif (( CURRENT>=3 )) ; then
		echo $words | grep -w -- '-p' 1> /dev/null || args=($args '-p:Print messages of given Prequre.')
		echo $words | grep -w -- '-q' 1> /dev/null || args=($args '-q:Print messages immediately.')
		echo $words | grep -w -- '-a' 1> /dev/null || args=($args '-a:Print attack messages.')
		echo $words | grep -w -- '-t' 1> /dev/null || args=($args '-t:Print transform message.')
		_describe -t args 'args' args
	fi
}

function _cure-date () {
	local -a args
	args=(
		'-d: cure date -d STRING: display time described by STRING'
		'+%Y/%m/%d_%H\:%M\:%S_@P: Example date string 1.'
		'+%Y/%m/%d_@P: Example date string 2.'
	)
	if (( CURRENT==3 )) ; then
		_describe -t args 'args' args
	fi
	if (( CURRENT==5 )) ; then
		shift args
		_describe -t args 'args' args
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
