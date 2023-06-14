# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/downloads/libmemcached"
  "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/build-libmemcached"
  "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/src/generate-libmemcached-prefix"
  "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/src/generate-libmemcached-prefix/tmp"
  "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp"
  "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/downloads"
  "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "C:/Users/chawlar/temp/Merge/deathstarbenchmirror/socialNetwork/src/generate-libmemcached-prefix/src/generate-libmemcached-stamp${cfgdir}") # cfgdir has leading slash
endif()
