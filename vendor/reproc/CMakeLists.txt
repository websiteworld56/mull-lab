if(WIN32)
  set(REPROC_WINSOCK_LIBRARY ws2_32)
elseif(NOT APPLE)
  set(REPROC_RT_LIBRARY rt) # clock_gettime
endif()

if(REPROC_MULTITHREADED)
  target_compile_definitions(reproc PRIVATE REPROC_MULTITHREADED)
  target_link_libraries(reproc PRIVATE Threads::Threads)
endif()

target_sources(reproc PRIVATE
  src/clock.${PLATFORM}.c
  src/drain.c
  src/error.${PLATFORM}.c
  src/handle.${PLATFORM}.c
  src/init.${PLATFORM}.c
  src/options.c
  src/pipe.${PLATFORM}.c
  src/process.${PLATFORM}.c
  src/redirect.${PLATFORM}.c
  src/redirect.c
  src/reproc.c
  src/run.c
  src/strv.c
  src/utf.${PLATFORM}.c
)

reproc_test(reproc argv C)
reproc_test(reproc deadline C)
reproc_test(reproc env C)
reproc_test(reproc io C)
reproc_test(reproc overflow C)
reproc_test(reproc path C)
reproc_test(reproc stop C)
reproc_test(reproc working-directory C)
reproc_test(reproc pid C)

if(UNIX)
  reproc_test(reproc fork C)
endif()

reproc_example(reproc drain C)
reproc_example(reproc env C ARGS PROJECT=REPROC)
reproc_example(reproc path C)
reproc_example(reproc poll C)
reproc_example(reproc read C)
reproc_example(reproc parent C)
reproc_example(reproc run C)
