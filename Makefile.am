unwindincdir = $(includedir)/android/libunwind-0.0
unwindinc_HEADERS = include/libunwind-dynamic.h \
    include/libunwind-ptrace.h \
    include/libunwind-coredump.h

if ARCH_AARCH64
unwindinc_HEADERS += include/libunwind-aarch64.h
endif
if ARCH_ARM
unwindinc_HEADERS += include/libunwind-arm.h
endif
if ARCH_IA64
unwindinc_HEADERS += include/libunwind-ia64.h
endif
if ARCH_HPPA
unwindinc_HEADERS += include/libunwind-hppa.h
endif
if ARCH_MIPS
unwindinc_HEADERS += include/libunwind-mips.h
endif
if ARCH_MIPS64
unwindinc_HEADERS += include/libunwind-mips.h
endif
if ARCH_X86
unwindinc_HEADERS += include/libunwind-x86.h
endif
if ARCH_X86_64
unwindinc_HEADERS += include/libunwind-x86_64.h
endif
if ARCH_PPC32
unwindinc_HEADERS += include/libunwind-ppc32.h
endif
if ARCH_PPC64
unwindinc_HEADERS += include/libunwind-ppc64.h
endif
if ARCH_SH
unwindinc_HEADERS += include/libunwind-sh.h
endif

unwindinc_HEADERS += include/libunwind.h include/unwind.h

nodist_include_HEADERS = include/libunwind-common.h

noinst_HEADERS = include/dwarf.h include/dwarf_i.h include/dwarf-eh.h	\
	include/compiler.h include/libunwind_i.h include/mempool.h	\
	include/remote.h						\
	include/tdep-aarch64/dwarf-config.h				\
	include/tdep-aarch64/jmpbuf.h					\
	include/tdep-aarch64/libunwind_i.h				\
	include/tdep-arm/dwarf-config.h	include/tdep-arm/ex_tables.h	\
	include/tdep-arm/jmpbuf.h include/tdep-arm/libunwind_i.h	\
	include/tdep-ia64/jmpbuf.h include/tdep-ia64/rse.h 		\
	include/tdep-ia64/libunwind_i.h	include/tdep-ia64/script.h	\
	include/tdep-hppa/libunwind_i.h					\
	include/tdep-hppa/jmpbuf.h include/tdep-hppa/dwarf-config.h	\
	include/tdep-mips/libunwind_i.h					\
	include/tdep-mips/jmpbuf.h include/tdep-mips/dwarf-config.h	\
	include/tdep-x86/libunwind_i.h					\
	include/tdep-x86/jmpbuf.h include/tdep-x86/dwarf-config.h	\
	include/tdep-x86_64/libunwind_i.h				\
	include/tdep-x86_64/jmpbuf.h include/tdep-x86_64/dwarf-config.h \
	include/tdep-ppc32/dwarf-config.h				\
	include/tdep-ppc32/jmpbuf.h include/tdep-ppc32/libunwind_i.h	\
	include/tdep-ppc64/dwarf-config.h				\
	include/tdep-ppc64/jmpbuf.h include/tdep-ppc64/libunwind_i.h	\
	include/tdep-sh/dwarf-config.h					\
	include/tdep-sh/jmpbuf.h include/tdep-sh/libunwind_i.h		\
	include/tdep/libunwind_i.h					\
	include/tdep/jmpbuf.h include/tdep/dwarf-config.h

SOVERSION=8:1:0		# See comments at end of file.
SETJMP_SO_VERSION=0:0:0
COREDUMP_SO_VERSION=0:0:0

#
# Don't link with start-files since we don't use any constructors/destructors:
#
COMMON_SO_LDFLAGS = $(LDFLAGS_NOSTARTFILES)

# Distribution
# ------------
check_LTLIBRARIES =
check_PROGRAMS =
lib_LTLIBRARIES =
pkgconfig_DATA =
TESTS =
EXTRA_DIST =
BUILT_SOURCES =
CLEANFILES =
DISTCLEANFILES =
MAINTAINERCLEANFILES = \
	$(GITIGNORE_MAINTAINERCLEANFILES_TOPLEVEL) \
	$(GITIGNORE_MAINTAINERCLEANFILES_M4_LIBTOOL) \
	$(GITIGNORE_MAINTAINERCLEANFILES_MAKEFILE_IN) \
	INSTALL

# We're running CI in docker, which reports host architecture as host,
# not the docker image architecture as we expected, so specifying the
# host/build information is necessary here.
DISTCHECK_CONFIGURE_FLAGS = \
	--host=$(host) \
	--build=$(build) \
	--disable-dependency-tracking \
	--disable-maintainer-mode \
	--enable-debug-frame \
	--disable-block-signals \
	--enable-msabi-support \
	--enable-minidebuginfo

GITIGNOREFILES = \
	build \
	debian \
	$(DIST_ARCHIVES)

AM_CPPFLAGS = \
    -I$(top_srcdir)/include \
    -I$(top_srcdir)/include/tdep-$(arch) \
    -I$(top_srcdir)/src \
    -DANDROID -D__ANDROID__
AM_CCASFLAGS = $(AM_CPPFLAGS)

include $(srcdir)/gtest.mk
include $(srcdir)/Android.mk
-include $(top_srcdir)/git.mk

pkgconfigdir = $(libdir)/pkgconfig
