SHELL=/bin/sh

GTEST = -I$(GTEST_ROOT)/include -L$(GTEST_ROOT)/lib
GTEST_LIB = -lgtest

OMP = -fopenmp
TDG = -fopenmp-taskgraph

include ../config/make.def

tdg: unit_test

unit_test: ut_taskloop.cpp
	$(CC) $^ -o $@ $(OMP) $(TDG) $(GTEST) $(GTEST_LIB)

clean:
	- rm -f *.o *~ 
	- rm -f npbparams.hpp core
