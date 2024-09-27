# Support additional firmware for bc43xx WIFI+BT modules

FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

SRCREV_FORMAT = "linux-firmware"

BRCM_REV = "12.29.0.22"
SRC_URI[brcm_lwb.sha256sum] = "7a1340f70a1682798d437c6f6502af1ab6cff4bcb464f79c5d288a634da1356d"
SRC_URI[brcm_lwb5.sha256sum] = "a8c843b01971883942d7d2cef4473b95d7e70864fe5cccba3e1e23ed0b45acf3"

MODEL_LIST = "${MACHINE}"

SRC_URI:append = " \
	https://github.com/LairdCP/Sterling-LWB-and-LWB5-Release-Packages/releases/download/LRD-REL-${BRCM_REV}/summit-lwb-fcc-firmware-${BRCM_REV}.tar.bz2;name=brcm_lwb \
	https://github.com/LairdCP/Sterling-LWB-and-LWB5-Release-Packages/releases/download/LRD-REL-${BRCM_REV}/summit-lwb5-fcc-firmware-${BRCM_REV}.tar.bz2;name=brcm_lwb5 \
"

do_install:append() {
	install -d ${D}${nonarch_base_libdir}/firmware/bcm
	install -m 0755 ${WORKDIR}/lib/firmware/brcm/* ${D}${nonarch_base_libdir}/firmware/brcm/

	for model in ${MODEL_LIST}; do
		# Add model symbolic links to brcmfmac4339
		ln -sf brcmfmac4339-sdio.txt \
			${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.variscite,${model}.txt
		ln -sf brcmfmac4339-sdio.bin \
			${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio.variscite,${model}.bin

		# Add model symbolic links to brcmfmac43430
		ln -sf brcmfmac43430-sdio.txt \
			${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.variscite,${model}.txt
		ln -sf brcmfmac43430-sdio.bin \
			${D}${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio.variscite,${model}.bin
	done
}

FILES:${PN}-bcm4339 += " \
  ${nonarch_base_libdir}/firmware/brcm/BCM4335C0.hcd \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac4339-sdio* \
"

FILES:${PN}-bcm43430 += " \
  ${nonarch_base_libdir}/firmware/brcm/BCM43430A1.hcd \
  ${nonarch_base_libdir}/firmware/brcm/brcmfmac43430-sdio* \
"

