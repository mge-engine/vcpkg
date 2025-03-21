# Automatically generated by scripts/boost/generate-ports.ps1

vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO boostorg/concept_check
    REF boost-${VERSION}
    SHA512 02d90c46bad058a63cb9023d7737c7477cccfb17be0e284131e6fae108a88bf8c638698359c89fa6c3a094118a3e150f3bc833907ee581fa7875392d01763585
    HEAD_REF master
)

set(FEATURE_OPTIONS "")
boost_configure_and_install(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS ${FEATURE_OPTIONS}
)
