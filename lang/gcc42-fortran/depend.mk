# $LAAS: depend.mk 2009/02/03 00:50:28 tho $
#
# Copyright (c) 2008-2009 LAAS/CNRS
# All rights reserved.
#
# Redistribution and use  in source  and binary  forms,  with or without
# modification, are permitted provided that the following conditions are
# met:
#
#   1. Redistributions of  source  code must retain the  above copyright
#      notice and this list of conditions.
#   2. Redistributions in binary form must reproduce the above copyright
#      notice and  this list of  conditions in the  documentation and/or
#      other materials provided with the distribution.
#
#                                      Anthony Mallet on Thu Feb 28 2008
#

# Simply register the compiler requirements; robotpkg compiler selection
# will do the actual job.

GCC_REQUIRED+=	4.2
USE_LANGUAGES+=	fortran
