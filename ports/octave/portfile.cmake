vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

include(vcpkg_find_fortran)
vcpkg_find_fortran(FORTRAN)

vcpkg_find_acquire_program(BISON)
get_filename_component(BISON_EXE_PATH "${BISON}" DIRECTORY)
vcpkg_add_to_path("${BISON_EXE_PATH}")

vcpkg_find_acquire_program(FLEX)
get_filename_component(FLEX_EXE_PATH "${FLEX}" DIRECTORY)
vcpkg_add_to_path("${FLEX_EXE_PATH}")

vcpkg_find_acquire_program(GPERF)
get_filename_component(GPERF_EXE_PATH "${GPERF}" DIRECTORY)
vcpkg_add_to_path("${GPERF_EXE_PATH}")

vcpkg_download_distfile(ARCHIVE
    URLS "https://ftpmirror.gnu.org/octave/octave-${VERSION}.tar.xz"
    FILENAME "octave-${VERSION}.tar.xz"
    SHA512 9550162681aee88b4bcb94c5081ed0470df0d3f7c5307b25878b94b19f1282002ba69f0c4c79877e81f61122bfba1b2671ed5007a28fbb2d755bda466a3c46d8
)

vcpkg_extract_source_archive(
    SOURCE_PATH
    ARCHIVE ${ARCHIVE}
    PATCHES
)

vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/bin")
vcpkg_add_to_path("${CURRENT_INSTALLED_DIR}/debug/bin")

vcpkg_configure_make(
    SOURCE_PATH "${SOURCE_PATH}"
    AUTOCONFIG
    OPTIONS
    --disable-docs
    --without-amd
    --without-camd
    --without-ccolamd
    --without-cholmod
    --without-colamd
    --without-curl
    --without-cxsparse
    --without-hdf5
    --without-qhull
    --without-qrupdate
    --without-umfpack
)

vcpkg_install_make()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/share")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/octave/site/")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/octave/site/")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/octave/site/")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/lib/octave/${VERSION}/site/")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/lib/octave/${VERSION}/site/")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/libexec/")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/libexec")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/octave/octave/${VERSION}/site")
file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/share/octave/octave/site")

vcpkg_install_copyright(FILE_LIST "${SOURCE_PATH}/COPYING")

vcpkg_fixup_pkgconfig()
