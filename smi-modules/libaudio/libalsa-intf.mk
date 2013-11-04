LOCAL_PATH:= hardware/qcom/audio/libalsa-intf

ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)
# Any prebuilt files with default TAGS can use the below:

include $(CLEAR_VARS)
#LOCAL_SRC_FILES:= aplay.c alsa_pcm.c alsa_mixer.c
LOCAL_SRC_FILES:= $(LOCAL_PATH)/aplay.c
LOCAL_MODULE:= aplay
LOCAL_SHARED_LIBRARIES:= libc libcutils libalsa-intf
LOCAL_MODULE_TAGS:= debug
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
#LOCAL_SRC_FILES:= arec.c alsa_pcm.c
LOCAL_SRC_FILES:= $(LOCAL_PATH)/arec.c
LOCAL_MODULE:= arec
LOCAL_SHARED_LIBRARIES:= libc libcutils libalsa-intf
LOCAL_MODULE_TAGS:= debug
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(LOCAL_PATH)/amix.c
LOCAL_MODULE:= amix
LOCAL_SHARED_LIBRARIES := libc libcutils libalsa-intf
LOCAL_MODULE_TAGS:= debug
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_SRC_FILES:= $(LOCAL_PATH)/alsaucm_test.c
LOCAL_MODULE:= alsaucm_test
LOCAL_SHARED_LIBRARIES:= libc libcutils libalsa-intf
LOCAL_MODULE_TAGS:= debug
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)
LOCAL_COPY_HEADERS_TO   := mm-audio/libalsa-intf
LOCAL_COPY_HEADERS      := $(LOCAL_PATH)/alsa_audio.h
LOCAL_COPY_HEADERS      += $(LOCAL_PATH)/alsa_ucm.h
LOCAL_COPY_HEADERS      += $(LOCAL_PATH)/msm8960_use_cases.h
LOCAL_SRC_FILES:= $(LOCAL_PATH)/alsa_mixer.c $(LOCAL_PATH)/alsa_pcm.c $(LOCAL_PATH)/alsa_ucm.c
LOCAL_MODULE:= libalsa-intf
LOCAL_MODULE_TAGS := optional
LOCAL_SHARED_LIBRARIES:= libc libcutils #libutils #libmedia libhardware_legacy
LOCAL_CFLAGS := -DQC_PROP -DCONFIG_DIR=\"/system/etc/snd_soc_msm/\"

LOCAL_SHARED_LIBRARIES += libdl
LOCAL_PRELINK_MODULE := false
include $(BUILD_SHARED_LIBRARY)
endif
