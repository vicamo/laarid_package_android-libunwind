#
# Copyright (C) 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Since mips and mips64 use the same source, only generate includes/srcs
# for the below set of arches.
libunwind_generate_arches = arm aarch64 mips x86 x86_64

#-----------------------------------------------------------------------
# libunwind shared library
#-----------------------------------------------------------------------
lib_LTLIBRARIES += \
    src/libandroid-unwind.la

pkgconfig_DATA += \
    src/android-unwind-0.0.pc

src_libandroid_unwind_la_CPPFLAGS = \
    $(AM_CPPFLAGS)
src_libandroid_unwind_la_SOURCES = \
    src/mi/init.c \
    src/mi/flush_cache.c \
    src/mi/mempool.c \
    src/mi/strerror.c \
    src/mi/backtrace.c \
    src/mi/dyn-cancel.c \
    src/mi/dyn-info-list.c \
    src/mi/dyn-register.c \
    src/mi/map.c \
    src/mi/Lmap.c \
    src/mi/Ldyn-extract.c \
    src/mi/Lfind_dynamic_proc_info.c \
    src/mi/Lget_proc_info_by_ip.c \
    src/mi/Lget_proc_name.c \
    src/mi/Lput_dynamic_unwind_info.c \
    src/mi/Ldestroy_addr_space.c \
    src/mi/Lget_reg.c \
    src/mi/Lset_reg.c \
    src/mi/Lget_fpreg.c \
    src/mi/Lset_fpreg.c \
    src/mi/Lset_caching_policy.c \
    src/mi/Gdyn-extract.c \
    src/mi/Gdyn-remote.c \
    src/mi/Gfind_dynamic_proc_info.c \
    src/mi/Gget_accessors.c \
    src/mi/Gget_proc_info_by_ip.c \
    src/mi/Gget_proc_name.c \
    src/mi/Gput_dynamic_unwind_info.c \
    src/mi/Gdestroy_addr_space.c \
    src/mi/Gget_reg.c \
    src/mi/Gset_reg.c \
    src/mi/Gget_fpreg.c \
    src/mi/Gset_fpreg.c \
    src/mi/Gset_caching_policy.c \
    src/dwarf/Lexpr.c \
    src/dwarf/Lfde.c \
    src/dwarf/Lparser.c \
    src/dwarf/Lpe.c \
    src/dwarf/Lstep_dwarf.c \
    src/dwarf/Lfind_proc_info-lsb.c \
    src/dwarf/Lfind_unwind_table.c \
    src/dwarf/Gexpr.c \
    src/dwarf/Gfde.c \
    src/dwarf/Gfind_proc_info-lsb.c \
    src/dwarf/Gfind_unwind_table.c \
    src/dwarf/Gparser.c \
    src/dwarf/Gpe.c \
    src/dwarf/Gstep_dwarf.c \
    src/dwarf/global.c \
    src/os-common.c \
    src/os-linux.c \
    src/os-linux.h \
    src/Los-common.c

EXTRA_DIST += \
    include/map_info.h \
    src/dwarf/Gstep.c \
    src/dwarf/Lstep.c

# ptrace files for remote unwinding.
src_libandroid_unwind_la_SOURCES += \
    src/ptrace/_UPT_accessors.c \
    src/ptrace/_UPT_access_fpreg.c \
    src/ptrace/_UPT_access_mem.c \
    src/ptrace/_UPT_access_reg.c \
    src/ptrace/_UPT_create.c \
    src/ptrace/_UPT_destroy.c \
    src/ptrace/_UPT_find_proc_info.c \
    src/ptrace/_UPT_get_dyn_info_list_addr.c \
    src/ptrace/_UPT_internal.h \
    src/ptrace/_UPT_put_unwind_info.c \
    src/ptrace/_UPT_get_proc_name.c \
    src/ptrace/_UPT_reg_offset.c \
    src/ptrace/_UPT_resume.c

