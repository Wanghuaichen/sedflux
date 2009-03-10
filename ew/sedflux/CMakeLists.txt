include_directories(${CMAKE_CURRENT_SOURCE_DIR}/.. ${CMAKE_CURRENT_SOURCE_DIR}/../sakura ${CMAKE_CURRENT_SOURCE_DIR}/../avulsion ${CMAKE_CURRENT_SOURCE_DIR}/../bio ${CMAKE_CURRENT_SOURCE_DIR}/../diffusion ${CMAKE_CURRENT_SOURCE_DIR}/../subside ${CMAKE_CURRENT_SOURCE_DIR}/../xshore ${CMAKE_CURRENT_SOURCE_DIR}/../squall ${CMAKE_CURRENT_SOURCE_DIR}/../flow ${CMAKE_CURRENT_SOURCE_DIR}/../muds ${CMAKE_CURRENT_SOURCE_DIR}/../bing ${CMAKE_CURRENT_SOURCE_DIR}/../failure ${CMAKE_CURRENT_SOURCE_DIR}/../quake ${CMAKE_CURRENT_SOURCE_DIR}/../compact ${CMAKE_CURRENT_SOURCE_DIR}/../inflow ${CMAKE_CURRENT_SOURCE_DIR}/../plume )

set( sedflux_LIBS
  utils sedflux sakura avulsion bio diffusion subside xshore squall flow muds bing failure quake compact inflow plume )

########### next target ###############

SET(sedflux_SRCS main.c)

add_executable(run_sedflux ${sedflux_SRCS})

target_link_libraries(run_sedflux sedflux-2.0)

install(PROGRAMS run_sedflux DESTINATION bin RENAME sedflux)


########### next target ###############

SET(sedflux-2.0_LIB_SRCS
sedflux_command_line.c 
run_constants.c 
run_squall.c 
run_cpr.c 
run_flow.c 
                            rain_sediment.c 
                            run_bbl.c 
                            run_avulsion.c 
                            run_measuring_station.c 
                            run_data_dump.c 
                            run_failure.c 
                            run_isostasy.c 
                            run_diffusion.c 
                            run_xshore.c 
                            run_storm.c 
                            run_river.c 
                            run_new_process.c 
                            run_bedload.c 
                            run_debris_flow.c 
                            run_subsidence.c 
                            run_compaction.c 
                            run_erosion.c 
                            run_sea_level.c 
                            run_quake.c 
                            run_tide.c 
                            run_slump.c 
                            run_turbidity_current.c 
                            run_plume.c 
                            sedflux.c 
                            init.c 
                            my_sedflux.c 
                            sedflux_esmf.c
)

add_library(sedflux-2.0 SHARED ${sedflux-2.0_LIB_SRCS})

target_link_libraries(sedflux-2.0 sedflux ${sedflux_LIBS})

install(TARGETS sedflux-2.0 DESTINATION lib)


########### install files ###############

install(FILES  sedflux.h DESTINATION include/ew-2.0)
#install(FILES  runsedflux sedflux-run-batch DESTINATION )



#original Makefile.am contents follow:

#INCLUDES                 = -I$(top_srcdir)/ew \
#                           -I$(top_srcdir)/ew/sakura \
#                           -I$(top_srcdir)/ew/avulsion \
#                           -I$(top_srcdir)/ew/bio \
#                           -I$(top_srcdir)/ew/diffusion \
#                           -I$(top_srcdir)/ew/subside \
#                           -I$(top_srcdir)/ew/xshore \
#                           -I$(top_srcdir)/ew/squall \
#                           -I$(top_srcdir)/ew/flow \
#                           -I$(top_srcdir)/ew/muds \
#                           -I$(top_srcdir)/ew/bing \
#                           -I$(top_srcdir)/ew/failure \
#                           -I$(top_srcdir)/ew/quake \
#                           -I$(top_srcdir)/ew/compact \
#                           -I$(top_srcdir)/ew/inflow \
#                           -I$(top_srcdir)/ew/plume
#
#AM_LDFLAGS               = $(top_builddir)/ew/utils/libutils.la \
#                           $(top_builddir)/ew/sed/libsedflux.la \
#                           $(top_builddir)/ew/sakura/libsakura.la \
#                           $(top_builddir)/ew/avulsion/libavulsion.la \
#                           $(top_builddir)/ew/bio/libbio.la \
#                           $(top_builddir)/ew/diffusion/libdiffusion.la \
#                           $(top_builddir)/ew/subside/libsubside.la \
#                           $(top_builddir)/ew/xshore/libxshore.la \
#                           $(top_builddir)/ew/squall/libsquall.la \
#                           $(top_builddir)/ew/flow/libflow.la \
#                           $(top_builddir)/ew/muds/libmuds.la \
#                           $(top_builddir)/ew/bing/libbing.la \
#                           $(top_builddir)/ew/failure/libfailure.la \
#                           $(top_builddir)/ew/quake/libquake.la \
#                           $(top_builddir)/ew/compact/libcompact.la \
#                           $(top_builddir)/ew/inflow/libinflow.la \
#                           $(top_builddir)/ew/plume/libplume.la
#
#bin_SCRIPTS               = runsedflux sedflux-run-batch
#bin_PROGRAMS              = sedflux
#sedflux_DEPENDENCIES      = libsedflux-2.0.la
#sedflux_LDADD             = -lsedflux-2.0 -lgthread-2.0 -lglib-2.0
#
#lib_LTLIBRARIES           = libsedflux-2.0.la
#
#libsedflux_2_0_la_SOURCES = \
#                            sedflux_command_line.c \
#                            run_constants.c \
#                            run_squall.c \
#                            run_cpr.c \
#                            run_flow.c \
#                            rain_sediment.c \
#                            run_bbl.c \
#                            run_avulsion.c \
#                            run_measuring_station.c \
#                            run_data_dump.c \
#                            run_failure.c \
#                            run_isostasy.c \
#                            run_diffusion.c \
#                            run_xshore.c \
#                            run_storm.c \
#                            run_river.c \
#                            run_new_process.c \
#                            run_bedload.c \
#                            run_debris_flow.c \
#                            run_subsidence.c \
#                            run_compaction.c \
#                            run_erosion.c \
#                            run_sea_level.c \
#                            run_quake.c \
#                            run_tide.c \
#                            run_slump.c \
#                            run_turbidity_current.c \
#                            run_plume.c \
#                            sedflux.c \
#                            init.c \
#                            my_sedflux.c \
#                            sedflux_esmf.c
#
#EXTRA_DIST                = sedflux_esmf.F90
#
#sedflux_SOURCES           = main.c
#
#
#sedfluxinclude_HEADERS    = sedflux.h
#sedfluxincludedir         = $(includedir)/ew-2.0
#
#noinst_HEADERS            = \
#                            my_sedflux.h \
#                            my_processes.h
#