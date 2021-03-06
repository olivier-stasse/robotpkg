# robotpkg depend.mk for:	graphics/gepetto-viewer
# Created:			Florent Lamiraux on Sun, 8 Mar 2015
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
GEPETTOVIEWER_DEPEND_MK:=	${GEPETTOVIEWER_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			gepetto-viewer
endif

ifeq (+,$(GEPETTOVIEWER_DEPEND_MK)) # ---------------------------

PREFER.gepetto-viewer?=		robotpkg

DEPEND_USE+=			gepetto-viewer

DEPEND_ABI.gepetto-viewer?=	${PKGTAG.python}-${PKGTAG.qt}-gepetto-viewer>=4.5.0
DEPEND_DIR.gepetto-viewer?=	../../graphics/gepetto-viewer

SYSTEM_SEARCH.gepetto-viewer=\
  'bin/gepetto-gui'						\
  'include/gepetto/viewer/group-node.h'				\
  'lib/libgepetto-viewer.so'					\
  'lib/pkgconfig/gepetto-viewer.pc:/Version/s/[^0-9.]//gp'

include ../../mk/sysdep/python.mk
include ../../mk/sysdep/qt.mk

endif # GEPETTOVIEWER_DEPEND_MK ---------------------------------

DEPEND_DEPTH:=			${DEPEND_DEPTH:+=}
