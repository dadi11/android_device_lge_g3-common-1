#
# Copyright (C) 2016 The PacRom Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from the proprietary version
-include vendor/lge/g3-common/BoardConfigVendor.mk

LOCAL_PATH := device/lge/g3-common

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

# Platform
TARGET_BOARD_PLATFORM := msm8974
TARGET_BOARD_PLATFORM_GPU := qcom-adreno330
USE_CLANG_PLATFORM_BUILD := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := krait

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8974
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Kernel
BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_BOOTIMG_MK := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_CMDLINE := console=none androidboot.hardware=g3 user_debug=31 msm_rtb.filter=0x0 androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_SEPARATED_DT := true
BOARD_MKBOOTIMG_ARGS := --kernel_offset 0x0008000 --ramdisk_offset 0x2000000
TARGET_KERNEL_SOURCE := kernel/lge/g3

ifeq ($(filter d852, $(TARGET_DEVICE)),)
TARGET_KERNEL_CROSS_COMPILE_PREFIX := arm-linux-androideabi-
endif

# Audio
BOARD_USES_ALSA_AUDIO := true
USE_CUSTOM_AUDIO_POLICY := 1

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
USE_DEVICE_SPECIFIC_CAMERA := true
TARGET_USE_COMPAT_GRALLOC_ALIGN := true
COMMON_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
COMMON_GLOBAL_CFLAGS += -DLG_CAMERA_HARDWARE
COMMON_GLOBAL_CFLAGS += -DPROPERTY_PERMS_APPEND=' \
    { "persist.data.sensor_name", AID_CAMERA, 0 }, \
    { "camera.4k2k.enable", AID_MEDIA, 0 }, \
    { "persist.data.rear.minfps", AID_MEDIA, 0 }, \
    { "persist.data.front.minfps", AID_MEDIA, 0 }, \
    '

# CMHW
BOARD_HARDWARE_CLASS := $(LOCAL_PATH)/cmhw/
TARGET_TAP_TO_WAKE_NODE := "/sys/devices/virtual/input/lge_touch/tap_to_wake"

# Enable dex-preoptimization to speed up first boot sequence
 ifeq ($(HOST_OS),linux)
   ifeq ($(TARGET_BUILD_VARIANT),user)
     ifeq ($(WITH_DEXPREOPT),)
       WITH_DEXPREOPT := true
     endif
   endif
 endif
 DONT_DEXPREOPT_PREBUILTS := true
 WITH_DEXPREOPT_BOOT_IMG_ONLY := true

# Crypto
#TARGET_HW_DISK_ENCRYPTION := true

# Display
MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so
TARGET_USES_C2D_COMPOSITION := true
TARGET_USES_ION := true
USE_OPENGL_RENDERER := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Offmode Charging
BOARD_HEALTHD_CUSTOM_CHARGER_RES := $(LOCAL_PATH)/charger/images
COMMON_GLOBAL_CFLAGS += \
    -DBOARD_CHARGING_CMDLINE_NAME='"androidboot.mode"' \
    -DBOARD_CHARGING_CMDLINE_VALUE='"chargerlogo"'

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_CACHEIMAGE_PARTITION_SIZE := 889192448
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Power
TARGET_POWERHAL_VARIANT := qcom

# RIL
BOARD_RIL_CLASS += ../../../device/lge/g3-common/ril

# Qualcomm support
BOARD_USES_QCOM_HARDWARE := true

# Recovery
#COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_RECOVERY_SWIPE := true

# Edited for TWRP Recovery
#TW_NEVER_UMOUNT_SYSTEM := true
#TW_INCLUDE_NTFS_3G := true
#TWRP_INCLUDE_LOGCAT := true
#BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
#RECOVERY_SDCARD_ON_DATA := true
#BOARD_HAS_NO_SELECT_BUTTON := true
#TW_HAS_DOWNLOAD_MODE := true
#BOARD_HAS_LARGE_FILESYSTEM := true
DEVICE_RESOLUTION := 1440x2560
#TARGET_RECOVERY_QCOM_RTC_FIX := true
#BOARD_SUPPRESS_SECURE_ERASE := true
#BOARD_SUPPRESS_EMMC_WIPE := true
TW_THEME := portrait_hdpi
#TW_EXTRA_LANGUAGES := true
#TW_DEFAULT_EXTERNAL_STORAGE := true
#TW_INCLUDE_JB_CRYPTO := true
#TW_INCLUDE_L_CRYPTO := true
#TW_INCLUDE_CRYPTO := true
TW_BRIGHTNESS_PATH := "/sys/devices/mdp.0/qcom\x2cmdss_fb_primary.175/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 175
#TARGET_USES_LOGD := true
#TW_SCREEN_BLANK_ON_BOOT := true
#TW_EXCLUDE_SUPERSU := true
#TWHAVE_SELINUX := true
#TARGET_USES_QCOM_BSP := true
#GET_USE_QCOM_BIONIC_OPTIMIZATION := true
#COMMON_GLOBAL_CFLAGS += -DQCOM_BSP
#TW_FLASH_FROM_STORAGE := true
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/msm_sdcc.1/by-name/userdata"
#TW_CRYPTO_MNT_POINT := "/data"
#TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,barrier=1,noauto_da_alloc,discard"
#TW_CRYPTO_FS_FLAGS := "0x00000406"
#TW_CRYPTO_KEY_LOC := "footer"
#TW_INCLUDE_FUSE_EXFAT := true
#TW_INTERNAL_STORAGE_PATH := "/data/media"
#TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
#TW_EXTERNAL_STORAGE_PATH := "/external_sd"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
#TW_EXTERNAL_STORAGE_PATH := "/usb-otg"
#TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"

# SELinux
include device/qcom/sepolicy/sepolicy.mk
BOARD_SEPOLICY_DIRS += device/lge/g3-common/sepolicy

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# Enable Minikin text layout engine
USE_MINIKIN := true
