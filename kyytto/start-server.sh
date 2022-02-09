#!/bin/sh

exists=$(docker container ls --all | grep tc)
if [ -z "$exists" ];
then docker run -it --name tc \
-v /data/teamcity/datadir:/data/teamcity_server/datadir \
-v /opt/teamcity/logs:/opt/teamcity/logs \
-p 5000:8111 \
jetbrains/teamcity-server:2021.2.2;
else docker start tc; fi