# Copyright (C) 2024 Variscite
include ti-mcu-plus-sdk.inc

LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"

MCU-PLUS_BRANCH = "mcu_plus_sdk_am62x_09_02_01_06_var01"

SRCREV = "f4e0b1f0ef4420a03d4ae86d367d423ea976da7d"
SRC_URI = " \
    git://github.com/varigit/ti-mcu-plus-sdk.git;protocol=https;branch=${MCU-PLUS_BRANCH}; \
"

COMPATIBLE_MACHINE = "(am62x-var-som)"
