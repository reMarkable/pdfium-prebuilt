win32 {
    LIBS += -L$$PWD/win32precompiled
} else:macx {
    LIBS += -L$$PWD/macosxprecompiled
} else:android {
    equals(ANDROID_TARGET_ARCH, armeabi-v7a) {
        LIBS += -L$$PWD/androidprecompiled/arm_32
    }
    equals(ANDROID_TARGET_ARCH, arm64-v8a) {
        LIBS += -L$$PWD/androidprecompiled/arm_64
    }
    equals(ANDROID_TARGET_ARCH, x86){
        LIBS += -L$$PWD/androidprecompiled/x86
    }
} else {
    DEFINES += _FX_OS_=_FX_LINUX_DESKTOP_
    DEFINES += _FXM_PLATFORM_=_FXM_PLATFORM_LINUX_
    LIBS += -L$$PWD/linuxprecompiled
    # On Linux pdfium needs to explicitly link zlib
    LIBS += -lz
}

INCLUDEPATH += $$PWD/prebuilt-headers-linux
LIBS += -lpdfium
