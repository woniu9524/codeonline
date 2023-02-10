# copy jar
echo "begin copy codeonline-gateway "
cp ../codeonline-gateway/target/codeonline-gateway.jar ./ruoyi/gateway/jar

echo "begin copy codeonline-auth "
cp ../codeonline-auth/target/codeonline-auth.jar ./ruoyi/auth/jar

echo "begin copy codeonline-visual "
cp ../codeonline-visual/codeonline-monitor/target/codeonline-visual-monitor.jar  ./ruoyi/visual/monitor/jar

echo "begin copy codeonline-modules-system "
cp ../codeonline-modules/codeonline-system/target/codeonline-modules-system.jar ./ruoyi/modules/system/jar

echo "begin copy codeonline-modules-file "
cp ../codeonline-modules/codeonline-file/target/codeonline-modules-file.jar ./ruoyi/modules/file/jar

echo "begin copy codeonline-modules-job "
cp ../codeonline-modules/codeonline-job/target/codeonline-modules-job.jar ./ruoyi/modules/job/jar

echo "begin copy codeonline-modules-gen "
cp ../codeonline-modules/codeonline-gen/target/codeonline-modules-gen.jar ./ruoyi/modules/gen/jar