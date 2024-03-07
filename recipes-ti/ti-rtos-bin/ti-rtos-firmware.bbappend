FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append:am62x-var-som = " file://ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f;name=m4f_fw"

SRC_URI[m4f_fw.sha256sum] = "6b0575ab39f1851483b12ea902ebfc03342fd5793beaf96e9893d96ca2a697b8"

do_install:prepend:am62x-var-som() {
    install -m 0644 ${WORKDIR}/ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ${S}/${IPC_FW_DIR}/am62-mcu-m4f0_0-fw
}
