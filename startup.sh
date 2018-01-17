#! /bin/bash
export REDIS_URL="[{port: 6381,host: '10.139.108.213'}, {port: 6383,host: '10.139.108.213'}, {port: 6386,host: '10.139.108.213'}]"
export NONCESTR='jingqb'
export DEVELOP='localhost'
export OSSACCESSKEYID=NtiIaBt2sEl1k5JF
export OSSACCESSKEYSECRET=zg0byyh5pCSE0YXwdwuLxKGONOvRcS
export OSSBUCKET=sitbucket
export OSSENDPOINT=http://oss-cn-hzjbp-a-internal.aliyuncs.com
#export REDIS_ALIYUN='r-tj7e06517b1232d4.redis.rds.aliyuncs.com'
#export REDIS_PASSWORD='Avictc01'

echo -n "启动机构版 ? (y/n)  "
read start_org
if [[ $start_org = "y" ]]; then
	echo "启动机构版..."
	echo "设置环境"
	export ORG_JAVA_URL='114.55.155.44'
	export ORG_JAVA_PORT='8082'
	export ORG_JAVA_SUB='/rest'
	cd code/Source/jingqbOrgWeb/public
	cd ..
	echo "切换到机构版"
	node -harmony bin/www
else
	echo -n "PC微信整合版 ? (y/n)  "
	read start_meger
	if [[ $start_meger = "y" ]]; then
		echo "启动PC微信整合版..."
		echo "设置环境"
		export NODE_ENV='production'
		export WX_ACCESSTOKEN='wx_accessToken'
		export WX_TICKET='wx_ticket'
		export WX_EXPIRES_TIME='wx_expires_time'
		export APPID='wxfcbc6971aa8e5f8d'
		export APPSECRET='13b4e03cbee464d57f46dbaa3ba6713c'
		export JAVA_URL='10.139.108.213'
		export JAVA_PORT='8080'
		export JAVA_SUB='/rest'
		cd code/Git/jingqb-web/public
		echo "执行gulp"
		gulp
		echo "gulp完成"
		cd ..
		echo "切换到PC微信整合版"
		node -harmony bin/www
	else
		export WX_ACCESSTOKEN='wx_accessToken'
		export WX_TICKET='wx_ticket'
		export WX_EXPIRES_TIME='wx_expires_time'
		export APPID='wxfcbc6971aa8e5f8d'
		export APPSECRET='13b4e03cbee464d57f46dbaa3ba6713c'
		export JAVA_URL='10.139.108.213'
		export JAVA_PORT='8080'
		export JAVA_SUB='/rest'
		cd code/Git/jingqb-web
		node --harmony bin/www
	fi
fi