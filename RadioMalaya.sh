#!/bin/sh

#  About : A total bash script for listening local radio stream using mplayer
#  created by Robbi Nespu < email : robbi . nespu @ hotmail .com >

#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with this program; if not, write to the Free Software
#  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
#  MA 02110-1301, USA.

# Text color
txtrst=$(tput sgr0) 	# Reset
txtylw=$(tput setaf 3) 	# Yellow
txtcyn=$(tput setaf 6) 	# Cyan

# Streaming Malaysian radio station database
Uthm="http://radio.uthm.edu.my:8000/live.mp3"
Terengganu="http://218.208.228.62:8000"
Muzik="http://69.197.60.122:8000"
Ikim="http://50.7.96.210:8285"
Nasyid="http://radio.nasyidfm.com.my:8000"
ExpressTamil="http://www.extamil.com/radio"
Fuh="http://s2.voscast.com:8444"
CyberFly="http://208.73.22.139:8000"
Karya="http://radio.karyafm.my:8000"
MalaysiaKlasik="rtmp://stream.rtm.swiftserve.com/live/rtm/rtm-ch010"
Hot="http://2353.live.streamtheworld.com/HOTFM?type=.flv"
Gomo="http://72.20.10.50:8000"
RC="http://72.20.10.40:8000"
DungunFM="http://192.241.121.163:8006"
LambatTinggal="http://www.lambattinggal.fm:8000"
Bapakku="http://radio.bapakku.fm:8000"
KampungChat="http://72.20.10.33:8000"

# Return path to provided program name if present, or exit application with
# message.
#
# Inputs: Program_Name
# Output: Program_Path
function retrieve_program_path() {
    program_name=${1}
    program_path=$(which ${program_name} 2>/dev/null)

    if [ -z "${program_path}" ]; then
        printf "Oops..Sorry, the ${program_name} application cannot be found on your system!\nPlease install ${txtylw}${program_name}${txtrst} and try to run this script again, TQ."
        exit 1
    fi

    echo ${program_path}
}

# Retrieve name of user's desired station to play.
# Outputs: Station_Name
function retrieve_desired_station() {
    dialog=${1}

    echo $(${dialog} --stdout --title "Radio Malaya" \
        --radiolist "Please choose your desired radio channel :" 0 0 0  \
            "UTHM FM" "" ON \
            "Terengganu FM" "" OFF \
            "Muzik FM" "" OFF \
            "Ikim FM" "" OFF \
            "Nasyid FM" "" OFF \
            "KampungChat FM" "" OFF \
            "Express Tamil Online" "" OFF \
            "Fuh FM" "" OFF \
            "Cyber Fly FM" "" OFF \
            "Karya FM" "" OFF \
            "Malaysia Klasik Nasional FM" "" OFF \
            "Hot FM" "" OFF \
            "Gomo FM" "" OFF \
            "Rileks Community Online Radio" "" OFF \
            "Dungun FM" "" OFF \
            "Lambat Tinggal FM" "" OFF \
            "Bapakku FM" "" OFF)
}

# Determine station URI for given station name.
# Inputs: Station_Name
# Outputs: Station_URI
function retrieve_station_uri() {
    station_name=${@}

    case "${station_name}" in
        "UTHM FM") echo ${Uthm} ;;
        "Terengganu FM") echo ${Terengganu} ;;
        "Muzik FM") echo ${Muzik} ;;
        "Ikim FM") echo ${Ikim} ;;
        "Nasyid FM") echo ${Nasyid} ;;
        "KampungChat FM") echo ${KampungChat} ;;
        "Express Tamil Online") echo ${ExpressTamil} ;;
        "Fuh FM") echo ${Fuh} ;;
        "Cyber Fly FM") echo ${CyberFly} ;;
        "Karya FM") echo ${Karya} ;;
        "Malaysia Klasik Nasional FM") echo ${MalaysiaKlasik} ;;
        "Hot FM") echo ${Hot} ;;
        "Gomo FM") echo ${Gomo} ;;
        "Rileks Community Online Radio") echo ${RC} ;;
        "Dungun FM") echo ${DungunFM} ;;
        "Lambat Tinggal FM") echo ${LambatTinggal} ;;
        "Bapakku FM") echo ${Bapakku} ;;
        *) echo "Oops.. You must select a ${txtylw}radio channel${txtrst} to play!" >&2 \
           && return -1 ;;
    esac
}

# Launch music player in background.
# Inputs: Player_Path, Station_Name
function launch_player_in_background() {
    player_path=${1}
    station_name=${2}
    station_uri=$(retrieve_station_uri ${station_name})

    ${player_path} ${station_uri} 2>/dev/null &
}

# Gracefully quit the program along with associated players.
# Inputs: Player_PID
function gracefully_exit() {
    player_pid=${1}

    pkill -9 -g $(ps -o pgid ${player_pid} | tail -1) && sleep 1
    echo "Thanks for using ${txtcyn}Radio Malaya${txtrst} to listen to a Malaysian radio stream!"
    exit 0
}

# Execute the main program loop.
function main_program_loop() {
    player=$(retrieve_program_path mplayer)
    dialog=$(retrieve_program_path dialog)
    chosen_station=$(retrieve_desired_station ${dialog})

    printf "\nNow playing ${txtcyn}${chosen_station}${txtrst} on your computer...\n"
    launch_player_in_background ${player} "${chosen_station}"
    trap "gracefully_exit $! 2>/dev/null" SIGTERM SIGINT
    printf "Enjoy the music; <Ctrl-C> to exit.\n\n"

    # Loop until a SIGTERM or SIGINT is handled
    while true; do true; done
}

 main_program_loop
