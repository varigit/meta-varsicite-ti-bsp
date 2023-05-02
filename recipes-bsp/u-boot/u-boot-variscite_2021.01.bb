require recipes-bsp/u-boot/u-boot-ti.inc

LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"

UBOOT_INITIAL_ENV = "u-boot-initial-env"
SRC_URI += "file://fw_env.config"

UBOOT_GIT_URI = "git://github.com/varigit/ti-u-boot"

BRANCH = "ti-u-boot-2021.01_var01"
SRCREV = "277c2dd356d8ec77d7a776c420cf9d87f4e65ff1"
