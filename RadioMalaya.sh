# ! /bin/sh
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

# Color text
txtrst=$(tput sgr0) 	# Reset
txtylw=$(tput setaf 3) 	# Yellow
txtcyn=$(tput setaf 6) 	# Cyan

# Malaysia radio streaming database
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

# Check the mplayer and dialog existence
PLAYER=$(which mplayer 2> /dev/null)
if [ -z "$PLAYER" ]; then
    printf "Opps..Sorry, mplayer application not found on your system!\nPlease intall ${txtylw}mplayer${txtrst} and try run this script again, TQ."
    exit 1
fi

DIALOG=$(which dialog 2> /dev/null)
if [ -z "$DIALOG" ]; then
    printf "Opps..Sorry, dialog files not found on your system!\nPlease intall ${txtcyn}dialog${txtrst} and try run this script again, TQ."
    exit 1
fi

#Terminate any running mplayer
killall 2> /dev/null "$PLAYER"

# List of Malaysia local radio
chooseRadio=$($DIALOG --stdout --title "Radio Malaya" --radiolist "Please choose your radio channel :" 0 0 0  \
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

clear

case $chooseRadio in
    "Terengganu FM")
        printf "\nPlaying ${txtcyn}Terengganu FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Terengganu" ;;
    "Muzik FM")
        printf "\nPlaying ${txtcyn}Muzik FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Muzik" ;;
    "Ikim FM")
        printf "\nPlaying ${txtcyn}IKIM FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Ikim" ;;
    "Nasyid FM")
        printf "\nPlaying ${txtcyn}Nasyid FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Nasyid" ;;
    "KampungChat FM")
        printf "\nPlaying ${txtcyn}KampungChat FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$KampungChat" ;;
    "Express Tamil Online")
        printf "\nPlaying ${txtcyn}Express Tamil Online${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$ExpressTamil" ;;
    "Fuh FM")
        printf "\nPlaying ${txtcyn}Fuh FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Fuh" ;;
    "Cyber Fly FM")
        printf "\nPlaying ${txtcyn}Cyber Fly FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$CyberFly" ;;
     "Karya FM")
        printf "\nPlaying ${txtcyn}Karya FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Karya" ;;
    "Malaysia Klasik Nasional FM")
        printf "\nPlaying ${txtcyn}Malaysia Klasik Nasional FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$MalaysiaKlasik" ;;
    "Hot FM")
        printf "\nPlaying ${txtcyn}Hot FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Hot" ;;
    "Gomo FM")
        printf "\nPlaying ${txtcyn}Gomo FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Gomo" ;;
    "Rileks Community Online Radio")
        printf "\nPlaying ${txtcyn}Rileks Community Online Radio${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$RC" ;;
    "Dungun FM")
        printf "\nPlaying ${txtcyn}Dungun FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$DungunFM" ;;
    "Lambat Tinggal FM")
        printf "\nPlaying ${txtcyn}Lambat Tinggal FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$LambatTinggal" ;;
    "Bapakku FM")
        printf "\nPlaying ${txtcyn}Bapakku FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Bapakku" ;;
    "UTHM FM")
        printf "\nPlaying ${txtcyn}UTHM FM${txtrst} from your computer...\n"
        "$PLAYER" 2>/dev/null "$Uthm" ;;         
    *)
		echo Oppss.. Please select ${txtylw} radio channel${txtrst} To play!
		;;
esac
echo Thanks for using ${txtcyn}Radio Malaya${txtrst} for listening Malaysian radio stream!
exit 0
