ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)
LOCAL_PATH := $(call my-dir)
##
## Copy ALSA configuration files to rootfs
##
TARGET_ALSA_CONF_DIR := $(TARGET_OUT)/usr/share/alsa
LOCAL_ALSA_CONF_DIR  := $(LOCAL_PATH)/src/conf

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
        $(LOCAL_ALSA_CONF_DIR)/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf
endif
