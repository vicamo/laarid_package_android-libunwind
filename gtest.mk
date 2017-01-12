if HAVE_GTEST
check_LTLIBRARIES += \
	libgtest.la \
	libgtest_main.la

libgtest_la_CPPFLAGS = \
	$(GTEST_CPPFLAGS) \
	-I $(GTEST_SRCDIR)
libgtest_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	-pthread
libgtest_la_LIBADD = \
	-lpthread
nodist_libgtest_la_SOURCES = \
	$(top_builddir)/gtest-all.cc

$(top_builddir)/gtest-all.cc: $(top_builddir)
	@-rm -f $@; $(LN_S) $(GTEST_SRCDIR)/src/gtest-all.cc $@

libgtest_main_la_CPPFLAGS = \
	$(GTEST_CPPFLAGS)
libgtest_main_la_CXXFLAGS = \
	$(AM_CXXFLAGS) \
	-pthread
libgtest_main_la_LIBADD = \
	-lpthread
nodist_libgtest_main_la_SOURCES = \
	$(top_builddir)/gtest_main.cc

$(top_builddir)/gtest_main.cc: $(top_builddir)
	@-rm -f $@; $(LN_S) $(GTEST_SRCDIR)/src/gtest_main.cc $@

BUILT_SOURCES += \
	$(top_builddir)/gtest-all.cc \
	$(top_builddir)/gtest_main.cc
endif # HAVE_GTEST
