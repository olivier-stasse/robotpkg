# robotpkg sysdep/fortran.mk
# Created:			Anthony Mallet on Wed, 9 Jan 2013
#
ifndef _language_fortran_mk
_language_fortran_mk:=defined

#
# Fortran compiler definitions
#
# This file determines which Fortran compiler is used.
#
# === User-settable variables ===
#
# PREFER_ALTERNATIVE.fortran-compiler
#	The preferred Fortran compiler to use. The order of the entries
#	matters, since earlier entries are preferred over later ones.
#
#	Possible values: gfortran
#	Default: gfortran
#

# define an alternative for available c-compilers packages
PKG_ALTERNATIVES+=			fortran-compiler
PKG_ALTERNATIVES.fortran-compiler=	gfortran g95

include ../../mk/robotpkg.prefs.mk # for OPSYS
ifeq (NetBSD,${OPSYS})
  PREFER_ALTERNATIVE.fortran-compiler?=	g95 gfortran
endif
PREFER_ALTERNATIVE.fortran-compiler?=	gfortran g95

PREFER.fortran-compiler?=		system
DEPEND_ABI.fortran-compiler=		fortran-compiler

PKG_ALTERNATIVE_DESCR.gfortran =	Use the GNU fortran compiler
PKG_ALTERNATIVE_SELECT.gfortran ?=	ok # non-empty
define PKG_ALTERNATIVE_SET.gfortran
  include ../../mk/sysdep/gcc-fortran.mk

  export FC=	${GFORTRAN}
endef

PKG_ALTERNATIVE_DESCR.g95 =	Use the g95 fortran compiler
PKG_ALTERNATIVE_SELECT.g95 ?=	ok # non-empty
define PKG_ALTERNATIVE_SET.g95
  include ../../mk/sysdep/g95.mk

  export FC=	${G95}
endef

endif # _language_fortran_mk -----------------------------------------------
