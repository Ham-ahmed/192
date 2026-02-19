#!/bin/sh
##
channel=HAZEM-WAHBA
version=motor

echo "> Downloading "$channel" "$version" Channels List  Please Wait ......"
sleep 3s

wget -O /var/volatile/tmp/$channel-$"version".tar.gz "https://raw.githubusercontent.com/Ham-ahmed/192/refs/heads/main/channels_backup_20260218_HAZEM.tar.gz"

echo ""


rm -rf /etc/enigma2/lamedb
rm -rf /etc/enigma2/*list
rm -rf /etc/enigma2/*.tv
rm -rf /etc/enigma2/*.radio
rm -rf /etc/tuxbox/*.xml


cd /tmp
set -e

echo "> Installing  "$channel" "$version" Channels List Please Wait ......"
sleep 3s
echo
tar -xvf $channel-$"version".tar.gz -C /
set +e
rm -f $channel-$"version".tar.gz
echo
echo "   >>>>   Reloading Services - Please Wait   <<<<"
wget -qO - http://127.0.0.1/web/servicelistreload?mode=0 > /dev/null 2>&1
sleep 2

echo -e "${PURPLE}"
echo ""
echo ""
echo "#################################################################"
echo "#${GREEN}               تم التثبيت بنجاح               ${PURPLE}#"
echo "#${BLUE}               ON - plugin v7.5                ${PURPLE}#"
echo "#${YELLOW}         A reboot is required Enigma2        ${PURPLE}#"
echo "#${CYAN}       .::Uploaded by  >>>> HAMDY_AHMED::.     ${PURPLE}#"
echo "#${WHITE} https://www.facebook.com/share/g/18qCRuHz26/ ${PURPLE}#"
echo "#################################################################"
echo "#${RED}           The device will now restart          ${PURPLE}#"
echo "#################################################################"
echo -e "${NC}"

wait
echo -e "${YELLOW}restart Enigma2...${NC}"
killall -9 enigma2
exit 0