# Main package takes gconv-modules config file
PACKAGES =+ "glibc-gconv"
FILES:glibc-gconv += "/usr/lib64/gconv/gconv-modules"

# glibc-package.inc stashes away gconvs for sstate/sysroot use. However, since
# gconvs are provided by this same recipe, they never get unstashed automatically.
# This task restores them to where they are needed in PKGD for package splitting.
do_restore_gconvs() {
    install -d ${PKGD}/usr/lib64/gconv
    cp -rf ${LOCALESTASH}${libdir}/gconv/* ${PKGD}/usr/lib64/gconv/
}

# Dynamically create/split the optional gconv packages for each pre-built binary
python populate_packages:prepend() {
    bb.build.exec_func("do_restore_gconvs", d)

    libdir = '/usr/lib64'
    gconv_libdir = oe.path.join(libdir, "gconv")

    do_split_packages(d, gconv_libdir, file_regex=r'^(.*)\.so$', output_pattern='glibc-gconv-%s', \
        description='gconv module for character set %s', extra_depends='glibc-gconv')
}

do_install:append() {
    # Binaries for gconv are expected to be in lib64 in the current
    # pre-built configuration of this toolchain. Thus, copy gconv-modules
    # file there. Binaries will be copied later in packaging when dynamic
    # packages are created.
    install -d ${D}/usr/lib64/gconv
    cp ${D}${libdir}/gconv/gconv-modules ${D}/usr/lib64/gconv
}

# This recipe is broken
INSANE_SKIP:${PN} += "installed-vs-shipped"

# These libs are not used by this system so skip their libdir QA checks
INSANE_SKIP:glibc-gconv-libisoir165 += "libdir"
INSANE_SKIP:glibc-gconv-libcns += "libdir"
INSANE_SKIP:glibc-gconv-libksc += "libdir"
INSANE_SKIP:glibc-gconv-libjisx0213 += "libdir"
INSANE_SKIP:glibc-gconv-libjis += "libdir"
INSANE_SKIP:glibc-gconv-libgb += "libdir"
