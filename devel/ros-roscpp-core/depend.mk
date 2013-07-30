# robotpkg depend.mk for:	devel/ros-roscpp-core
# Created:			Anthony Mallet on Mon, 10 Dec 2012
#

DEPEND_DEPTH:=			${DEPEND_DEPTH}+
ROS_ROSCPP_CORE_DEPEND_MK:=	${ROS_ROSCPP_CORE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=			ros-roscpp-core
endif

ifeq (+,$(ROS_ROSCPP_CORE_DEPEND_MK)) # ------------------------------------

include ../../meta-pkgs/ros-base/depend.common
PREFER.ros-roscpp-core?=	${PREFER.ros-base}
SYSTEM_PREFIX.ros-roscpp-core?=	${SYSTEM_PREFIX.ros-base}

DEPEND_USE+=			ros-roscpp-core
ROS_DEPEND_USE+=		ros-roscpp-core

DEPEND_ABI.ros-roscpp-core?=	ros-roscpp-core>=0.2
DEPEND_DIR.ros-roscpp-core?=	../../devel/ros-roscpp-core

DEPEND_ABI.ros-roscpp-core.fuerte?=	ros-roscpp-core>=0.2<0.3
DEPEND_ABI.ros-roscpp-core.groovy?=	ros-roscpp-core>=0.3
DEPEND_ABI.ros-roscpp-core.hydro?=	ros-roscpp-core>=0.3

SYSTEM_SEARCH.ros-roscpp-core=\
  'include/ros/types.h'							\
  'lib/libcpp_common.so'						\
  'share/cpp_common/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'		\
  'share/roscpp_serialization/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'	\
  'share/roscpp_traits/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'		\
  'share/rostime/${ROS_STACKAGE}:/<version>/s/[^0-9.]//gp'			\
  'lib/pkgconfig/cpp_common.pc:/Version/s/[^0-9.]//gp'			\
  'lib/pkgconfig/roscpp_serialization.pc:/Version/s/[^0-9.]//gp'	\
  'lib/pkgconfig/roscpp_traits.pc:/Version/s/[^0-9.]//gp'		\
  'lib/pkgconfig/rostime.pc:/Version/s/[^0-9.]//gp'

endif # ROS_ROSCPP_CORE_DEPEND_MK ------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}