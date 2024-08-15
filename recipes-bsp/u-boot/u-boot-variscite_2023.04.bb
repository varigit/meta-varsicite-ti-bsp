require recipes-bsp/u-boot/u-boot-ti.inc
FILESEXTRAPATHS:prepend:var-som:k3r5 := "${THISDIR}/${PN}/am62x-var-som:"

LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"

UBOOT_INITIAL_ENV = "u-boot-initial-env"
SRC_URI += "file://fw_env.config"

UBOOT_GIT_URI = "git://github.com/varigit/ti-u-boot"

BRANCH = "ti-u-boot-2023.04_var01"
SRCREV = "6c04e89c386a2523237869311364e99b68a460b4"

COMPATIBLE_MACHINE = "(am62x-var-som)"
