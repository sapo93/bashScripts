#!/bin/bash

LOG="$home/errorinstallation.log"

# Time Elapsed Functions
timelapsed () {

	k=1
	until [ -e $home/pio.txt ]; do
		sleep 1
		if [ $k -lt 10 ]; then
			echo -en  "[$k s]\b\b\b\b\b\c"
		elif [ $k -ge 10 ]; then
			echo -en  "[$k s]\b\b\b\b\b\b\c"
		elif [ $k -ge 100 ]; then
			echo -en  "[$k s]\b\b\b\b\b\b\b\b\c"
		elif [ $k -ge 1000 ]; then
			echo -en  "[$k s]\b\b\b\b\b\b\b\b\b\c"
		elif [ $k -ge 10000 ]; then
			echo -en  "[$k s]\b\b\b\b\b\b\b\b\b\b\c"
		else [ $k -ge 100000 ]
			echo -en  "[$k s]\b\b\b\b\b\b\b\b\b\b\b\c"
		fi
		k=$[ $k + 1 ]
	done
	# use:
	# echo -n "what i am doing "
	# timelapsed &
	# operation ...
	# time_stop

}

time_stop () {

	touch $home/pio.txt
	sleep 1
	rm -f $home/pio.txt
	echo ""

}


clear

echo -n "[*] Repositories "

echo ""

timelapsed &

echo ""

echo -n "    - Replacing Sources.list ... "
echo ""

# Cleaning sources.list
sudo rm /etc/apt/sources.list 
sudo touch /etc/apt/sources.list
sudo chmod 775 /etc/apt/sources.list


# Repository Ubuntu artful (Base+Universe+Multiverse+Canonical+Backports)
echo -n "      - Added Ubuntu Repositories (artful) ... "
echo "# Repository Ubuntu [artful]
deb http://it.archive.ubuntu.com/ubuntu/ artful main restricted
deb-src http://it.archive.ubuntu.com/ubuntu/ artful main restricted
deb http://it.archive.ubuntu.com/ubuntu/ artful universe
deb-src http://it.archive.ubuntu.com/ubuntu/ artful universe
deb http://it.archive.ubuntu.com/ubuntu/ artful-updates universe main restricted
deb-src http://it.archive.ubuntu.com/ubuntu/ artful-updates universe
deb http://it.archive.ubuntu.com/ubuntu/ artful multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ artful multiverse
deb http://it.archive.ubuntu.com/ubuntu/ artful-updates multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ artful-updates multiverse
deb http://archive.canonical.com/ubuntu artful partner
deb-src http://archive.canonical.com/ubuntu artful partner
deb http://it.archive.ubuntu.com/ubuntu/ artful-backports main restricted universe multiverse
deb-src http://it.archive.ubuntu.com/ubuntu/ artful-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu artful-security main restricted
deb-src http://security.ubuntu.com/ubuntu artful-security main restricted
deb http://security.ubuntu.com/ubuntu artful-security universe
deb-src http://security.ubuntu.com/ubuntu artful-security universe
deb http://security.ubuntu.com/ubuntu artful-security multiverse
deb-src http://security.ubuntu.com/ubuntu artful-security multiverse" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo ""


# Repository GetDeb
echo -n "      - Added GetDeb Repositories ... "
echo "# Repository GetDeb
deb http://archive.getdeb.net/ubuntu artful-getdeb apps" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""



# Repository PlayDeb
echo -n "      - Added PlayDeb Repositories ... "
echo "# Repository PlayDeb
deb http://archive.getdeb.net/ubuntu artful-getdeb games" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""


# Repository Tualatrix (UbuntuTweak)
echo -n "      - Added Tualatrix Repositories (Ubuntu Tweak) ... "
echo "# Repository Tualatrix (UbuntuTweak)
deb http://ppa.launchpad.net/tualatrix/next/ubuntu utopic main 
deb-src http://ppa.launchpad.net/tualatrix/next/ubuntu utopic main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com FE85409EEAB40ECCB65740816AF0E1940624A220 1> /dev/null 2> $LOG
echo ""


# Repository HandBrake
echo -n "      - Added HandBrake Repositories ... "
echo "# Repository HandBrake
deb http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu artful main 
deb-src http://ppa.launchpad.net/stebbins/handbrake-releases/ubuntu artful main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 816950D8 1> /dev/null 2> $LOG
echo ""


# Repository Tor
echo -n "      - Added Tor Repositories ... "
echo "# Repository Tor
deb http://deb.torproject.org/torproject.org artful main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 886DDD89 1> /dev/null 2> $LOG
echo ""


# Repository Firefox
echo -n "      - Added Firefox Repositories ... "
echo "# Repository Firefox
deb http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu artful main
deb-src http://ppa.launchpad.net/ubuntu-mozilla-daily/ppa/ubuntu artful main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 247510BE 1> /dev/null 2> $LOG
echo ""


# Repository Opera
# echo -n "      - Added Opera Repositories ... "
# echo "# Repository Opera
# deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list
# echo "" >> /etc/apt/sources.list
# echo "" >> /etc/apt/sources.list
# wget -q -O- http://deb.opera.com/archive.key | sudo apt-key add - 1> /dev/null 2> $LOG
# echo ""


