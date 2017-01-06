USE_CAMERA_STUB := true

# inherit from the proprietary version
-include vendor/orbis/orbis/BoardConfigVendor.mk

# Architecture
TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := mt6582
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := orbis

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Partition sizes
		
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 60293120			
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_USE_EXT4 := true

BOARD_CUSTOM_BOOTIMG := true
BOARD_CUSTOM_MKBOOTIMG := $(HOST_OUT_EXECUTABLES)/mtkbootimg$(HOST_EXECUTABLE_SUFFIX)
BOARD_CUSTOM_BOOTIMG_MK := device/orbis/orbis/bootimg.mk
BOARD_MKBOOTIMG_ARGS := --mtk 1

TARGET_PREBUILT_KERNEL := device/orbis/orbis/prebuilt/kernel
TARGET_RECOVERY_INITRC := device/orbis/orbis/recovery/init.mt6582.rc
TARGET_RECOVERY_FSTAB := device/orbis/orbis/recovery/recovery.fstab

DEVICE_SCREEN_WIDTH := 480
DEVICE_SCREEN_HEIGHT := 800


BOARD_HAS_NO_SELECT_BUTTON := true

RECOVERY_VARIANT := twrp
#RECOVERY_VARIANT := philz
#RECOVERY_VARIANT := carliv

ifneq ($(RECOVERY_VARIANT),carliv)
TARGET_RECOVERY_FSTAB := device/orbis/orbis/recovery/recovery.fstab
endif


# CARLIV
ifeq ($(RECOVERY_VARIANT),carliv)
BOARD_HAS_MTK := true
BOARD_NEEDS_MTK_GETSIZE := true
DEVICE_RESOLUTION := 480x800
endif


# PHILZ
ifeq ($(RECOVERY_VARIANT),philz)
TARGET_COMMON_NAME := orbis orbis
BOARD_USE_MTK_LAYOUT := true
BOARD_MTK_BOOT_LABEL := "/bootimg"
BOARD_USE_NTFS_3G := false
BRIGHTNESS_SYS_FILE := "/sys/class/leds/lcd-backlight/brightness"
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0/gadget/lun%d/file"
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
endif

# TWRP
ifeq ($(RECOVERY_VARIANT),twrp)
TW_NO_EXFAT := true
TWHAVE_SELINUX := true
TW_THEME := portrait_mdpi
TW_NO_EXFAT_FUSE := true
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/platform/mt_usb/musb-hdrc.0/gadget/lun%d/file"
TW_EXCLUDE_SUPERSU := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
DEVICE_RESOLUTION := 480x800
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TWHAVE_TOOLBOX := true
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
endif
