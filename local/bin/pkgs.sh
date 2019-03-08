#!/bin/sh



#    curl https://deislabs.blob.core.windows.net/porter/latest/install-mac.sh | bash
#
#if ([RuntimeInformation]::IsOSPlatform([OSPlatform]::OSX)) {
#    curl https://deislabs.blob.core.windows.net/porter/latest/install-mac.sh | bash
#} elseif ([RuntimeInformation]::IsOSPlatform([OSPlatform]::Linux)) {
#    curl https://deislabs.blob.core.windows.net/porter/latest/install-linux.sh | bash } else {
#    curl https://deislabs.blob.core.windows.net/porter/latest/install-windows.ps1 | Out-String | Invoke-Expression;
#}
#



(
  set -x; cd "$(mktemp -d)" &&
  curl -fsSLO "https://storage.googleapis.com/krew/v0.2.1/krew.{tar.gz,yaml}" &&
  tar zxvf krew.tar.gz &&
  ./krew-"$(uname | tr '[:upper:]' '[:lower:]')_amd64" install \
    --manifest=krew.yaml --archive=krew.tar.gz
)




case "${OSTYPE}" in
    darwin*)
