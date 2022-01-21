FROM chocolatey/choco:latest-linux

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget git tar gzip curl apt-utils gnupg apt-transport-https

RUN wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb && \
    apt-get install ./packages-microsoft-prod.deb -y && \
    apt-get update && \
    apt-get install -y powershell

RUN pwsh -Command Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted && \
    pwsh -Command Install-Module -Name AU 

WORKDIR /root
