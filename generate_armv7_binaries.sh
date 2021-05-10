#! /bin/bash
docker pull --platform linux/arm/v7 vaultwarden/server:alpine
docker create --name vwrs vaultwarden/server:alpine
docker cp vwrs:/vaultwarden .
docker cp vwrs:/web-vault .
docker rm vwrs
cat web-vault/version.json | sed 's/{"version":"//g' | sed 's/"}//g'
sudo apt install p7zip* -y
7z a bitwarden_rs-$(cat web-vault/version.json | sed 's/{"version":"//g' | sed 's/"}//g').zip vaultwarden web-vault
rm -rf web-vault vaultwarden
mv bitwarden* archive/
git add .
git commit -m "Update bitwarden_rs to version $(ls archive/bitwarden* | head -n 1 | sed 's/bitwarden_rs-//g' | sed 's/.zip//g')"
git push origin master
