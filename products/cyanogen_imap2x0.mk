$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Inherit Infotmic Media Extensions.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-MediaExtensions.mk)
# Inherit Infotmic OpenGL ES. (Vivante)
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-OpenGLES.mk)
# Inherit Wifi extensions.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-Wifi.mk)
# include GPS.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-gps.mk)
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-Board-generic.mk)
# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cyanogen/products/common.mk)

# Overrides
PRODUCT_NAME := cyanogen_imap2x0
PRODUCT_DEVICE := Imapx2x0
PRODUCT_MODEL := Generic_Imap
PRODUCT_MANUFACTURER := infotm
#PRODUCT_POLICY := android.policy_mid
PRODUCT_POLICY := android.policy_phone
# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=cyanogen_glacier_defconfig

# Enable Windows Media
WITH_WINDOWS_MEDIA := true

# Include the Torch app
PRODUCT_PACKAGES += Torch

# Extra glacier overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/cyanogen/overlay/glacier


# set Infotmic Properites.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.manufacturer=infotm ro.board.platform=imap210
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
# Inherit Infotmic Media Extensions.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-MediaExtensions.mk)
# Inherit Infotmic OpenGL ES. (Vivante)
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-OpenGLES.mk)
# Inherit Wifi extensions.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-Wifi.mk)
# include GPS.
$(call inherit-product, device/infotm/Imapx2x0/Infotmic-gps.mk)
#
# Copy passion specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip
