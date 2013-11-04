# hardware/libaudio-alsa/Android.mk
#
# Copyright 2008 Wind River Systems
#

ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)

LOCAL_PATH := hardware/qcom/audio/alsa_sound

include $(CLEAR_VARS)

LOCAL_ARM_MODE := arm
LOCAL_CFLAGS := -D_POSIX_SOURCE
LOCAL_CFLAGS += -DQCOM_CSDCLIENT_ENABLED
LOCAL_CFLAGS += -DQCOM_ACDB_ENABLED

ifeq ($(strip $(BOARD_USES_FLUENCE_INCALL)),true)
LOCAL_CFLAGS += -DUSES_FLUENCE_INCALL
endif

ifeq ($(strip $(BOARD_USES_SEPERATED_AUDIO_INPUT)),true)
LOCAL_CFLAGS += -DSEPERATED_AUDIO_INPUT
endif

LOCAL_SRC_FILES := \
  $(LOCAL_PATH)/AudioHardwareALSA.cpp 	\
  $(LOCAL_PATH)/AudioStreamOutALSA.cpp 	\
  $(LOCAL_PATH)/AudioStreamInALSA.cpp 	\
  $(LOCAL_PATH)/ALSAStreamOps.cpp		\
  $(LOCAL_PATH)/audio_hw_hal.cpp \
  $(LOCAL_PATH)/AudioUsbALSA.cpp \
  $(LOCAL_PATH)/AudioUtil.cpp

LOCAL_STATIC_LIBRARIES := \
    libmedia_helper \
    libaudiohw_legacy \
    libaudiopolicy_legacy \

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia \
    libhardware \
    libc        \
    libpower    \
    libalsa-intf

LOCAL_SHARED_LIBRARIES += libdl

LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/audio-alsa
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/libalsa-intf
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/surround_sound/
LOCAL_C_INCLUDES += hardware/libhardware/include
LOCAL_C_INCLUDES += hardware/libhardware_legacy/include
LOCAL_C_INCLUDES += frameworks/base/include
LOCAL_C_INCLUDES += system/core/include


LOCAL_MODULE := audio.primary.smi
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

ifeq (1,0) # use default audio policy manager
# This is the ALSA audio policy manager

include $(CLEAR_VARS)

LOCAL_CFLAGS := -D_POSIX_SOURCE
LOCAL_CFLAGS += -DQCOM_ACDB_ENABLED

ifeq ($(BOARD_HAVE_BLUETOOTH),true)
  LOCAL_CFLAGS += -DWITH_A2DP
endif

LOCAL_SRC_FILES := \
    $(LOCAL_PATH)/audio_policy_hal.cpp \
    $(LOCAL_PATH)/AudioPolicyManagerALSA.cpp

LOCAL_MODULE := audio_policy.smi
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional

LOCAL_STATIC_LIBRARIES := \
    libmedia_helper \
    libaudiohw_legacy \
    libaudiopolicy_legacy

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    libutils \
    libmedia

LOCAL_C_INCLUDES += hardware/libhardware_legacy/audio

include $(BUILD_SHARED_LIBRARY)
endif

# This is the ALSA module which behaves closely like the original

include $(CLEAR_VARS)

LOCAL_PRELINK_MODULE := false

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

LOCAL_CFLAGS := -D_POSIX_SOURCE -Wno-multichar
LOCAL_CFLAGS += -DQCOM_ACDB_ENABLED

ifeq ($(strip $(BOARD_USES_FLUENCE_INCALL)),true)
LOCAL_CFLAGS += -DUSES_FLUENCE_INCALL
endif

ifeq ($(strip $(BOARD_USES_SEPERATED_AUDIO_INPUT)),true)
LOCAL_CFLAGS += -DSEPERATED_AUDIO_INPUT
endif

LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/mm-audio/libalsa-intf

LOCAL_SRC_FILES:= \
    $(LOCAL_PATH)/alsa_default.cpp \
    $(LOCAL_PATH)/ALSAControl.cpp \
    $(LOCAL_PATH)/AudioUtil.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils \
    liblog    \
    libalsa-intf

LOCAL_SHARED_LIBRARIES += libdl

LOCAL_MODULE:= alsa.smi
LOCAL_MODULE_TAGS := optional

  include $(BUILD_SHARED_LIBRARY)
endif
