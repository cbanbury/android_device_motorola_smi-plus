LOCAL_PATH := device/motorola/smi-plus/keylayout
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/intel_short_long_press.kl:system/usr/keylayout/intel_short_long_press.kl \
	$(LOCAL_PATH)/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
	$(LOCAL_PATH)/KEYPAD.kl:system/usr/keylayout/KEYPAD.kl \
	$(LOCAL_PATH)/mrst_keypad.kl:system/usr/keylayout/mrst_keypad.kl \
	$(LOCAL_PATH)/medfield_audio_Intel_R__MID_Audio_Jack.kl:system/usr/keylayout/medfield_audio_Intel_R__MID_Audio_Jack.kl \
	$(LOCAL_PATH)/mxt224_key_0.kl:system/usr/keylayout/mxt224_key_0.kl
