DEVICE_FOLDER := device/motorola/smi-plus

# overlays
TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_FOLDER)/include

# Prebuilt files for arm support
LIB_ARM_FILES := $(wildcard $(DEVICE_FOLDER)/prebuilt/arm-binaries/*.so)

# Copying grouped files
	$(foreach i, $(LIB_ARM_FILES), $(i):system/lib/arm/$(notdir $(i))) \

# Houdini related files
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilt/arm-binaries/linker:system/lib/arm/linker \
	$(LOCAL_PATH)/prebuilt/libdvm_houdini.so:system/lib/libdvm_houdini.so # Used for houdini hooks in dvm, nativejni, javacore; no source available for houdini_hook.a

# Media and Alsa Conf
LOCAL_ALSA_CONF_DIR  := $(LOCAL_PATH)/smi-modules/alsa-lib/src/conf
PRODUCT_COPY_FILES += \
        $(LOCAL_ALSA_CONF_DIR)/alsa.conf:system/usr/share/alsa/alsa.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
        $(LOCAL_ALSA_CONF_DIR)/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
        $(LOCAL_ALSA_CONF_DIR)/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    $(DEVICE_FOLDER)/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# Audio
    libbluetooth-audio \
    libasound_module_pcm_voice \
    libasound_module_ctl_voice \
    alsa.smi \
    audio.hdmi.smi \
#    audio_policy.smi \
#    audio.primary.smi \
#    audio.a2dp.default \

# HAL
PRODUCT_PACKAGES += \
    gralloc.default \
    fm.smi
#    hwcomposer.smi \
#    camera.sc1 \
#    power.smi

# Motorola
PRODUCT_PACKAGES += \
    aplogd \
    modemlog \
    batt_health \
    charge_only_mode
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
