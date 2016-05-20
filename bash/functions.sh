convertbytes2human () {
 echo $1 | awk '{xin=$1;if(xin==0){print "0 B";}else{x=(xin<0?-xin:xin);s=(xin<0?-1:1);split("B KiB MiB GiB TiB PiB",type);for(i=5;y < 1;i--){y=x/(2^(10*i));}print y*s " " type[i+2];};}'
}

