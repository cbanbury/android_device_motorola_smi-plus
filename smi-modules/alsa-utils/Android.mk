
ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)
ifeq ($(strip $(BUILD_WITH_ALSA_UTILS)),true)

LOCAL_PATH:= $(call my-dir)

#
# Build aplay command
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-fPIC -D_POSIX_SOURCE \
	-DALSA_CONFIG_DIR=\"/system/usr/share/alsa\" \
	-DALSA_PLUGIN_DIR=\"/system/usr/lib/alsa-lib\" \
	-DALSA_DEVICE_DIRECTORY=\"/dev/snd/\"

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/android \
	../alsa-lib/include

LOCAL_SRC_FILES := \
	aplay/aplay.c

LOCAL_MODULE_TAGS := debug
LOCAL_MODULE := alsa_aplay

LOCAL_SHARED_LIBRARIES := \
        libasound \
	libc

include $(BUILD_EXECUTABLE)

#
# Build alsactl command
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-fPIC -D_POSIX_SOURCE \
	-DALSA_CONFIG_DIR=\"/system/usr/share/alsa\" \
	-DALSA_PLUGIN_DIR=\"/system/usr/lib/alsa-lib\" \
	-DALSA_DEVICE_DIRECTORY=\"/dev/snd/\"

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/android \
	../alsa-lib/include

LOCAL_SRC_FILES := \
	alsactl/alsactl.c \
	alsactl/init_parse.c \
	alsactl/state.c \
	alsactl/utils.c

LOCAL_MODULE_TAGS := debug
LOCAL_MODULE := alsa_ctl

LOCAL_SHARED_LIBRARIES := \
        libasound \
	libc

include $(BUILD_EXECUTABLE)

#
# Build amixer command
#

include $(CLEAR_VARS)

LOCAL_CFLAGS := \
	-fPIC -D_POSIX_SOURCE \
	-DALSA_CONFIG_DIR=\"/system/usr/share/alsa\" \
	-DALSA_PLUGIN_DIR=\"/system/usr/lib/alsa-lib\" \
	-DALSA_DEVICE_DIRECTORY=\"/dev/snd/\"

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/include \
	$(LOCAL_PATH)/android \
	../alsa-lib/include

LOCAL_SRC_FILES := \
	amixer/amixer.c

LOCAL_MODULE_TAGS := debug
LOCAL_MODULE := alsa_amixer

LOCAL_SHARED_LIBRARIES := \
        libasound \
	libc

include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

ALSAINIT_DIR := $(TARGET_OUT)/usr/share/alsa/init

#$(info WARNING: PRODUCT_COPY_FILES disabled in $(LOCAL_PATH))
#PRODUCT_COPY_FILES += \
#        $(LOCAL_PATH)/alsactl/init/00main:system/usr/share/alsa/init/00main \
#        $(LOCAL_PATH)/alsactl/init/default:system/usr/share/alsa/init/default \
#        $(LOCAL_PATH)/alsactl/init/hda:system/usr/share/alsa/init/hda \
#        $(LOCAL_PATH)/alsactl/init/help:system/usr/share/alsa/init/help \
#        $(LOCAL_PATH)/alsactl/init/info:system/usr/share/alsa/init/info \
#        $(LOCAL_PATH)/alsactl/init/test:system/usr/share/alsa/init/test

endif
endif
