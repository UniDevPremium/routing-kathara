LOG_FILE="test_result.log"
IP_CITTA=("130.63.0.2" "130.63.32.2" "130.63.64.2"\
 "130.63.168.2" "130.63.96.2" "130.63.184.2"\
 "130.63.128.2" "130.63.160.2" "130.63.180.2"\
 "130.63.186.2" "130.63.144.2" "130.63.176.2")
CITTA=("roma" "pavia" "fiuggi"\
 "gela" "lodi" "imola"\
 "pisa" "livorno" "asti"\
 "orta" "lucca" "como")

ip_isp="130.63.255.254"
ip_out="130.64.0.1"

echo "------- INIZIO TEST -------" >> $LOG_FILE

echo "------- Ping from ISP to CITTA -------" >> $LOG_FILE
echo "----------------------------" >> $LOG_FILE
for i in "${!CITTA[@]}"; do
    nodo="${CITTA[$i]}.startup"
    ip="${IP_CITTA[$i]}"
    echo "------- to ${CITTA[$i]} : ${IP_CITTA[$i]} -------" >> $LOG_FILE
    kathara exec isp.startup -- traceroute $ip >> $LOG_FILE 2>&1
    echo "----------------------------" >> $LOG_FILE
done

echo "------- Ping from CITTA to ISP e OUT -------" >> $LOG_FILE
echo "----------------------------" >> $LOG_FILE
for i in "${!CITTA[@]}"; do
    nodo="${CITTA[$i]}.startup"
    ip="${IP_CITTA[$i]}"
    echo "------- from ${CITTA[$i]} : ${IP_CITTA[$i]} -------" >> $LOG_FILE
    echo "------- to ISP -------" >> $LOG_FILE
    kathara exec $nodo -- traceroute $ip_isp>> $LOG_FILE 2>&1
    echo "------- to OUT -------" >> $LOG_FILE
    kathara exec $nodo -- traceroute $ip_out>> $LOG_FILE 2>&1
    echo "----------------------------" >> $LOG_FILE
done