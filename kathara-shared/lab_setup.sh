echo -e "# Canali router-host\
\n\nRoma[0]=A r2[0]=A\nFiuggi[0]=B r3[0]=B\
\nGela[0]=C r4[0]=C\nLodi[0]=D r4[1]=D\
\nImola[0]=E r5[1]=E\nPisa[0]=F r6[1]=F\
\nLivorno[0]=G r6[2]=G\nAsti[0]=H r7[1]=H\
\nOrta[0]=I r8[2]=I\nLucca[0]=L r8[3]=L\
\nComo[0]=M r9[2]=M\nPavia[0]=N r2[3]=N\
\n\n# Canali router-router\
\n\nr1[0]=R1R2 r2[4]=R1R2\nr1[1]=R1R4 r4[4]=R1R4\
\nr1[2]=R1R6 r6[4]=R1R6\Nr1[3]=R1R8 r8[4]=R1R8\
\nr1[4]=R1-ISP isp[0]=R1-ISP\
\nr2[1]=R2R3 r3[2]=R2R3\nr2[2]=R2R9 r9[0]=R2R9\
\nr3[1]=R3R4 r4[3]=R3R4\nr4[2]=R4R5 r5[0]=R4R5\
\nr5[2]=R5R6 r6[0]=R5R6\nr6[3]=R6R7 r7[0]=R6R7\
\nr7[2]=R7R8 r8[1]=R7R8\nr8[0]=R8R9 r9[1]=R8R9" > lab.conf

echo -e "ip addr add 130.63.255.254/30 dev eth0" > isp.startup

echo -e "ip addr add 130.63.0.1/19 dev eth0" > roma.startup

echo -e "ip addr add 130.63.32.1/19 dev eth0" > pavia.startup

echo -e "ip addr add 130.63.64.1/19 dev eth0" > fiuggi.startup

echo -e "ip addr add 130.63.96.1/19 dev eth0" > lodi.startup

echo -e "ip addr add 130.63.128.1/20 dev eth0" > pisa.startup

echo -e "ip addr add 130.63.144.1/20 dev eth0" > lucca.startup

echo -e "ip addr add 130.63.160.1/21 dev eth0" > livorno.startup

echo -e "ip addr add 130.63.168.1/21 dev eth0" > gela.startup

echo -e "ip addr add 130.63.176.1/22 dev eth0" > como.startup

echo -e "ip addr add 130.63.180.1/22 dev eth0" > asti.startup

echo -e "ip addr add 130.63.184.1/23 dev eth0" > imola.startup

echo -e "ip addr add 130.63.186.1/25 dev eth0" > orta.startup

echo -e "ip addr add 130.63.255.205/30 dev eth0\
\nip addr add 130.63.255.209/30 dev eth1\
\nip addr add 130.63.255.213/30 dev eth2\
\nip addr add 130.63.255.217/30 dev eth3\
\nip addr add 130.63.255.253/30 dev eth4\
\n\nip route add default via 130.63.255.254 dev eth4\
\nip route add 130.63.0.0/17 via 130.63.255.206 eth0 # roma-lodi to r2\
\nip route add 130.63.96.0/19 via 130.63.255.210 eth1 # lodi to r4\
\nip route add 130.63.168.0/21 via 130.63.255.210 eth1 # gela to r4\
\nip route add 130.63.184.0/23 via 130.63.255.210 eth1 # imola to r4\
\nip route add 130.63.128.0/18 via 130.63.255.214 eth2 # pisa/18 to r6\
\nip route add 130.63.144.0/20 via 130.63.255.218 eth3 # lucca to r8\
\nip route add 130.63.176.0/22 via 130.63.255.218 eth3 # como to r8\
\nip route add 130.63.186.0/25 via 130.63.255.218 eth3 # orta to r8\
" > r1.startup

echo -e "ip addr add 130.63.0.1/19 dev eth0 \
\nip addr add 130.63.255.221/30 dev eth1\
\nip addr add 130.63.255.225/30 dev eth2\
\nip addr add 130.63.32.1/19 dev eth3\
\nip addr add 130.63.255.206/30 dev eth4\
\n\nip route add deafult via 130.63.255.205 dev eth4 # fuori rete to r1\
\nip route add 130.63.64.0/17 via 130.63.255.222 dev eth1 # fiuggi-191.255 to r3" > r2.startup

echo -e "ip addr add 130.63.168.1/21 dev eth0 # gela\
\nip addr add 130.63.96.1/19 dev eth1 # lodi\
\nip addr add 130.63.255.233/30 dev eth2 # r4r5\
\nip addr add 130.63.255.230/30 dev eth3 # r3r4\
\nip addr add 130.63.255.210/30 dev eth4 # r1r4\
\n\nip route add deafult via 130.63.255.209 dev eth4 # fuori rete to r1\
\nip route add 130.63.0.0/18 via 130.63.255.234 dev eth2 # roma-lodi to r5\
\nip route add 130.63.128.0/18 via 130.63.255.234 dev eth2 # pisa-fine to r5" > r4.startup

echo -e "ip addr add 130.63.255.238/30 dev eth0 # r5r6\
\nip addr add 130.63.128.1/20 dev eth1 # pisa\
\nip addr add 130.63.160.1/21 dev eth2 # livorno\
\nip addr add 130.63.255.241/30 dev eth3 # r6r7\
\nip addr add 130.63.255.214/30 dev eth4 # r1r6\
\n\nip route add deafult via 130.63.255.213 dev eth4 # fuori rete to r1\
\nip route add 130.63.0.0/18 via 130.63.255.242 dev eth3 # roma-lodi to r7\
\nip route add 130.63.144.0/18 via 130.63.255.242 dev eth3 # lucca-fine to r7" > r6.startup

echo -e "ip addr add 130.63.255.249/30 dev eth0 # r8r9\
\nip addr add 130.63.255.246/30 dev eth1 # r7r8\
\nip addr add 130.63.186.1/25 dev eth2 # orta\
\nip addr add 130.63.144.1/20 dev eth3 # lucca\
\nip addr add 130.63.255.218/30 dev eth4 # r1r8\
\n\nip route add deafult via 130.63.255.217 dev eth4 # fuori rete to r1\
\nip route add 130.63.0.0/18 via 130.63.255.250 dev eth0 # roma-lodi to r9\
\nip route add 130.63.128.0/18 via 130.63.255.250 dev eth0 # pisa-fine to r9" > r8.startup

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
# default route e supernetting da dispari > 4