# Build full rom
$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)
# And all supported languages
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Load Flytouch 2 device setup
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-flytouch2.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Overrides
PRODUCT_NAME := cyanogen_flytouch2
PRODUCT_BRAND := infotm
PRODUCT_DEVICE := Imapx2x0
PRODUCT_MODEL := Flytouch 2
PRODUCT_MANUFACTURER := Gome
# TODO: why not policy_mid ? What's the differenc?
#PRODUCT_POLICY := android.policy_mid
PRODUCT_POLICY := android.policy_phone
# Build kernel - disabled for now, it doesn't boot.
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-infotmic
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=7901_defconfig
# Do not build wifi modules - it breaks the cyanogen build because
# build/core/kernel.mk assumes there's only one *.ko file in 
# kernel/drivers/net/wireless/*/*.ko.
# TODO: Fix this by integrating building rt2070sta.ko in the kernel and
#       disabling all the other modules, and/or submitting a patch to cyanogen
#       to fix the silly makefile.
PRODUCT_SPECIFIC_DEFINES += TARGET_NO_BUILD_WIFI=true
# In fact, disable module building altogether for now, we depend on at least
# galcore.ko anyway.
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILD_MODULES=true

# Enable Windows Media
WITH_WINDOWS_MEDIA := true

# Include some extra apps
PRODUCT_PACKAGES += \
	Torch \
	TSCalibration

# Extra glacier overlay
#PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/glacier


# override some properites.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160 \
	wifi.supplicant_scan_interval=120

#
# Set ro.modversion
#
ifdef CYANOGEN_NIGHTLY
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6-$(shell date +%m%d%Y)-NIGHTLY-glacier
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=CyanogenMod-6.1.0-RC1-glacier
endif

#
# Copy specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