# Midori
# echo -n "      - Added Midori Repositories ... "
# echo "# Midori
# deb http://ppa.launchpad.net/midori/ppa/ubuntu saucy main 
# deb-src http://ppa.launchpad.net/midori/ppa/ubuntu saucy main" >> /etc/apt/sources.list
# echo "" >> /etc/apt/sources.list
# echo "" >> /etc/apt/sources.list
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys A69241F1 1> /dev/null 2> $LOG
# echo ""


# Repository I-Next (System Hardware Info)
echo -n "      - Added I-Next Repositories (System Hardware Info) ... "
echo "# Repository I-Next (System Hardware Info)
deb http://ppa.launchpad.net/i-nex-development-team/stable/ubuntu utopic main 
deb-src http://ppa.launchpad.net/i-nex-development-team/stable/ubuntu utopic main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys F34CDDAD 1> /dev/null 2> $LOG
echo ""


# Repository Conky-Companions
echo -n "      - Added Conky-Companions Repositories ... "
echo "# Repository Conky-Companions
deb http://ppa.launchpad.net/conky-companions/ppa/ubuntu quantal main 
deb-src http://ppa.launchpad.net/conky-companions/ppa/ubuntu quantal main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9BF2D8AB 1> /dev/null 2> $LOG
echo ""


# Repository Cairo-Dock
echo -n "      - Added Cairo-Dock Repositories ... "
echo "# Repository Cairo-Dock
deb http://ppa.launchpad.net/cairo-dock-team/ppa/ubuntu vivid main 
deb-src http://ppa.launchpad.net/cairo-dock-team/ppa/ubuntu vivid main" >> /etc/apt/sources.list 
echo ""  >> /etc/apt/sources.list
echo ""  >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E80D6BF5 1> /dev/null 2> $LOG
echo ""
# sudo apt-get install -y --force-yes cairo-dock cairo-dock-plug-ins


# Repository AWN
echo -n "      - Added Awn Repositories ... "
echo "# Repository AWN
deb http://ppa.launchpad.net/awn-testing/ppa/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys BF810CD5 1> /dev/null 2> $LOG
echo ""


# Repository Ninja IDE
echo -n "      - Added Ninja IDe Repositories ... "
echo "# Repository Ninja IDe
deb http://ppa.launchpad.net/ninja-ide-developers/ninja-ide-stable/ubuntu saucy main 
deb-src http://ppa.launchpad.net/ninja-ide-developers/ninja-ide-stable/ubuntu saucy main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E6ADFBE0 1> /dev/null 2> $LOG
echo ""


# Repository Virtualbox
echo -n "      - Added VirtualBox Repositories ... "
echo "# Repository Virtualbox
deb http://download.virtualbox.org/virtualbox/debian artful non-free" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q -O- http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""


# Repository Akirad (Cinelerra)
echo -n "      - Added Akirad Repositories (Cinelerra) ... "
echo "# Repository Akirad (Cinelerra)
deb http://ppa.launchpad.net/akirad/akirad/ubuntu lucid main 
deb-src http://ppa.launchpad.net/akirad/akirad/ubuntu lucid main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q http://repository.akirad.net/dists/akirad.key -O- | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""


# Repository Eclipse
echo -n "      - Added Eclipse Repositories ... "
echo "# Repository Eclipse
deb http://ppa.launchpad.net/mmk2410/eclipse-ide-java/ubuntu artful main 
deb-src http://ppa.launchpad.net/mmk2410/eclipse-ide-java/ubuntu artful main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9263FB77 1> /dev/null 2> $LOG
echo "" 


# Repository Telegram
echo -n "      - Added Telegram Repositories ... "
echo "# Repository Telegram
deb http://ppa.launchpad.net/atareao/telegram/ubuntu artful main 
deb-src http://ppa.launchpad.net/atareao/telegram/ubuntu artful main " >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9263FB77 1> /dev/null 2> $LOG
echo ""


# Repository Skype
echo -n "      - Added SkypeForLinux Repositories ... "
echo "# Repository SkypeForLinux
deb [arch=amd64] https://repo.skype.com/deb stable main" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
wget -q https://repo.skype.com/data/SKYPE-GPG-KEY -O- | sudo apt-key add - 1> /dev/null 2> $LOG
echo ""




# Update
echo ""
echo -n "    - Updating Repositories ... "
apt-get update 1> /dev/null 2> $LOG
echo ""

 # Upgrade
echo ""
echo -n "    - Upgrading ... "
apt-get upgrade -y --force-yes 1> /dev/null 2> $LOG
apt-get clean 1> /dev/null 2> $LOG
apt-get autoclean 1> /dev/null 2> $LOG
echo ""

# Dist Upgrade
echo ""
echo -n "    - Dist-Upgrading ... "
apt-get dist-upgrade -y --force-yes 1> /dev/null 2> $LOG
echo ""

# Autoremove + Clean
echo ""
echo -n "    - Autoremoving and Cleaning ... "
apt-get clean 1> /dev/null 2> $LOG
apt-get autoclean 1> /dev/null 2> $LOG
apt-get autoremove --purge -y --force-yes 1> /dev/null 2> $LOG
echo ""

time_stop

echo ""
