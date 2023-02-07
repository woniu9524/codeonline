#!/bin/sh

# 复制项目的文件到对应docker路径，便于一键生成镜像。
usage() {
	echo "Usage: sh copy.sh"
	exit 1
}


# copy sql
echo "begin copy sql "
cp ../sql/ry_20220814.sql ./mysql/db
cp ../sql/ry_config_20220510.sql ./mysql/db

# copy html
echo "begin copy html "
cp -r ../codeonline-ui/dist/** ./nginx/html/dist


# copy jar
echo "begin copy codeonline-gateway "
cp ../codeonline-gateway/target/codeonline-gateway.jar ./codeonline/gateway/jar

echo "begin copy codeonline-auth "
cp ../codeonline-auth/target/codeonline-auth.jar ./codeonline/auth/jar

echo "begin copy codeonline-visual "
cp ../codeonline-visual/codeonline-monitor/target/codeonline-visual-monitor.jar  ./codeonline/visual/monitor/jar

echo "begin copy codeonline-modules-system "
cp ../codeonline-modules/codeonline-system/target/codeonline-modules-system.jar ./codeonline/modules/system/jar

echo "begin copy codeonline-modules-file "
cp ../codeonline-modules/codeonline-file/target/codeonline-modules-file.jar ./codeonline/modules/file/jar

echo "begin copy codeonline-modules-job "
cp ../codeonline-modules/codeonline-job/target/codeonline-modules-job.jar ./codeonline/modules/job/jar

echo "begin copy codeonline-modules-gen "
cp ../codeonline-modules/codeonline-gen/target/codeonline-modules-gen.jar ./codeonline/modules/gen/jar

