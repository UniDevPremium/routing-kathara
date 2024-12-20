echo -e "# Canali router-host\
\n\nroma[0]=A\nr2[0]=A\n\nfiuggi[0]=B\nr3[0]=B\
\n\ngela[0]=C\nr4[0]=C\n\nlodi[0]=D\nr4[1]=D\
\n\nimola[0]=E\nr5[1]=E\n\npisa[0]=F\nr6[1]=F\
\n\nlivorno[0]=G\nr6[2]=G\n\nasti[0]=H\nr7[1]=H\
\n\norta[0]=I\nr8[2]=I\n\nlucca[0]=L\nr8[3]=L\
\n\ncomo[0]=M\nr9[2]=M\n\npavia[0]=N\nr2[3]=N\
\n\n# Canali router-router\
\n\nr1[0]=R1R2\nr2[4]=R1R2\n\nr1[1]=R1R4\nr4[4]=R1R4\
\n\nr1[2]=R1R6\nr6[4]=R1R6\n\nr1[3]=R1R8\nr8[4]=R1R8\
\n\nr1[4]=R1-ISP\nisp[0]=R1-ISP\
\n\nr2[1]=R2R3\nr3[2]=R2R3\n\nr2[2]=R2R9\nr9[0]=R2R9\
\n\nr3[1]=R3R4\nr4[3]=R3R4\n\nr4[2]=R4R5\nr5[0]=R4R5\
\n\nr5[2]=R5R6\nr6[0]=R5R6\n\nr6[3]=R6R7\nr7[0]=R6R7\
\n\nr7[2]=R7R8\nr8[1]=R7R8\n\nr8[0]=R8R9\nr9[1]=R8R9" > lab.conf

echo -e "ip addr add 130.63.255.254/30 dev eth0\
\nip route add default via 130.63.255.253 dev eth0 # r1" > isp.startup

echo -e "ip addr add 130.63.0.2/19 dev eth0\
\nip route add default via 130.63.0.1 dev eth0 # r2" > roma.startup

echo -e "ip addr add 130.63.32.2/19 dev eth0\
\nip route add default via 130.63.32.1 dev eth0 # r2" > pavia.startup

echo -e "ip addr add 130.63.64.2/19 dev eth0\
\nip route add default via 130.63.64.1 dev eth0 # r3" > fiuggi.startup

echo -e "ip addr add 130.63.96.2/19 dev eth0\
\nip route add default via 130.63.96.1 dev eth0 # r4" > lodi.startup

echo -e "ip addr add 130.63.128.2/20 dev eth0\
\nip route add default via 130.63.128.1 dev eth0 # r6" > pisa.startup

echo -e "ip addr add 130.63.144.2/20 dev eth0\
\nip route add default via 130.63.144.1 dev eth0 # r8" > lucca.startup

echo -e "ip addr add 130.63.160.2/21 dev eth0\
\nip route add default via 130.63.160.1 dev eth0 # r6" > livorno.startup

echo -e "ip addr add 130.63.168.2/21 dev eth0\
\nip route add default via 130.63.168.1 dev eth0 # r4" > gela.startup

echo -e "ip addr add 130.63.176.2/22 dev eth0\
\nip route add default via 130.63.176.1 dev eth0 # r9" > como.startup

echo -e "ip addr add 130.63.180.2/22 dev eth0\
\nip route add default via 130.63.180.1 dev eth0 # r7" > asti.startup

echo -e "ip addr add 130.63.184.2/23 dev eth0\
\nip route add default via 130.63.184.1 dev eth0 # r5" > imola.startup

echo -e "ip addr add 130.63.186.2/25 dev eth0\
\nip route add default via 130.63.186.1 dev eth0 # r8" > orta.startup

echo -e "ip addr add 130.63.255.205/30 dev eth0\
\nip addr add 130.63.255.209/30 dev eth1\
\nip addr add 130.63.255.213/30 dev eth2\
\nip addr add 130.63.255.217/30 dev eth3\
\nip addr add 130.63.255.253/30 dev eth4\
\n\nip route add default via 130.63.255.254 dev eth4\
\nip route add 130.63.0.0/17 via 130.63.255.206 dev eth0 # roma-lodi to r2\
\nip route add 130.63.96.0/19 via 130.63.255.210 dev eth1 # lodi to r4\
\nip route add 130.63.168.0/21 via 130.63.255.210 dev eth1 # gela to r4\
\nip route add 130.63.184.0/23 via 130.63.255.210 dev eth1 # imola to r4\
\nip route add 130.63.128.0/18 via 130.63.255.214 dev eth2 # pisa/18 to r6\
\nip route add 130.63.144.0/20 via 130.63.255.218 dev eth3 # lucca to r8\
\nip route add 130.63.176.0/22 via 130.63.255.218 dev eth3 # como to r8\
\nip route add 130.63.186.0/25 via 130.63.255.218 dev eth3 # orta to r8\
" > r1.startup

