# robotpkg Makefile for:	image/niut-genom
# Created:			Matthieu Herrb on Tue, 11 Jan 2011
#

DISTNAME=	niut-genom-0.6
CATEGORIES=	image
MASTER_SITES=	${MASTER_SITE_OPENROBOTS:=niut-genom/}
MASTER_REPOSITORY=	${MASTER_REPOSITORY_OPENROBOTS_TRAC}niut-genom

MAINTAINER=	openrobots@laas.fr
COMMENT=	GenoM module for the NITE user tracker from PrimeSense
LICENSE=	isc

GENOM_MODULE=	niut
MAKE_FLAGS+=	OPENNI=${PREFIX.openni-nite}

include ../../architecture/genom/depend.mk
include ../../image/openni-nite/depend.mk
include ../../interfaces/genBasic-genom/depend.mk
include ../../mk/language/c.mk
include ../../mk/language/c++.mk
include ../../mk/robotpkg.mk
