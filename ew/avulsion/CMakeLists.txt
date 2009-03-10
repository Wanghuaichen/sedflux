include_directories(${CMAKE_SOURCE_DIR}/ew )


########### next target ###############

SET(avulsion_SRCS
   avulsion_main.c
)

add_executable(run_avulsion ${avulsion_SRCS})

target_link_libraries(run_avulsion avulsion glib-2.0 sedflux)

install(PROGRAMS run_avulsion DESTINATION bin RENAME avulsion)


########### next target ###############

SET(avulsion_LIB_SRCS
   avulsion.c
)

add_library(avulsion SHARED ${avulsion_LIB_SRCS})

target_link_libraries(avulsion sedflux)

install(TARGETS avulsion DESTINATION lib)


########### install files ###############

install(FILES  avulsion.h DESTINATION include/ew-2.0)



#original Makefile.am contents follow:

#INCLUDES                 = -I$(top_srcdir)/ew
#
#AM_LDFLAGS               = $(top_builddir)/ew/utils/libutils.la \
#                           $(top_builddir)/ew/sed/libsedflux.la
#
#bin_PROGRAMS             = avulsion
#avulsion_SOURCES         = avulsion_main.c
#avulsion_DEPENDENCIES    = libavulsion.la
#avulsioninclude_HEADERS  = avulsion.h
#avulsionincludedir       = $(includedir)/ew-2.0
#
#lib_LTLIBRARIES          = libavulsion.la
#libavulsion_la_SOURCES   = avulsion.c
#
#avulsion_LDADD           = -lavulsion -lglib-2.0
#