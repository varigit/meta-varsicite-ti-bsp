FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI += " file://pvrsrvkm.rules"

PACKAGECONFIG ??= "udev"
PACKAGECONFIG[udev] = ",,,udev"

do_install_append () {
    without_sysvinit=${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}
    with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}

    # Delete initscript if it is not needed or would conflict with the udev rules
    if $without_sysvinit || $with_udev; then
        rm -rf ${D}${sysconfdir}/init.d
        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
    fi

    if $with_udev; then
        install -m644 -D ${WORKDIR}/pvrsrvkm.rules \
            ${D}${nonarch_base_libdir}/udev/rules.d/80-pvrsrvkm.rules
    fi

    chown -R root:root ${D}
}

FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
