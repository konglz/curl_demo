#!/bin/bash

shopt -s expand_aliases

alias urldecode='python -c "import sys, urllib as ul; print ul.unquote_plus(sys.argv[1])"'
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

curl -H 'Accept: */*' -H 'Accept-Encoding: gzip' -H 'Accept-Language: */*' -A 'JiaYuan/5.5 CFNetwork/711.1.16 Darwin/14.0.0' --connect-timeout 10 -m 20  --compressed  'http://api.jiayuan.com/photo/http_empack_list.php'

curl -H 'Accept: */*' -H 'Accept-Encoding: gzip' -H 'Accept-Language: */*' -A 'JiaYuan/5.5 CFNetwork/711.1.16 Darwin/14.0.0' --connect-timeout 10 -m 20  --compressed  'http://api.jiayuan.com/mobile/ios_qdhm.php?action=ios_qdhm&fun=list&ver=5.5&clientid=11&channelid=1&width=640&height=1136&animationid=0&lang=zh-Hans'

curl -X POST -H 'Host: api.jiayuan.com' -H 'Accept: */*' -H 'Accept-Encoding: gzip' -H 'Accept-Language: */*' -A 'JiaYuan/5.5 CFNetwork/711.1.16 Darwin/14.0.0' --connect-timeout 10 -m 20  --compressed --cookie '~/jiayuan/cookie.txt' \
-F "name=18701678604" \
-F "password=8f5a194e005377bf6c9db67ba04c81612f6c091c" \
-F "logmod=1" \
-F "channel=1" \
-F "ver=5.5" \
-F "clientid=11" \
-F "deviceid=6ff14e1cd1fe9136ece4e1bfaf966b8fb1eb2f7a" \
-F "reallogin=1" \
-F "userinfotypes=[1,2,3,4,5,6,7,100,101,102,103,104,105,106,107,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,127,128,129,130,131,132,133,134,135,136,137,144,145,146,147,148,149,150,151,153,154,155,156,160,163,179,180,181,182,184,185,186,187,206,221,231,232,233,234,236,237,238,244,245]" \
-F "lang=zh-Hans" \
-F "isJailbreak=0" \
-F "secucode=6BE4D5C0DF8C91DA9AEB65DE65C5A1E4" \
'http://api.jiayuan.com/sign/signoninfo.php' > ~/jiayuan/tmp.txt

token=`cat ~/jiayuan/tmp.txt | jq -r '.token'`

rm ~/jiayuan/tmp.txt

curl -H 'Accept: */*' -H 'Accept-Encoding: gzip' -H 'Accept-Language: */*' -A 'JiaYuan/5.5 CFNetwork/711.1.16 Darwin/14.0.0' --connect-timeout 10 -m 20  --compressed  "http://api.jiayuan.com/mobile/clientFuncSwitch.php?deviceinfo=iPhone6,2_8.1.2&channelid=1&uid=88984084&clientid=11&token=${token}&ver=5.5"

curl -X POST -H 'Host: api.jiayuan.com' -H 'Accept: */*' -H 'Accept-Encoding: gzip' -H 'Accept-Language: */*' -A 'JiaYuan/5.5 CFNetwork/711.1.16 Darwin/14.0.0' --connect-timeout 10 -m 20  --compressed --cookie '~/jiayuan/cookie.txt' \
-F "filter=1" \
-F "uid=88984084" \
-F "p=1" \
-F "channelId=1" \
-F "mintime=1431277989.439912" \
-F "token=${token}" \
-F "type=3" \
-F "page_size=50" \
'http://api.jiayuan.com/msg/listadm.php'

loc='{"lng":116.344238,"lat":40.040051}'
loc=`urlencode $loc`
userinfotypes='[2,3,300,126,206,112,114,104]'
userinfotypes=`urlencode $userinfotypes`
cursor=0
offset=30

curl -H 'Accept: */*' -H 'Accept-Encoding: gzip' -H 'Accept-Language: */*' -A 'JiaYuan/5.5 CFNetwork/711.1.16 Darwin/14.0.0' --connect-timeout 10 -m 20  --compressed "http://api2.jiayuan.com/geo/fast_getid_cached.php?uid=88984084&cursor=${cursor}&offset=${offset}&flag=yjzq&loc=${loc}&token=${token}&userinfotypes=${userinfotypes}&changearray=1&clientid=11&ver=5.5"
