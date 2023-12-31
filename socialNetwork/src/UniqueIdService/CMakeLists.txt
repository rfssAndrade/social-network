find_package(opentelemetry-cpp CONFIG REQUIRED)
find_package(Protobuf REQUIRED)
find_package(nlohmann_json REQUIRED)
find_package(CURL REQUIRED)
find_package(gRPC REQUIRED)
find_package(absl REQUIRED)

add_executable(
    UniqueIdService
    UniqueIdService.cpp
    ${THRIFT_GEN_CPP_DIR}/UniqueIdService.cpp
    ${THRIFT_GEN_CPP_DIR}/ComposePostService.cpp
    ${THRIFT_GEN_CPP_DIR}/social_network_types.cpp
)

target_include_directories(
    UniqueIdService PRIVATE
    /usr/local/include/jaegertracing
    ${OPENTELEMETRY_CPP_INCLUDE_DIRS}
)

target_link_libraries(
    UniqueIdService
    nlohmann_json::nlohmann_json
    ${THRIFT_LIB}
    ${CMAKE_THREAD_LIBS_INIT}
    ${Boost_LIBRARIES}
    Boost::log
    Boost::log_setup
    jaegertracing
    ${OPENTELEMETRY_CPP_LIBRARIES}
)

install(TARGETS UniqueIdService DESTINATION ./)