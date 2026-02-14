add_executable(intro main.cpp)

target_link_libraries(
  intro
  PRIVATE cpp_best_practices::cpp_best_practices_options
          cpp_best_practices::cpp_best_practices_warnings)

target_link_system_libraries(
  intro
  PRIVATE
          CLI11::CLI11
          fmt::fmt
          spdlog::spdlog
          lefticus::tools
          ftxui::screen
          ftxui::dom
          ftxui::component)


cpp_best_practices_configure_linker(intro)

target_include_directories(intro PRIVATE "${CMAKE_BINARY_DIR}/configured_files/include")

# Apply WASM-specific configuration
if(EMSCRIPTEN)
  cpp_best_practices_configure_wasm_target(intro
    TITLE "Intro - FTXUI Sample"
    DESCRIPTION "FTXUI-based terminal application"
  )
endif()
