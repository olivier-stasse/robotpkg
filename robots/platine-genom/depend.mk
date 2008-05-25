# $LAAS: depend.mk 2008/05/25 15:47:05 tho $
#
# Copyright (c) 2008 LAAS/CNRS
# All rights reserved.
#
# Redistribution  and  use in source   and binary forms,  with or without
# modification, are permitted provided that  the following conditions are
# met:
#
#   1. Redistributions  of  source code must  retain  the above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must  reproduce the above copyright
#      notice  and this list of  conditions in the documentation   and/or
#      other materials provided with the distribution.
#
#                                      Arnaud Degroote on Wed May 21 2008
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
PLATINEGENOM_DEPEND_MK:=	${PLATINEGENOM_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		platine-genom
endif

ifeq (+,$(PLATINEGENOM_DEPEND_MK))
PREFER.platine-genom?=	robotpkg

DEPEND_USE+=		platine-genom

DEPEND_ABI.platine-genom?=	platine-genom>=0.1
DEPEND_DIR.platine-genom?=	../../robots/platine-genom

SYSTEM_SEARCH.platine-genom=\
	include/platine/platineStruct.h		\
	lib/pkgconfig/platine.pc
endif

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
