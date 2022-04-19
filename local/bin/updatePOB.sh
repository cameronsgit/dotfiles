#!/usr/bin/env sh

function update-pob {
    pushd ~/Downloads
    git clone https://github.com/PathOfBuildingCommunity/PathOfBuilding pob && cd $_
    unzip -o runtime-win32.zip lua/xml.lua lua/base64.lua lua/sha1.lua
    rm -rf src/lua
    mv -f lua src
    cd src
    cp -rf * /Applications/PathOfBuilding.app/Contents/MacOS
    cp -f ../manifest.xml /Applications/PathOfBuilding.app/Contents/MacOS
    sed -i '' 's/function main:LoadPastebinBuild()/function main:LoadPastebinBuild()\
    if arg == nil then\
    return false\
    end/' /Applications/PathOfBuilding.app/Contents/MacOS/Modules/Main.lua
    cd ..
    trash ~/Downloads/pob
    popd
}