# Arch specific source files.
libunwind_src_files_arm = \
    src/arm/init.h \
    src/arm/is_fpreg.c \
    src/arm/regname.c \
    src/arm/Gcreate_addr_space.c \
    src/arm/Gget_proc_info.c \
    src/arm/Gget_save_loc.c \
    src/arm/Gglobal.c \
    src/arm/Ginit.c \
    src/arm/Ginit_local.c \
    src/arm/Ginit_remote.c \
    src/arm/Gregs.c \
    src/arm/Gresume.c \
    src/arm/Gstep.c \
    src/arm/Lcreate_addr_space.c \
    src/arm/Lget_proc_info.c \
    src/arm/Lget_save_loc.c \
    src/arm/Lglobal.c \
    src/arm/Linit.c \
    src/arm/Linit_local.c \
    src/arm/Linit_remote.c \
    src/arm/Lregs.c \
    src/arm/Lresume.c \
    src/arm/Lstep.c \
    src/arm/unwind_i.h
libunwind_src_files_aarch64 = \
    src/aarch64/init.h \
    src/aarch64/is_fpreg.c \
    src/aarch64/regname.c \
    src/aarch64/Gcreate_addr_space.c \
    src/aarch64/Gget_proc_info.c \
    src/aarch64/Gget_save_loc.c \
    src/aarch64/Gglobal.c \
    src/aarch64/Ginit.c \
    src/aarch64/Ginit_local.c \
    src/aarch64/Ginit_remote.c \
    src/aarch64/Gregs.c \
    src/aarch64/Gresume.c \
    src/aarch64/Gstep.c \
    src/aarch64/Lcreate_addr_space.c \
    src/aarch64/Lget_proc_info.c \
    src/aarch64/Lget_save_loc.c \
    src/aarch64/Lglobal.c \
    src/aarch64/Linit.c \
    src/aarch64/Linit_local.c \
    src/aarch64/Linit_remote.c \
    src/aarch64/Lregs.c \
    src/aarch64/Lresume.c \
    src/aarch64/Lstep.c \
    src/aarch64/unwind_i.h
libunwind_src_files_mips = \
    src/mips/init.h \
    src/mips/is_fpreg.c \
    src/mips/regname.c \
    src/mips/Gcreate_addr_space.c \
    src/mips/Gget_proc_info.c \
    src/mips/Gget_save_loc.c \
    src/mips/Gglobal.c \
    src/mips/Ginit.c \
    src/mips/Ginit_local.c \
    src/mips/Ginit_remote.c \
    src/mips/Gregs.c \
    src/mips/Gresume.c \
    src/mips/Gstep.c \
    src/mips/Lcreate_addr_space.c \
    src/mips/Lget_proc_info.c \
    src/mips/Lget_save_loc.c \
    src/mips/Lglobal.c \
    src/mips/Linit.c \
    src/mips/Linit_local.c \
    src/mips/Linit_remote.c \
    src/mips/Lregs.c \
    src/mips/Lresume.c \
    src/mips/Lstep.c \
    src/mips/unwind_i.h
libunwind_src_files_x86 = \
    src/x86/init.h \
    src/x86/is_fpreg.c \
    src/x86/regname.c \
    src/x86/Gcreate_addr_space.c \
    src/x86/Gget_proc_info.c \
    src/x86/Gget_save_loc.c \
    src/x86/Gglobal.c \
    src/x86/Ginit.c \
    src/x86/Ginit_local.c \
    src/x86/Ginit_remote.c \
    src/x86/Gregs.c \
    src/x86/Gresume.c \
    src/x86/Gstep.c \
    src/x86/Lcreate_addr_space.c \
    src/x86/Lget_proc_info.c \
    src/x86/Lget_save_loc.c \
    src/x86/Lglobal.c \
    src/x86/Linit.c \
    src/x86/Linit_local.c \
    src/x86/Linit_remote.c \
    src/x86/Lregs.c \
    src/x86/Lresume.c \
    src/x86/Lstep.c \
    src/x86/unwind_i.h
