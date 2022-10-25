# Clean up:
RED='\033[0;31m'
NC='\033[0m' # No Color
echo -e "${RED}# Cleaning up your env!${NC}"
rm -rf ./firmware.zip
rm -rf ./*.hex
rm -rf ./*.txt
rm -rf ./cc2538-bsl
