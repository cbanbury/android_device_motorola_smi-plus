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

# HAL
PRODUCT_PACKAGES += \
    gralloc.default \
    fm.smi \
    nfc.sc1 \
    power.sc1
#    hwcomposer.smi \
#    camera.sc1 \
#    power.smi

# Motorola
PRODUCT_PACKAGES += \
    aplogd \
    modemlog \
    batt_health \
    charge_only_mode \
    mot_boot_mode

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
    bd_prov

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
    libwbxmlparser \
    libnl

$(call inherit-product, $(DEVICE_FOLDER)/keychars/keychars.mk)
$(call inherit-product, $(DEVICE_FOLDER)/keylayout/keylayout.mk)
$(call inherit-product, $(DEVICE_FOLDER)/smi-modules/nfc/nfc.mk)
$(call inherit-product, $(DEVICE_FOLDER)/smi-modules/fm_module/fmradio.mk)
$(call inherit-product, $(DEVICE_FOLDER)/smi-modules/libaudio/alsa.mk)
