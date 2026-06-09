## Copyright (c) 2009, 2011  Openismus GmbH  <http://www.openismus.com/>
##
## This file is part of glibmm.
##
## glibmm is free software: you can redistribute it and/or modify it
## under the terms of the GNU Lesser General Public License as published
## by the Free Software Foundation, either version 2.1 of the License,
## or (at your option) any later version.
##
## glibmm is distributed in the hope that it will be useful, but
## WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
## See the GNU Lesser General Public License for more details.
##
## You should have received a copy of the GNU Lesser General Public License
## along with this library.  If not, see <http://www.gnu.org/licenses/>.

#serial 20110910

AC_DEFUN([GLIBMM_PROG_CXX_SUN],
[
  AC_CACHE_CHECK([whether we are using SUN CC compiler],
                 [glibmm_cv_prog_sun_cxx],
                 [AS_IF([${CXX-g++} -V 2>&1 | grep -e 'Sun WorkShop' >/dev/null 2>&1],
                        [glibmm_cv_prog_sun_cxx='yes'],
                        [glibmm_cv_prog_sun_cxx='no']
                       )
                 ]
                )

  AS_VAR_IF([glibmm_cv_prog_sun_cxx], ['yes'],
            [AC_DEFINE([GLIBMM_COMPILER_SUN_FORTE], [1],
                       [Defined when the SUN Forte C++ compiler is being used.])])[]dnl
])
