# robotpkg sysdep/libtool-ltdl.mk
# Created:			Thomas Moulard on Thu Nov 19 2009
#
DEPEND_DEPTH:=			${DEPEND_DEPTH}+
LIBTOOL_LTDL_DEPEND_MK:=	${LIBTOOL_LTDL_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=				libtool-ltdl
endif

ifeq (+,$(LIBTOOL_LTDL_DEPEND_MK)) # -------------------------------------------

include ../../mk/robotpkg.prefs.mk
PREFER.libtool-ltdl?=		${PREFER.libtool}
ifneq (${PREFER.libtool-ltdl},${PREFER.libtool})
 PKG_FAIL_REASON+=\
       "PREFER.libtool-ltdl and PREFER.libtool must be set to the same value."
endif

DEPEND_USE+=				libtool-ltdl
DEPEND_ABI.libtool-ltdl?=		libtool-ltdl>=1.5.22

SYSTEM_PKG.Fedora.libtool-ltdl=   libtool-ltdl-devel
SYSTEM_PKG.Ubuntu.libtool-ltdl=	libltdl-dev
SYSTEM_PKG.Debian.libtool-ltdl=	libltdl-dev
SYSTEM_PKG.NetBSD.libtool-ltdl=         pkgsrc/devel/libltdl

SYSTEM_SEARCH.libtool-ltdl=\
	'bin/libtool:/libtool/{s/^[^0-9]*//;s/[^.0-9].*$$//;p;}:% --version'	\
	'include/ltdl.h'						  	\
	'lib/libltdl.so'

include ../../pkgtools/libtool/depend.mk

endif # LIBTOOL_LTDL_DEPEND_MK -------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
