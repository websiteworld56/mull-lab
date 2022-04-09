# Do nothing if the LLVMCore target exists
if (TARGET google-test)
  return()
endif()

function(enable_google_test)
  set (google_test_dir ${PROJECT_SOURCE_DIR}/vendor/googletest/googletest)

  file(GLOB_RECURSE headers ${google_test_dir}/*.h)

  set(sources
    ${google_test_dir}/src/gtest-all.cc
    ${google_test_dir}/src/gtest_main.cc
    )

  add_library(google-test STATIC EXCLUDE_FROM_ALL ${headers} ${sources})
  target_compile_options(google-test PRIVATE ${LIBIRM_CXX_FLAGS})
  target_include_directories(google-test SYSTEM PUBLIC ${google_test_dir}/include)
  target_include_directories(google-test PRIVATE ${google_test_dir})
endfunction()

enable_google_test()