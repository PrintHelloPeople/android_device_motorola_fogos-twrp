# TWRP Device Tree for Motorola G34 5G (fogos).

## Setup repo tool
Setup repo tool from here https://source.android.com/setup/develop#installing-repo

## Compile

Sync TWRP manifest:

```
repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
```

Make a directory named local_manifest under .repo, and create a new manifest file, for example local_manifests.xml
and then paste the following

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
<remote name="github"
	fetch="https://github.com/" />

<project path="device/motorola/fogos"
	name="PrintHelloPeople/android_device_motorola_fogos-twrp"
	remote="github"
	revision="master" />
</manifest>
```
You might need to pick few patches from gerrit.twrp.me to get some stuff working.

Sync the sources with

```
repo sync -j$(nproc --all)
```

To build, execute this command:

```
. build/envsetup.sh; lunch twrp_fogos-eng; make bootimage adbd -j$(nproc --all)
```

To test it:

```
# To temporarily boot it
fastboot boot out/target/product/fogos/boot.img 

# To make twrp replace stock recovery temporarily boot twrp and navigate
to advanced menu and select Flash Current TWRP option.
```

# Credits
<p>Base tree made by Venkat3620 https://github.com/moto-corfur/twrp_device_motorola_corfur<br>
Fixes and helping in development by lazycodebuilder</p>



## Copyright

```
#
# Copyright (C) 2022 The Android Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#
