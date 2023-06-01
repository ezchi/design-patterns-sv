cmake_minimum_required(VERSION 3.12)
project(example)

find_package(verilator HINTS $ENV{VERILATOR_ROOT} ${VERILATOR_ROOT})

if (NOT verilator_FOUND)
  message(FATAL_ERROR "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable")
endif()

add_executable(example)

# Add the Verilated circuit to the target
verilate(example
  PREFIX example
  SOURCES builder-example.sv
  TOP_MODULE top
  VERILATOR_ARGS --main
)
