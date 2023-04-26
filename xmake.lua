target("libBX")
    set_kind("static")
    add_cxxflags("/Zc:__cplusplus")

    local BX_DIR = "$(projectdir)/Vendor/bx/"

    add_includedirs(BX_DIR .. "include", {public = true})
    add_includedirs(BX_DIR .. "include/bx/inline", {public = true})

    if is_plat("windows") then 
        add_defines("__STDC_LIMIT_MACROS"
                , "__STDC_FORMAT_MACROS"
                , "__STDC_CONSTANT_MACROS"
                , "NDEBUG"
                , "WIN32"
                , "_WIN32"
                , "_HAS_EXCEPTIONS=0"
                , "_HAS_ITERATOR_DEBUGGING=0"
                , "_ITERATOR_DEBUG_LEVEL=0"
                , "_SCL_SECURE=0"
                , "_SECURE_SCL=0"
                , "_SCL_SECURE_NO_WARNINGS"
                , "_CRT_SECURE_NO_WARNINGS"
                , "_CRT_SECURE_NO_DEPRECATE"
                , "BX_CONFIG_DEBUG")

        add_includedirs(BX_DIR .. "include/compat/msvc", {public = true})
        add_includedirs(BX_DIR .. "3rdparty", {public = true})

        add_files(BX_DIR .. "src/**.cpp|amalgamated.cpp") --|crtnone.cpp

    elseif is_plat("macosx") then
        add_includedirs(BX_DIR .. "include/compat/osx")
        add_includedirs(BX_DIR .. "3rdparty")

        add_files(BX_DIR .. "src/**.cpp|amalgamated.cpp")
    end