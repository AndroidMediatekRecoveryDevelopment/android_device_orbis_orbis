## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := orbis

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/orbis/orbis/device_orbis.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := orbis
PRODUCT_NAME := cm_orbis
PRODUCT_BRAND := orbis
PRODUCT_MODEL := orbis
PRODUCT_MANUFACTURER := orbis
