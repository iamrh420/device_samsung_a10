COMMON_PATH := device/samsung/universal7885-common

BOARD_VENDOR := samsung

# Platform
ifeq ($(TARGET_DEVICE), $(filter $(TARGET_DEVICE),a10 a20 a20e))
TARGET_SOC := exynos7884B
TARGET_BOARD_PLATFORM := universal7884B
TARGET_BOOTLOADER_BOARD_NAME := universal7884B
else ifeq ($(TARGET_DEVICE), $(filter $(TARGET_DEVICE),a30 a40))
TARGET_SOC := exynos7904
TARGET_BOARD_PLATFORM := universal7904
TARGET_BOOTLOADER_BOARD_NAME := universal7904
endif

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(COMMON_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH_SLSI := true

# Build system
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_VINTF_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true
BUILD_BROKEN_ENFORCE_SYSPROP_OWNER := true

# Display
TARGET_SCREEN_DENSITY := 280
TARGET_USES_VULKAN := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Fingerprint
TARGET_SEC_FP_HAS_FINGERPRINT_GESTURES := true

# Init
TARGET_INIT_VENDOR_LIB := //$(COMMON_PATH):libinit_universal7885

# Kernel
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE := androidboot.init_fatal_reboot_target=recovery
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x00008000 --ramdisk_offset 0x01000000 --tags_offset 0x00000100
TARGET_KERNEL_SOURCE := kernel/samsung/exynos7885
TARGET_KERNEL_CLANG_COMPILE := true

# Keymaster
TARGET_KEYMASTER_VARIANT := samsung

# HIDL
include device/samsung/universal7885-common/configs/vintf/manifest.mk

# LMKD stats logging
TARGET_LMKD_STATS_LOG := true

# Partitions
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072

# Properties
include device/samsung/universal7885-common/configs/props/props.mk

# Recovery
BOARD_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_FSTAB := $(COMMON_PATH)/recovery/recovery.fstab

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Sepolicy
SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    $(COMMON_PATH)/sepolicy/public
    
BOARD_VENDOR_SEPOLICY_DIRS += \
    $(COMMON_PATH)/sepolicy/vendor

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(COMMON_PATH)/sepolicy/private
    
# Vendor
TARGET_COPY_OUT_VENDOR := vendor
VENDOR_SECURITY_PATCH := 2021-11-05

# Wifi
BOARD_WLAN_DEVICE                := slsi
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
