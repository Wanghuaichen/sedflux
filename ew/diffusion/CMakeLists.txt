include_directories(${CMAKE_SOURCE_DIR}/ew )


########### next target ###############

SET(diffusion_SRCS
   diffusion_main.c
)

add_executable(run_diffusion ${diffusion_SRCS})

target_link_libraries(run_diffusion diffusion-static sedflux-static)

install(PROGRAMS ${CMAKE_CURRENT_BINARY_DIR}/run_diffusion DESTINATION bin RENAME diffusion COMPONENT sedflux)


########### next target ###############

set (diffusion_LIB_SRCS diffusion.c)

set_source_files_properties (${diffusion_LIB_SRCS} get_config_text.c
  PROPERTIES LANGUAGE CXX)
add_library(diffusion ${diffusion_LIB_SRCS} get_config_text.c)
add_library(diffusion-static STATIC ${diffusion_LIB_SRCS})

target_link_libraries(diffusion sedflux)

install(TARGETS diffusion DESTINATION lib COMPONENT sedflux)


########### install files ###############

install(FILES  diffusion.h DESTINATION include/ew-2.0 COMPONENT sedflux)



#original Makefile.am contents follow:

#INCLUDES                 = -I$(top_srcdir)/ew
#
#AM_LDFLAGS               = $(top_builddir)/ew/utils/libutils.la \
#                           $(top_builddir)/ew/sed/libsedflux.la
#
#bin_PROGRAMS              = diffusion
#diffusion_SOURCES         = diffusion_main.c
#diffusion_DEPENDENCIES    = libdiffusion.la
#diffusioninclude_HEADERS  = diffusion.h
#diffusionincludedir       = $(includedir)/ew-2.0
#
#lib_LTLIBRARIES           = libdiffusion.la
#libdiffusion_la_SOURCES   = diffusion.c
#
#diffusion_LDADD           = -ldiffusion -lglib-2.0
#
#