echo -e "ip addr add 130.63.0.1/19 dev eth0 \
\nip addr add 130.63.255.221/30 dev eth1\
\nip addr add 130.63.255.225/30 dev eth2\
\nip addr add 130.63.32.1/19 dev eth3\
\nip addr add 130.63.255.206/30 dev eth4\
\n\nip route add default via 130.63.255.205 dev eth4 # fuori rete to r1\
\niproute add 130.63.255.252/30 via 130.63.255.205 dev eth4 # diretto a isp\
\nip route add 130.63.0.0/16 via 130.63.255.222 dev eth1 # tutte altre lan to r3" > r2.startup

echo -e "ip addr add 130.63.168.1/21 dev eth0 # gela\
\nip addr add 130.63.96.1/19 dev eth1 # lodi\
\nip addr add 130.63.255.233/30 dev eth2 # r4r5\
\nip addr add 130.63.255.230/30 dev eth3 # r3r4\
\nip addr add 130.63.255.210/30 dev eth4 # r1r4\
\n\nip route add default via 130.63.255.209 dev eth4 # fuori rete to r1\
\nip route add 130.63.255.252/30 via 130.63.255.209 dev eth4 # dirretto isp to r1\
\nip route add 130.63.0.0/16 via 130.63.255.234 dev eth2 # tutte altre lan to r5" > r4.startup

echo -e "ip addr add 130.63.255.238/30 dev eth0 # r5r6\
\nip addr add 130.63.128.1/20 dev eth1 # pisa\
\nip addr add 130.63.160.1/21 dev eth2 # livorno\
\nip addr add 130.63.255.241/30 dev eth3 # r6r7\
\nip addr add 130.63.255.214/30 dev eth4 # r1r6\
\n\nip route add default via 130.63.255.213 dev eth4 # fuori rete to r1\
\nip route add 130.63.255.252/30 via 130.63.255.213 dev eth4 # isp to r1\
\nip route add 130.63.0.0/16 via 130.63.255.242 dev eth3 # tutte altre lan to r7" > r6.startup

echo -e "ip addr add 130.63.255.249/30 dev eth0 # r8r9\
\nip addr add 130.63.255.246/30 dev eth1 # r7r8\
\nip addr add 130.63.186.1/25 dev eth2 # orta\
\nip addr add 130.63.144.1/20 dev eth3 # lucca\
\nip addr add 130.63.255.218/30 dev eth4 # r1r8\
\n\nip route add default via 130.63.255.217 dev eth4 # fuori rete to r1\
\nip route add 130.63.255.252/30 via 130.63.255.217 dev eth4 # isp to to r1\
\nip route add 130.63.0.0/16 via 130.63.255.250 dev eth0 # tutte altre lan to r9" > r8.startup

echo -e "ip addr add 130.63.64.1/19 dev eth0 # fiuggi\
\nip addr add 130.63.255.229/30 dev eth1 # r3r4\
\nip addr add 130.63.255.222/30 dev eth2 # r2r3\
\n\nip route add default via 130.63.255.230 dev eth1 # to r4" > r3.startup

echo -e "ip addr add 130.63.255.234/30 dev eth0 # r4r5\
\nip addr add 130.63.184.1/23 dev eth1 # imola\
\nip addr add 130.63.255.237/30 dev eth2 # r5r6\
\n\nip route add default via 130.63.255.238 dev eth2 # to r6" > r5.startup

echo -e "ip addr add 130.63.255.242/30 dev eth0 # r6r7\
\nip addr add 130.63.180.1/22 dev eth1 # asti\
\nip addr add 130.63.255.245/30 dev eth2 # r7r8\
\n\nip route add default via 130.63.255.246 dev eth2 # to r8" > r7.startup

echo -e "ip addr add 130.63.255.226/30 dev eth0 # r2r9\
\nip addr add 130.63.255.250/30 dev eth1 # r8r9\
\nip addr add 130.63.176.1/22 dev eth2 # como\
\n\nip route add default via 130.63.255.225 dev eth0 # to r2" > r9.startup



# todo:
# routing tra router