libunwind_src_files_x86_64 = \
    src/x86_64/init.h \
    src/x86_64/is_fpreg.c \
    src/x86_64/regname.c \
    src/x86_64/Gcreate_addr_space.c \
    src/x86_64/Gget_proc_info.c \
    src/x86_64/Gget_save_loc.c \
    src/x86_64/Gglobal.c \
    src/x86_64/Ginit.c \
    src/x86_64/Ginit_local.c \
    src/x86_64/Ginit_remote.c \
    src/x86_64/Gregs.c \
    src/x86_64/Gresume.c \
    src/x86_64/Gstep.c \
    src/x86_64/Lcreate_addr_space.c \
    src/x86_64/Lget_proc_info.c \
    src/x86_64/Lget_save_loc.c \
    src/x86_64/Lglobal.c \
    src/x86_64/Linit.c \
    src/x86_64/Linit_local.c \
    src/x86_64/Linit_remote.c \
    src/x86_64/Lregs.c \
    src/x86_64/Lresume.c \
    src/x86_64/Lstep.c \
    src/x86_64/unwind_i.h

libunwind_src_files_arm += \
    src/arm/getcontext.S \
    src/arm/Gis_signal_frame.c \
    src/arm/Gex_tables.c \
    src/arm/Lis_signal_frame.c \
    src/arm/Lex_tables.c \
    src/arm/offsets.h

libunwind_src_files_aarch64 += \
    src/aarch64/Gis_signal_frame.c \
    src/aarch64/Lis_signal_frame.c \
    src/aarch64/offsets.h

libunwind_src_files_mips += \
    src/mips/getcontext-android.S \
    src/mips/Gis_signal_frame.c \
    src/mips/Lis_signal_frame.c \
    src/mips/offsets.h

libunwind_src_files_x86 += \
    src/x86/getcontext-linux.S \
    src/x86/Gos-linux.c \
    src/x86/Los-linux.c \
    src/x86/offsets.h

libunwind_src_files_x86_64 += \
    src/x86_64/getcontext.S \
    src/x86_64/Gstash_frame.c \
    src/x86_64/Gtrace.c \
    src/x86_64/Gos-linux.c \
    src/x86_64/Lstash_frame.c \
    src/x86_64/Ltrace.c \
    src/x86_64/Los-linux.c \
    src/x86_64/offsets.h \
    src/x86_64/setcontext.S \
    src/x86_64/ucontext_i.h

libunwind_src_files_ppc = \
    src/ppc/Gcreate_addr_space.c \
    src/ppc/Gget_proc_info.c \
    src/ppc/Gget_save_loc.c \
    src/ppc/Ginit_local.c \
    src/ppc/Ginit_remote.c \
    src/ppc/Gis_signal_frame.c \
    src/ppc/Lcreate_addr_space.c \
    src/ppc/Lget_proc_info.c \
    src/ppc/Lget_save_loc.c \
    src/ppc/Linit_local.c \
    src/ppc/Linit_remote.c \
    src/ppc/Lis_signal_frame.c

libunwind_src_files_ppc32 = \
    $(libunwind_src_files_ppc) \
    src/ppc32/Gglobal.c \
    src/ppc32/Ginit.c \
    src/ppc32/Gregs.c \
    src/ppc32/Gresume.c \
    src/ppc32/Gstep.c \
    src/ppc32/Lglobal.c \
    src/ppc32/Linit.c \
    src/ppc32/Lregs.c \
    src/ppc32/Lresume.c \
    src/ppc32/Lstep.c \
    src/ppc32/get_func_addr.c \
    src/ppc32/init.h \
    src/ppc32/is_fpreg.c \
    src/ppc32/regname.c \
    src/ppc32/ucontext_i.h \
    src/ppc32/unwind_i.h

libunwind_src_files_ppc64 = \
    $(libunwind_src_files_ppc) \
    src/ppc64/Gglobal.c \
    src/ppc64/Ginit.c \
    src/ppc64/Gregs.c \
    src/ppc64/Gresume.c \
    src/ppc64/Gstep.c \
    src/ppc64/Lglobal.c \
    src/ppc64/Linit.c \
    src/ppc64/Lregs.c \
    src/ppc64/Lresume.c \
    src/ppc64/Lstep.c \
    src/ppc64/get_func_addr.c \
    src/ppc64/init.h \
    src/ppc64/is_fpreg.c \
    src/ppc64/regname.c \
    src/ppc64/ucontext_i.h \
    src/ppc64/unwind_i.h

