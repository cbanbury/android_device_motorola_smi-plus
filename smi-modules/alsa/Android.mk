ifeq ($(BOARD_USES_ALSA_AUDIO),true)

LOCAL_PATH := $(call my-dir)

  include $(CLEAR_VARS)

  LOCAL_PRELINK_MODULE := false

  LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw

  LOCAL_CFLAGS := -D_POSIX_SOURCE -Wno-multichar

ifneq ($(ALSA_DEFAULT_SAMPLE_RATE),)
    LOCAL_CFLAGS += -DALSA_DEFAULT_SAMPLE_RATE=$(ALSA_DEFAULT_SAMPLE_RATE)
endif

ifeq ($(FM_RADIO_RX_ANALOG),true)
  LOCAL_CFLAGS += -DFM_RX_ANALOG
endif

ifeq ($(USE_INTEL_HDMI), true)
  LOCAL_CFLAGS += -DUSE_INTEL_HDMI=1
endif

  LOCAL_C_INCLUDES += \
    	external/alsa-lib/include \
    	hardware/alsa_sound \
    	$(TARGET_OUT_HEADERS)/hw \
    	$(TARGET_OUT_HEADERS)/alsa \
    	$(TARGET_OUT_HEADERS)/vpc

ifeq ($(BOARD_HAVE_AUDIENCE),true)
    LOCAL_CFLAGS += -DCUSTOM_BOARD_WITH_AUDIENCE
endif


  LOCAL_SRC_FILES:= \
	alsa_mfld_cdk.cpp \

  LOCAL_SHARED_LIBRARIES := \
  	libasound \
  	liblog


  LOCAL_MODULE:= alsa.$(TARGET_DEVICE)
  LOCAL_MODULE_TAGS := optional

  include $(BUILD_SHARED_LIBRARY)
endif
