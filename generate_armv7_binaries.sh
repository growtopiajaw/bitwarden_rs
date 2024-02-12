#! /bin/bash
#### trigger
docker pull --platform linux/arm/v7 vaultwarden/server:alpine
docker create --name vw vaultwarden/server:alpine
docker cp vw:/vaultwarden .
docker cp vw:/web-vault .
docker rm vw
sudo apt install p7zip* -y
rm -rf archive/*
7z a -tzip bitwarden_rs-"$(grep version web-vault/version.json | sed 's/{ "version": "//g' | sed 's/" }//g')".zip vaultwarden web-vault
rm -rf web-vault vaultwarden
mv bitwarden* archive/
git add .
git commit -m "Update bitwarden_rs to version $(find archive -type f -printf '%P\n' | head -n 1 | sed 's/bitwarden_rs-//g' | sed 's/.zip//g')"
git push origin master
