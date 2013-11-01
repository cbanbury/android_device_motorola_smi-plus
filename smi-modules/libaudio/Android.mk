ifeq ($(strip $(BOARD_USES_ALSA_AUDIO)),true)

AUDIO_HW_ROOT := $(call my-dir)

include $(AUDIO_HW_ROOT)/alsa_sound.mk
include $(AUDIO_HW_ROOT)/libalsa-intf.mk

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.smi \
    audio.primary.smi \
    audio.r_submix.default \
    alsa.smi \
    libalsa-intf \
    libaudio-resampler \
    libaudioutils \
    aplay \
    amix \
    arec \
    alsaucm_test \
    libbluetooth-audio \
    libasound_module_pcm_voice \
    libasound_module_ctl_voice \
    audio.hdmi.smi
endif

