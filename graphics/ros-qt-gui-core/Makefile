# robotpkg Makefile for:	middleware/ros-comm
# Created:			Anthony Mallet on Tue,  9 Oct 2012
#

ROS_PKG=	qt_gui_core
ROS_METAPKG=	yes
ROS_VERSION=	0.3.11
ROS_REPO=	ros-visualization

CATEGORIES=	graphics
ROS_COMMENT=	infrastructure for Qt based GUI

include ../../meta-pkgs/ros-base/Makefile.common

USE_QMAKE=		no
DEPEND_ABI.qmake+=	qmake>=2
CMAKE_ARGS+=		-DQT_QMAKE_EXECUTABLE=${QMAKE}

SUBST_CLASSES+=		py-interp
SUBST_FILES.py-interp+=	qt_dotgraph/test/*.py
SUBST_FILES.py-interp+= qt_gui/src/qt_gui/main.py
SUBST_FILES.py-interp+= qt_gui_app/scripts/qt_gui_app

DEPEND_ABI.ros-pluginlib.groovy+= ros-pluginlib>=1.9.23
DEPEND_ABI.ros-python-qt-binding.groovy+= ros-python-qt-binding>=0.2.11

include ../../devel/ros-catkin/depend.mk
include ../../devel/ros-cmake-modules/depend.mk
include ../../devel/ros-nodelet-core/depend.mk
include ../../devel/ros-pluginlib/depend.mk
include ../../graphics/ros-python-qt-binding/depend.mk
include ../../sysutils/py-rospkg/depend.mk
include ../../mk/sysdep/qmake.mk
include ../../mk/sysdep/py-pydot.mk
include ../../mk/sysdep/py-sip.mk
include ../../mk/sysdep/qt5-qtbase.mk
include ../../mk/robotpkg.mk
