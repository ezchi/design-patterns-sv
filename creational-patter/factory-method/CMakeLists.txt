cmake_minimum_required(VERSION 3.12)
project(factory_method_example)

find_package(verilator HINTS $ENV{VERILATOR_ROOT} ${VERILATOR_ROOT})

if (NOT verilator_FOUND)
  message(FATAL_ERROR "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable")
endif()

# Create a new executable target that will contain all your sources
add_executable(example)

# Add the Verilated circuit to the target
verilate(example
  SOURCES factory-method-example.sv
  TOP_MODULE top)
