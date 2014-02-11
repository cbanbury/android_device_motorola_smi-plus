DEVICE_FOLDER := device/motorola/smi-plus

# overlays
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_FOLDER)/include

# Prebuilt files for arm support
LIB_ARM_FILES := $(wildcard $(DEVICE_FOLDER)/prebuilt/arm-binaries/*.so)

# Copying grouped files
PRODUCT_COPY_FILES += \
	$(foreach i, $(LIB_ARM_FILES), $(i):system/lib/arm/$(notdir $(i))) \

# Houdini related files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/arm-binaries/linker:system/lib/arm/linker \
	$(LOCAL_PATH)/prebuilt/libdvm_houdini.so:system/lib/libdvm_houdini.so # Used for houdini hooks in dvm, nativejni, javacore; no source available for houdini_hook.a

# Media and Alsa Conf
ALSA_PATH := $(DEVICE_FOLDER)/smi-modules/alsa-lib/src
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_FOLDER)/prebuilt/media_codecs.xml:system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/prebuilt/asound.conf:system/etc/asound.conf \
    $(ALSA_PATH)/conf/alsa.conf:system/usr/share/alsa/alsa.conf \
    $(ALSA_PATH)/conf/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    $(ALSA_PATH)/conf/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    $(ALSA_PATH)/conf/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    $(ALSA_PATH)/conf/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    $(ALSA_PATH)/conf/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    $(ALSA_PATH)/conf/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    $(ALSA_PATH)/conf/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    $(ALSA_PATH)/conf/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    $(ALSA_PATH)/conf/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    $(ALSA_PATH)/conf/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    $(ALSA_PATH)/conf/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    $(ALSA_PATH)/conf/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    $(ALSA_PATH)/conf/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    $(ALSA_PATH)/conf/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
    $(ALSA_PATH)/conf/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    $(ALSA_PATH)/conf/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf

# HAL
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/vendor/lib/hw/gralloc.sc1.so:system/vendor/lib/hw/gralloc.sc1.so \
	$(LOCAL_PATH)/prebuilt/lib/hw/lights.sc1.so:system/lib/hw/lights.sc1.so

PRODUCT_PACKAGES += \
    gralloc.default \
    fm.smi \
    nfc.sc1 \
    power.sc1
#    hwcomposer.smi \
#    camera.sc1 \
#    power.smi

# Mfld/Intel specific modules
PRODUCT_PACKAGES += \
    libproperty \
    libevent-listener \
    libpci \
    libdrm \
    libat-parser \
    libtty-handler \
    libpci_static \
    libenc \

# Bluetooth
PRODUCT_PACKAGES += \
    bthelp \
    btcmd \
    bd_prov \
    libbluetooth-audio

# Glib tools
PRODUCT_PACKAGES += \
    libglib-2.0 \
    libgmodule-2.0 \
    libgobject-2.0 \
    libgthread-2.0 \
    mainloop-test \
    array-test

# DNS Conf Daemon
PRODUCT_PACKAGES += \
    rdnssd

# Misc Packages
PRODUCT_PACKAGES += \
    libwbxmlparser

$(call inherit-product, $(DEVICE_FOLDER)/keylayout/keylayout.mk)
$(call inherit-product, $(DEVICE_FOLDER)/smi-modules/nfc/nfc.mk)
$(call inherit-product, $(DEVICE_FOLDER)/smi-modules/fm_module/fmradio.mk)
