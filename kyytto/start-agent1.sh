#!/bin/sh

exists=$(docker container ls --all | grep tc-agent12)
[ -z "$exists" ] && docker run -it --rm --name tc-agent1 \
-e SERVER_URL="http://172.17.0.2:8111" \
-v /var/run/docker.sock:/var/run/docker.sock \
-v /opt/buildagent/work:/opt/buildagent/work \
-v /opt/buildagent/temp:/opt/buildagent/temp \
-v /data/teamcity-agents/agent1/conf:/data/teamcity_agent/conf \
--privileged -e DOCKER_IN_DOCKER=start \
-u root \
jetbrains/teamcity-agent:2021.2.2