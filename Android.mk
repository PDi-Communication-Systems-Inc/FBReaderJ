LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(call all-java-files-under, fbreader/app/src)
LOCAL_SRC_FILES += $(call all-java-files-under, third-party/AmbilWarna/src)
LOCAL_SRC_FILES += $(call all-java-files-under, third-party/android-filechooser/code/src)
LOCAL_SRC_FILES += $(call all-java-files-under, third-party/SuperToasts/src)
LOCAL_SRC_FILES += $(call all-java-files-under, third-party/drag-sort-listview/library/src)

LOCAL_PACKAGE_NAME := fbreaderJ
LOCAL_MODULE_TAGS := optional
LOCAL_CERTIFICATE := platform

LOCAL_AIDL_INCLUDES := fbreader/app/src/main/java/org/geometerplus/android/fbreader/network \
		       fbreader/app/src/main/java/org/geometerplus/android/fbreader/httpd \
		       fbreader/app/src/main/java/org/eometerplus/android/fbreader/formatPlugin \
		       fbreader/app/src/main/java/org/geometerplus/android/fbreader/config \
		       fbreader/app/src/main/java/org/geometerplus/android/fbreader/libraryService \
		       fbreader/app/src/main/java/org/geometerplus/android/fbreader/api \
		       fbreader/app/src/main/java/org/geometerplus/android/fbreader/api/ApiObject.aidl

LOCAL_SRC_FILES +=     fbreader/app/src/main/java/org/geometerplus/android/fbreader/api/ApiInterface.aidl \
		       fbreader/app/src/main/java/org/geometerplus/android/fbreader/network/BookDownloaderInterface.aidl \
                       fbreader/app/src/main/java/org/geometerplus/android/fbreader/httpd/DataInterface.aidl \
		       fbreader/app/src/main/java/org/geometerplus/android/fbreader/config/ConfigInterface.aidl \
                       fbreader/app/src/main/java/org/geometerplus/android/fbreader/formatPlugin/CoverReader.aidl \
                       fbreader/app/src/main/java/org/geometerplus/android/fbreader/libraryService/LibraryInterface.aidl 


$(info source files are $(LOCAL_SRC_FILES))

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res
LOCAL_RESOURCE_DIR += $(LOCAL_PATH)/third-party/AmbilWarna/res
LOCAL_RESOURCE_DIR += $(LOCAL_PATH)/third-party/android-filechooser/code/res
LOCAL_RESOURCE_DIR += $(LOCAL_PATH)/third-party/SuperToasts/res
LOCAL_RESOURCE_DIR += $(LOCAL_PATH)/third-party/drag-sort-listview/library/res

#$(info res dirs $(LOCAL_RESOURCE_DIR))

LOCAL_STATIC_JAVA_LIBRARIES := android-support-v4 httpmime json-simple \
			       LingvoIntegration nanohttpd open-dictionary \
			       pdfparse

LOCAL_AAPT_FLAGS := --generate-dependencies --auto-add-overlay --extra-packages com.mobeta.android.dslv \
                    --extra-packages yuku.ambilwarna \
                    --extra-packages com.github.johnpersano.supertoasts \
                    --extra-packages org.geometerplus.zlibrary.ui.android \
                    --extra-packages group.pals.android.lib.ui.filechooser

include $(BUILD_PACKAGE)

LOCAL_PREBUILT_STATIC_JAVA_LIBRARIES := httpmime:libs/httpmime-4.2.5.jar \
					json-simple:libs/json-simple-1.1.1.jar \
					LingvoIntegration:libs/LingvoIntegration_2.5.2.12.jar \
					nanohttpd:libs/nanohttpd-2.0.5.jar \
					open-dictionary:libs/open-dictionary-api-1.2.1.jar \
					pdfparse:libs/pdfparse.jar

include $(BUILD_MULTI_PREBUILT)

