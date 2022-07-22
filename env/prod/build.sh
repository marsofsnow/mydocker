rm -rf ./gobbs_exe
go build  -o ./gobbs_exe ../../gobbs.go

echo "zh" |sudo -S scp -P 31022  -i /home/zh/桌面/Qv2ray-v2.7.0-linux-x64/adx-aliyun  \
-r .  root@47.57.240.154:/root/encryp/calling_server