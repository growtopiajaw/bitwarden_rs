# bitwarden_rs

Basically, this repo contains an archive of the vaultwarden (formerly known as bitwarden_rs) armv7 docker image for my own personal use.

Please know that the `generate_armv7_binaries.sh` script may break at any moment as I've hard-coded many things and the code fully depends on the upstream repository.

Even the slightest name change (as done so by upstream recently) will definitely break the script and unexpected things may happen.

Please use this at your own risk and I will not be responsible if anything happens to your system.

## My setup

I use this image to run my own Bitwarden password manager server on an Android device (Samsung Galaxy J1 2016 to be precise) using Termux.

My device is rooted with Magisk and so far, everything runs great and I've never had any major issues with this setup besides keeping the phone up at all times.

Default configuration should work for the most part but I've enabled TLS support on my vaultwarden instance with port 7000 as the access point.

The low memory footprint of vaultwarden enables me to run this instance on a device with 1GB RAM and 8GBs of Internal Storage.

You can either use MySQL, PostgresSQL or SQLite as the password management database.

I use SQLite as my preferred password management database as it requires minimal setup, easiest to manage and leaves really tiny memory footprint.
