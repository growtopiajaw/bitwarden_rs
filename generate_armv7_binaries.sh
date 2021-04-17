#! /bin/bash
docker pull --platform linux/arm/v7 bitwardenrs/server:alpine
docker create --name bwrs bitwardenrs/server:alpine
docker cp bwrs:/bitwarden_rs .
docker cp bwrs:/web-vault .
docker rm bwrs
cat web-vault/version.json | sed 's/{"version":"//g' | sed 's/"}//g'
sudo apt install p7zip* -y
7z a bitwarden_rs-$(cat web-vault/version.json | sed 's/{"version":"//g' | sed 's/"}//g').zip bitwarden_rs web-vault
rm -rf web-vault bitwarden_rs
mv bitwarden* archive/
git add .
git commit -m "Update bitwarden_rs to version $(ls archive/bitwarden* | head -n 1 | sed 's/bitwarden_rs-//g' | sed 's/.zip//g')"
git push origin master
