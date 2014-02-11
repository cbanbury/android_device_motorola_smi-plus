ifeq ($(BOARD_USES_ALSA_AUDIO),true)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_CFLAGS := -D_POSIX_SOURCE -Wno-multichar

LOCAL_C_INCLUDES += \
    	$(LOCAL_PATH)/../alsa-lib/include \
    	$(LOCAL_PATH)/../alsa_sound \

LOCAL_SRC_FILES:= \
	alsa_mfld_cdk.cpp \

LOCAL_SHARED_LIBRARIES := \
	libaudio \
  	libasound \
  	liblog \
	libcutils \
	libutils \
	libdl

LOCAL_MODULE:= alsa.$(TARGET_DEVICE)
LOCAL_MODULE_TAGS := optional

LOCAL_LDFLAGS := -Wl,-z,norelro 

include $(BUILD_SHARED_LIBRARY)
include $(CLEAR_VARS)

LOCAL_MODULE := audio.primary.$(TARGET_BOOTLOADER_BOARD_NAME)
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia \
    libhardware_legacy

LOCAL_SHARED_LIBRARIES += libdl

LOCAL_SHARED_LIBRARIES += libaudio


LOCAL_STATIC_LIBRARIES := \
    libmedia_helper

LOCAL_WHOLE_STATIC_LIBRARIES := \
    libaudiohw_legacy

include $(BUILD_SHARED_LIBRARY)
endif
