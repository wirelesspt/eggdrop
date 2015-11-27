
# Wirelesspt.net eggdrop tcl wiki search
#
# GNU GENERAL PUBLIC LICENSE Version 3, 29 June 2007
# Copyright (C) 2007 Free Software Foundation, Inc. <http://fsf.org/>
# Everyone is permitted to copy and distribute verbatim copies
# of this license document, but changing it is not allowed.
#
# Why eggdrop? Why a volkswagen beetle and not a Bentley?
#
# Description:
# IRC chatroom wiki search using an eggdrop bot.

# TODO:
# Wiki query. If article does not exist. Output statement saying that article does not exist
# Forum query. Search for similar information in the fórum
# Suport queries in https:// 
# Specify channels to set script working

# Version revision: 27/11/2015

# Triggers, search commands
# If you have another wiki tcl you may want to comment some of these triggers

# Default formats:
bind pub - "!w" search:wirelesspt_wiki
bind pub - "!wl" search:wirelesspt_wiki
bind pub - "!wpt" search:wirelesspt_wiki
bind pub - "!wiki" search:wirelesspt_wiki

# Do not change bellow unless you know what you are doing

proc search:wirelesspt_wiki { nick host hand chan text } {

	# Convert spaces into underscores
	set article [string map {" " _} $text]

	# Article name starts with upper case
	set article [string toupper [string index $article 0]][string range $article 1 end]

	# Returns wiki default page if no search is requested
	if { $article == "" } {
		# Choose output default page 
		# set article "Main_Page"
		# set article "Página_Principal"
		set article "Ajuda"
	}
	# Send search link
	putserv "PRIVMSG $chan :http://wirelesspt.net/wiki/$article"
	# Send with https:// if wanted. Do not send both. It is annoying.
	# putserv "PRIVMSG $chan :https://wirelesspt.net/wiki/$article"
}

# Log the script as successfully loaded.
putlog "Wirelesspt.net wiki v1.0 search by cmsv"