# mips and mips64 use the same sources but define _MIP_SIM differently
# to change the behavior.
#   mips uses o32 abi (_MIPS_SIM == _ABIO32).
#   mips64 uses n64 abi (_MIPS_SIM == _ABI64).
if ARCH_MIPS64
src_libandroid_unwind_la_CPPFLAGS += \
    -I$(top_srcdir)/include/tdep-mips
endif
libunwind_src_files_mips64 = \
    $(libunwind_src_files_mips)

# 64-bit architectures
if USE_ELF64
src_libandroid_unwind_la_SOURCES += src/elf64.c src/elf64.h
else
if USE_ELF32
# 32-bit architectures
src_libandroid_unwind_la_SOURCES += src/elf32.c src/elf32.h
else
if USE_ELFXX
src_libandroid_unwind_la_SOURCES += src/elfxx.c src/elfxx.h
endif
endif
endif

if ARCH_ARM
src_libandroid_unwind_la_SOURCES += \
    $(libunwind_src_files_arm)
else
if ARCH_AARCH64
src_libandroid_unwind_la_SOURCES += \
    $(libunwind_src_files_aarch64)
else
if ARCH_MIPS
src_libandroid_unwind_la_SOURCES += \
    $(libunwind_src_files_mips)
else
if ARCH_MIPS64
src_libandroid_unwind_la_SOURCES += \
    $(libunwind_src_files_mips64)
else
if ARCH_PPC32
src_libandroid_unwind_la_SOURCES += \
    $(libunwind_src_files_ppc32)
else
if ARCH_PPC64
src_libandroid_unwind_la_SOURCES += \
    $(libunwind_src_files_ppc64)
else
if ARCH_X86
src_libandroid_unwind_la_SOURCES += \
    $(libunwind_src_files_x86)
else
if ARCH_X86_64
src_libandroid_unwind_la_SOURCES += \
    $(libunwind_src_files_x86_64)
endif # ARCH_X86_64
endif # ARCH_X86
endif # ARCH_PPC64
endif # ARCH_PPC32
endif # ARCH_MIPS64
endif # ARCH_MIPS
endif # ARCH_AARCH64
endif # ARCH_ARM

src_libandroid_unwind_la_LIBADD = \
    -lc $(LIBCRTS) -lpthread $(LIBLZMA)
src_libandroid_unwind_la_LDFLAGS = \
    -version-info $(SOVERSION)

#-----------------------------------------------------------------------
# libunwindbacktrace static library
#-----------------------------------------------------------------------
lib_LTLIBRARIES += \
    src/libandroid-unwind-backtrace.la

pkgconfig_DATA += \
    src/android-unwind-backtrace-0.0.pc

src_libandroid_unwind_backtrace_la_SOURCES = \
    src/unwind/unwind-internal.h \
    src/unwind/BacktraceWrapper.c \
    src/unwind/DeleteException.c \
    src/unwind/FindEnclosingFunction.c \
    src/unwind/ForcedUnwind.c \
    src/unwind/GetBSP.c \
    src/unwind/GetCFA.c \
    src/unwind/GetDataRelBase.c \
    src/unwind/GetGR.c \
    src/unwind/GetIP.c \
    src/unwind/GetIPInfo.c \
    src/unwind/GetLanguageSpecificData.c \
    src/unwind/GetRegionStart.c \
    src/unwind/GetTextRelBase.c \
    src/unwind/RaiseException.c \
    src/unwind/Resume.c \
    src/unwind/Resume_or_Rethrow.c \
    src/unwind/SetGR.c \
    src/unwind/SetIP.c

EXTRA_DIST += \
    src/unwind/Backtrace.c

src_libandroid_unwind_backtrace_la_CFLAGS = \
    -Wno-old-style-declaration \
    -fvisibility=hidden
src_libandroid_unwind_backtrace_la_CPPFLAGS = \
    $(AM_CPPFLAGS)
#    -DUNW_ADDITIONAL_PREFIX
if ARCH_MIPS64
src_libandroid_unwind_backtrace_la_CPPFLAGS += \
    -I$(top_srcdir)/include/tdep-mips
endif
src_libandroid_unwind_backtrace_la_LIBADD = \
    src/libandroid-unwind.la
src_libandroid_unwind_backtrace_la_LDFLAGS = \
    -version-info $(SOVERSION)
