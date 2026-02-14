macro(cpp_best_practices_configure_linker project_name)
  set(cpp_best_practices_USER_LINKER_OPTION
    "DEFAULT"
      CACHE STRING "Linker to be used")
    set(cpp_best_practices_USER_LINKER_OPTION_VALUES "DEFAULT" "SYSTEM" "LLD" "GOLD" "BFD" "MOLD" "SOLD" "APPLE_CLASSIC" "MSVC")
  set_property(CACHE cpp_best_practices_USER_LINKER_OPTION PROPERTY STRINGS ${cpp_best_practices_USER_LINKER_OPTION_VALUES})
  list(
    FIND
    cpp_best_practices_USER_LINKER_OPTION_VALUES
    ${cpp_best_practices_USER_LINKER_OPTION}
    cpp_best_practices_USER_LINKER_OPTION_INDEX)

  if(${cpp_best_practices_USER_LINKER_OPTION_INDEX} EQUAL -1)
    message(
      STATUS
        "Using custom linker: '${cpp_best_practices_USER_LINKER_OPTION}', explicitly supported entries are ${cpp_best_practices_USER_LINKER_OPTION_VALUES}")
  endif()

  set_target_properties(${project_name} PROPERTIES LINKER_TYPE "${cpp_best_practices_USER_LINKER_OPTION}")
endmacro()
