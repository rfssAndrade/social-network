# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/downloads/libmemcached"
  "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/build-libmemcached"
  "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/src/generate-libmemcached-prefix"
  "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/src/generate-libmemcached-prefix/tmp"
  "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp"
  "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/downloads"
  "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/andraderf/development/new/deathstarbenchmirror/socialNetwork/cmake-build-debug/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp${cfgdir}") # cfgdir has leading slash
endif()
