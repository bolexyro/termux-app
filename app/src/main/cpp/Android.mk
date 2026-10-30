LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
LOCAL_MODULE := libtermux-bootstrap
LOCAL_SRC_FILES := termux-bootstrap-zip.S termux-bootstrap.c
# The bootstrap archive is embedded through .incbin, which ndk-build does not
# infer as a dependency from termux-bootstrap-zip.S. Keep the native library in
# sync when the development-package bootstrap patch rewrites these archives.
LOCAL_ADDITIONAL_DEPENDENCIES := $(wildcard $(LOCAL_PATH)/bootstrap-*.zip)
include $(BUILD_SHARED_LIBRARY)
