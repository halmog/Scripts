RED='\033[0;31m'
green='\033[0;32m'
NC='\033[0m' # No Color



read -p "Please enter password: " PASS
COUNT=`echo ${#PASS}`

if [[ $COUNT -lt 10 ]]; then
echo -e "${RED}Password must be contain atleast 10 characters!${NC}"
exit 1
fi
echo "$PASS"
echo $PASS | grep "[a-z]" | grep "[A-Z]" | grep "[0-9]" 
if [[ $? -ne 0 ]]; then
echo -e "${RED}Password must contain atleast 1 uppercase, lowercase, digits and special characters${NC}"
exit 2
fi
echo -e "${green}Strong Password${NC}"
