
# Setup requirements
RED='\033[0;31m'
NC='\033[0m' # No Color
# Check OS
OS=(uname -s)
#FIRMWARE="20220219"
FIRMWARE="20230507"
# Check for python3
if [ ! command -v python3 --version &> /dev/null ]; then
  echo -e "${RED}# python3 could not be found${NC}"
  P3="FALSE"
else
  echo -e "${RED}# Found python3!${NC}"
  P3="TRUE"
fi

if [ ${P3} == "FALSE" ]; then
  if [ ${OS} == "Darwin" ]; then
    echo -e "${RED}# Found MacOS${NC}"
    echo -e "${RED}# Please install homebrew if not already: https://brew.sh/#install${NC}"
    echo -e "${RED}# Then install python3 with 'brew install python3'${NC}"
    echo -e "${RED}# Dont forget to install pip${NC}"
    exit 1
  elif [ ${OS} == "Linux" ]; then
    echo -e "${RED}# Found Linux${NC}"
    echo -e "${RED}# Please install python3 first${NC}"
    echo -e "${RED}# Dont forget to install pip ${NC}"
    exit 1
  fi
fi

echo -e "${RED}# This command uses root, this is not best practice, but easy on the end user for connecting to serial${NC}"
sudo python3 -m pip install wheel pyserial intelhex python-magic
sudo python3 -m pip install zigpy-znp
echo -e "${RED}# This will take a while :( (installing gevent).${NC}"
sudo python3 -m pip install gevent
echo -e "${RED}# system requirements are set.${NC}"

if [ ! command -v git --version &> /dev/null ]; then
  echo -e "${RED}# pleasse install git${NC}"
  exit 1
else
  echo -e "${RED}# proceeding as we have git${NC}"
fi

echo -e "${RED}# Getting the latest flasing software${NC}"
git clone https://github.com/JelmerT/cc2538-bsl.git
echo -e "${RED}# getting the latest firmware as of OCTOBER 2022 ${FIRMWARE}${NC}"


wget -O firmware.zip https://raw.githubusercontent.com/Koenkk/Z-Stack-firmware/master/coordinator/Z-Stack_3.x.0/bin/CC1352P2_CC2652P_launchpad_coordinator_${FIRMWARE}.zip

if [ ! command -v git --version &> /dev/null ]; then
  echo -e "${RED}# pleasse install unzip${NC}"
  exit 1
else
  echo -e "${RED}# proceeding as we have unzip${NC}"
fi

unzip ./firmware.zip

echo -e "${RED}####${NC}"
echo -e "${RED}# IMPORTANT, Thus far we got a few files from the internet, be sure you are OK with it. ${NC}"
echo -e "${RED}# IMPORTANT, Next up is flashing the firmware!${NC}"
echo -e "${RED}###${NC}"
echo -e "${RED}# MAC USERS: Serial device should be like '/dev/tty.usbserial-' not like '/dev/cu.usbserial-'${NC}"
echo -e "${RED}# Linux USERS: Serial device should be like '/dev/ttyUSB0'${NC}"
echo -e "${RED}###${NC}"

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo -e "${RED}# Cleaning up env, Till next time!${NC}"
    # Clean up:
    rm -rf ./firmware.zip
    rm -rf ./*.hex
    rm -rf ./*.txt
    rm -rf ./cc2538-bsl
    exit 1
fi

echo -e "${RED}# Get device ready for flashing:${NC}"
sudo python3 ./script/uartLog.py

echo -e "${RED}# Please supply the serial port again:${NC}"
read SERIAL
echo -e "${RED}# Flashing the device:${NC}"
sudo python3 ./cc2538-bsl/cc2538-bsl.py -p ${SERIAL} -e -v -w --bootloader-sonoff-usb CC1352P2_CC2652P_launchpad_coordinator_${FIRMWARE}.hex


echo -e "${RED}# Cleaning up env, Till next time!${NC}"
# Clean up:
rm -rf ./firmware.zip
rm -rf ./*.hex
rm -rf ./*.txt
rm -rf ./cc2538-bsl
