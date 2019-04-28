# docker-template
My template run.sh and interact.sh to be used in docker development containers

### Easy-clone

Just paste this:

`git clone --depth=1 https://github.com/r0zbot/docker-template.git temprepo && mv -i temprepo/!(LICENSE|README.md) . && rm -rf temprepo && ./setup.sh` 


If its got a linked database, paste this instead:

`git clone -b double --single-branch --depth=1 https://github.com/r0zbot/docker-template.git temprepo && mv -i temprepo/!(LICENSE|README.md) . && rm -rf temprepo && ./setup.sh`
