CC			= clang
CXX			= clang++
OMP			= -fopenmp
CFLAGS	= -O3 -g
GTEST = -I$(GTEST_ROOT)/include -L$(GTEST_ROOT)/lib
GTEST_LIB = -lgtest
BIN			= prealloc
TDG     = -fopenmp-taskgraph -static-tdg

all: $(BIN)_gtest

$(BIN)_gtest: $(BIN).cpp
	$(CXX) $(CFLAGS) $^ $(OMP) $(TDG) -prealloc $(GTEST) $(GTEST_LIB) -o $@


clean:
	rm -f *.o $(BIN)_gtest tdg_*.dot tdg.cpp

