do_compile() {
    cd ${S}

    # Currently there are races if you build all the targets at once in parallel
    for T in ${TFA_BUILD_TARGET}; do
        oe_runmake $T
    done
    oe_runmake fiptool
}
