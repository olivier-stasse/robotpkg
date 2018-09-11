# robotpkg sysdep/cmake.mk
# Created:			Anthony Mallet on Thu Jan 22 2009
#

DEPEND_DEPTH:=		${DEPEND_DEPTH}+
CMAKE_DEPEND_MK:=	${CMAKE_DEPEND_MK}+

ifeq (+,$(DEPEND_DEPTH))
DEPEND_PKG+=		cmake
endif

ifeq (+,$(CMAKE_DEPEND_MK)) # ----------------------------------------------

PREFER.cmake?=		system

DEPEND_USE+=		cmake
DEPEND_ABI.cmake?=	cmake>=2.6
DEPEND_METHOD.cmake+=	build
SYSTEM_SEARCH.cmake=	'bin/cmake:s/[^-.0-9]//g;y/-/./;p:% --version'

USE_CMAKE?=		yes
export CMAKE=		${PREFIX.cmake}/bin/cmake


# Define the proper cmake environment so that find_package() looks up the
# package in the right path
#
CMAKE_ARGS+=\
  $(foreach 1,${DEPEND_USE},$(foreach 2,${SYSTEM_FILES.$1},$(strip	\
    $(if $(filter %Config.cmake,$(notdir $2)),				\
      '-D$(patsubst %Config.cmake,%,$(notdir $2))_DIR=$(dir $2)')	\
    $(if $(filter %-config.cmake,$(notdir $2)),				\
      '-D$(patsubst %-config.cmake,%,$(notdir $2))_DIR=$(dir $2)'))))

CMAKE_ARGS+=\
  $(call quote,-DCMAKE_MODULE_PATH=$(subst :,;,$(call prependpaths,	\
      ${CMAKE_MODULE_DIRS} ${PREFIX}/share/cmake			\
	$(patsubst %/,%,$(foreach _pkg_,${DEPEND_USE},			\
	  $(or ${CMAKE_MODULE_PATH.${_pkg_}},				\
	    $(dir $(foreach _,${SYSTEM_FILES.${_pkg_}},			\
	      $(if $(filter Find%.cmake,$(notdir $_)),$_)))))))))

CMAKE_ARGS+=\
  $(call quote,-DCMAKE_PREFIX_PATH=$(subst :,;,$(call prependpaths,	\
    ${CMAKE_PREFIX_PATH}						\
      $(patsubst %/,%,$(foreach _pkg_,${DEPEND_USE},			\
        ${CMAKE_PREFIX_PATH.${_pkg_}})))))


# Use the install_manifest.txt file generated by cmake install for the
# print-PLIST target, because cmake doesn't change the date of installed
# files.
#
PRINT_PLIST_FILES_CMD+=\
	${CAT} 2>/dev/null $(or						\
	  $(wildcard $(addsuffix /install_manifest.txt,${BUILD_DIRS})),	\
	  $(wildcard $(addprefix ${WRKSRC}/,				\
	    $(addsuffix /install_manifest.txt,${BUILD_DIRS}))),		\
	  /dev/null);

endif # CMAKE_DEPEND_MK ----------------------------------------------------

DEPEND_DEPTH:=		${DEPEND_DEPTH:+=}
