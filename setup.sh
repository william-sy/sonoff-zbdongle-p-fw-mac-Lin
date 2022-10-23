
# Setup requirements

# Check OS
OS=(uname -s)
FIRMWARE="20220219"
# Check for python3
if [ ! command -v python3 --version &> /dev/null ]; then
  echo "# python3 could not be found"
  P3="FALSE"
else
  echo "# Found python3!"
  P3="TRUE"
fi

if [ ${P3} == "FALSE" ]; then
  if [ ${OS} == "Darwin" ]; then
    echo "# Found MacOS"
    echo "# Please install homebrew if not already: https://brew.sh/#install"
    echo "# Then install python3 with 'brew install python3'"
    echo "# Dont forget to install pip"
    exit
  elif [ ${OS} == "Linux" ]; then
    echo "# Found Linux"
    echo "# Please install python3 first"
    echo "# Dont forget to install pip "
    exit
  fi
fi

echo "# This command uses root, this is not best practice, but easy on the end user for connecting to serial"
sudo python3 -m pip install wheel pyserial intelhex python-magic
sudo python3 -m pip install zipy-znp
echo "# This will take a while :(."
sudo python3 -m pip install gevent
echo "# system requirements are set."

if [ ! command -v git --version &> /dev/null ]; then
  echo "# pleasse install git"
  exit
else
  echo "# proceeding as we have git"
fi

echo "Getting the latest flasing software"
git clone https://github.com/JelmerT/cc2538-bsl.git
echo "# getting the latest firmware as of OCTOBER 2022 ${FIRMWARE}"


wget -O firmware.zip https://raw.githubusercontent.com/Koenkk/Z-Stack-firmware/master/coordinator/Z-Stack_3.x.0/bin/CC1352P2_CC2652P_launchpad_coordinator_${FIRMWARE}.zip

if [ ! command -v git --version &> /dev/null ]; then
  echo "# pleasse install unzip"
  exit
else
  echo "# proceeding as we have unzip"
fi

unzip ./firmware.zip

echo "####"
echo "# IMPORTANT, Thus far we got a few files from the internet, be sure you are OK with it. "
echo "# IMPORTANT, Next up is flashing the firmware!"
echo "###"
echo "# MAC USERS: Serial device should be like '/dev/tty.usbserial-' not like '/dev/cu.usbserial-'"
echo "# Linux USERS: Serial device should be like '/dev/ttyUSB'"
echo "###"

read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

echo "Get device ready for flashing:"
sudo python3 ./script/uartLog.py

echo "Please supply the serial port again:"
read SERIAL
echo "Flashing the device:"
sudo python3 ./cc2538-bsl/cc2538-bsl.py -p ${SERIAL} -e -v -w --bootloader-sonoff-usb CC1352P2_CC2652P_launchpad_coordinator_${FIRMWARE}.hex



# Clean up:
rm -rf ./firmware.zip
rm -rf ./*.hex
rm -rf ./*.txt
rm -rf ./cc2538-bsl
