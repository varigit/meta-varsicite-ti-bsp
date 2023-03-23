# Conditionally remove qt5 based on QT_PROVIDER, it's hard added by
# meta-arago/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.%.bbappend
PACKAGECONFIG:remove = "${@oe.utils.conditional('QT_PROVIDER', 'qt5', '', 'qt5', d)}"
