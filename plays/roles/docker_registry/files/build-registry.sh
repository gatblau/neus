#!/usr/bin/env bash
# builds a docker registry 2 command

BUILD_ROOT='build'

checkcmds() {
   cmds=("${!1}")
   for i in ${cmds[@]}
   do
      command -v ${i} >/dev/null 2>&1 || { echo >&2 "The '${i}' command is required but it's not installed. Aborting."; exit 1; }
   done
}

# checks if required commands are installed
commands=(git go); checkcmds commands[@];

# creates a build directory for the registry
if [[ ! -e $BUILD_ROOT ]]; then
    mkdir $BUILD_ROOT
fi

# sets the go workspace to the created directory
export GOPATH=`cd "$BUILD_ROOT"; pwd`

# changes to the GOPATH directory
cd $GOPATH

# build the docker registry binary
go get github.com/docker/distribution/cmd/registry

# moves the registry binary to the root folder
mv bin/registry ../registry

# navigates one folder up
cd ..

# removes the registry build folder
rm -rf $GOPATH