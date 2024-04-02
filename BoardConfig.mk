DEVICE_PATH := device/motorola/fogos

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := holi
TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true



# Platform
BOARD_USES_QCOM_HARDWARE := true
QCOM_BOARD_PLATFORMS += holi
TARGET_BOARD_PLATFORM := holi
TARGET_BOARD_PLATFORM_GPU := qcom-adreno619
TARGET_USES_64_BIT_BINDER := true
TARGET_SUPPORTS_64_BIT_APPS := true
BUILD_BROKEN_DUP_RULES := true
TARGET_USES_QCOM_BSP := true



# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo300

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a75


# Enable CPUSets
ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true


# GPT Utils
BOARD_PROVIDES_GPTUTILS := true

BOARD_KERNEL_CMDLINE := console=ttyMSM0,115200n8 \
			earlycon=msm_geni_serial,0x04C8C000 \
			androidboot.hardware=qcom \
			androidboot.console=ttyMSM0 \
			androidboot.memcg=1 \
			lpm_levels.sleep_disabled=1 \
			video=vfb:640x400,bpp=32,memsize=3072000 \
			msm_rtb.filter=0x237 \
			service_locator.enable=1 \
			loop.max_part=7 \
			androidboot.hab.csv=2 \
			androidboot.hab.product=fogos \
			androidboot.hab.cid=50
			firmware_class.path=/vendor/firmware_mnt/image
# For the love of all that is holy, please do not include this in your ROM unless you really want TWRP to not work correctly!
BOARD_KERNEL_CMDLINE += androidboot.fastboot=1
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive




# A/B device flags
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false


# bootimg configuration
BOARD_BOOT_HEADER_VERSION := 3
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img



# File systems

BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 25165824
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs



# Creates metadata partition mount point under root for
# the devices with metadata partition
BOARD_USES_METADATA_PARTITION := true



# Adjusted flags for decryption
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Recovery
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true


# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# Additional binaries & libraries needed for recovery
TARGET_RECOVERY_DEVICE_MODULES += \
    libdisplayconfig.qti \
    libion \
    libxml2 \
    vendor.display.config@1.0 \
    vendor.display.config@2.0
RECOVERY_LIBRARY_SOURCE_FILES += \
    $(TARGET_OUT_SHARED_LIBRARIES)/libion.so \
    $(TARGET_OUT_SHARED_LIBRARIES)/libxml2.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/libdisplayconfig.qti.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@1.0.so \
    $(TARGET_OUT_SYSTEM_EXT_SHARED_LIBRARIES)/vendor.display.config@2.0.so


# Avb
BOARD_AVB_ENABLE := true
BOARD_AVB_VBMETA_SYSTEM := system
BOARD_AVB_VBMETA_SYSTEM_KEY_PATH := external/avb/test/data/testkey_rsa2048.pem
BOARD_AVB_VBMETA_SYSTEM_ALGORITHM := SHA256_RSA2048
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_VBMETA_SYSTEM_ROLLBACK_INDEX_LOCATION := 1



##### TWRP Flags #####
TW_THEME := portrait_hdpi
TW_EXTRA_LANGUAGES := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
RECOVERY_SDCARD_ON_DATA := true
TARGET_RECOVERY_QCOM_RTC_FIX := true
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := /config/usb_gadget/g1/functions/mass_storage.0/lun.%d/file
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_FB2PNG := true
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1000
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_RESETPROP := true
#TW_NO_SCREEN_BLANK := true
TW_HAS_EDL_MODE := true


# Remove vibration support
TW_NO_HAPTICS := true

# Time
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Battery
TW_USE_LEGACY_BATTERY_SERVICES := true

# Workaround for error copying vendor files to recovery ramdisk
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4

TW_LOAD_VENDOR_MODULES := "awinic_sar.ko \
	moto_f_usbnet.ko \
        synaptics_tcm_i2c.ko \
	chipone_tddi_v2_mmi.ko \
	qpnp_adaptive_charge.ko \
 	synaptics_tcm_recovery.ko\
	exfat.ko \
  	qpnp-amoled-regulator.ko    \
    	synaptics_tcm_reflash.ko\
	ilitek_v3_mmi.ko   \
     	qpnp-pdphy.ko     \
        synaptics_tcm_spi.ko\
	ldo_vibrator_mmi.ko \
    	qpnp-smb5-main.ko        \
        synaptics_tcm_testing.ko\
	mmi_annotate.ko      \
   	sensors_class.ko     \
        synaptics_tcm_touch.ko\
	mmi_info.ko       \
      	sx937x_sar.ko           \
        synaptics_tcm_zeroflash.ko\
	mmi_relay.ko       \
     	synaptics_tcm_core.ko    \
       	utags.ko\
	mmi-smbcharger-iio.ko\
   	synaptics_tcm_device.ko\
	mmi_sys_temp.ko      \
   	synaptics_tcm_diagnostics.ko "      



# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true


# Include decryption support
TW_INCLUDE_CRYPTO := false
RECOVERY_SDCARD_ON_DATA := true
# include below when enabling decryption
# without these it may stuck on TWRP splash
#TARGET_RECOVERY_DEVICE_MODULES += libion
#RECOVERY_LIBRARY_SOURCE_FILES += $(TARGET_OUT_SHARED_LIBRARIES)/libion.so

# Don't mount apex files (no need for now)
TW_EXCLUDE_APEX := false

# Debuging flags
# Debug flags
TWRP_INCLUDE_LOGCAT := true
TARGET_USES_LOGD := true
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/debuggerd
TARGET_RECOVERY_DEVICE_MODULES += strace
RECOVERY_BINARY_SOURCE_FILES += $(TARGET_OUT_EXECUTABLES)/strace
