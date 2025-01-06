DESCRIPTION = "Sysconfig configuration tool for TI-based devices."
LICENSE = "BSD-3-Clause"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause;md5=550794465ba0ec5312d6919e203a55f9"
SECTION = "BSP"

# We do not need to build anything
INHIBIT_DEFAULT_DEPS = "1"

# These are needed for compability with cross package naming conventions
PN = "sysconfig-cross-${TUNE_PKGARCH}"
PROVIDES = "sysconfig"

inherit cross

# Override those in cross as the target is not Linux/A-core but M4 core
TUNE_PKGARCH = "armv7e-m"

TARGET_ARCH = "arm32"

SRC_URI = " \
    https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-nsUM6f7Vvb/${PV}/${SYSCONFIG_BIN} \
"

do_install() {
    install -d ${D}${bindir}/sysconfig
    chmod +x ${WORKDIR}/${SYSCONFIG_BIN}
    ${WORKDIR}/${SYSCONFIG_BIN} --mode unattended --prefix ${D}${bindir}/sysconfig
}

# This toolchain is not built but packaged from
# a bin file that has been stripped already
INSANE_SKIP:${PN} = "already-stripped"
