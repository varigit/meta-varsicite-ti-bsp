require recipes-bsp/u-boot/u-boot-ti.inc

LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"

UBOOT_INITIAL_ENV = "u-boot-initial-env"
SRC_URI += "file://fw_env.config"

UBOOT_GIT_URI = "git://github.com/varigit/ti-u-boot"

BRANCH = "ti-u-boot-2021.01_var01"
SRCREV = "c7143c864d96e8764179dae2f7f1c62abeec28d6"

BRANCH:am335x-var-som = "ti-u-boot-2021.01_08.02.00.006_var01"
SRCREV:am335x-var-som = "c213f71567210172d46e06e3b05b949e53894d20"
