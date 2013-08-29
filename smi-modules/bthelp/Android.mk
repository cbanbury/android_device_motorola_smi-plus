ifeq ($(BOARD_HAVE_BLUETOOTH),true)

LOCAL_PATH := $(call my-dir)

#
# bthelp
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
        bthelp.c

LOCAL_C_INCLUDES:= \
        $(call include-path-for, bluez)/lib \
	$(call include-path-for, bluez)/tools

LOCAL_CFLAGS:= \
	-DSTORAGEDIR=\"/tmp\" \
	-DVERSION=\"4.69\"

ifeq ($(TARGET_BOARD_PLATFORM),omap4)
LOCAL_CFLAGS += -DUSE_TI_ST
else
ifeq ($(BOARD_HAVE_TI12XX),true)
LOCAL_CFLAGS += -DUSE_TI_ST
endif
endif

LOCAL_SHARED_LIBRARIES := \
        libbluetooth libcutils

LOCAL_MODULE:=bthelp

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)


#
# btcmd
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
        btcmd.c

LOCAL_C_INCLUDES:= \
        $(call include-path-for, bluez)/lib \
        $(call include-path-for, bluez)/tools

LOCAL_CFLAGS:= \
        -DSTORAGEDIR=\"/tmp\" \
        -DVERSION=\"4.69\"

LOCAL_SHARED_LIBRARIES := \
        libbluetooth

LOCAL_MODULE:=btcmd

LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)

endif
