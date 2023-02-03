CC = clang
CXX = clang++
CFLAGS = -O2 -g
OMP = -fopenmp
GTEST = -I$(GTEST_ROOT)/include -L$(GTEST_ROOT)/lib
GTEST_LIB = -lgtest
	
TDG = -fopenmp-taskgraph -static-tdg

BIN = axpy
all: $(BIN)_gtest $(BIN)_prealloc_gtest


$(BIN)_gtest: $(BIN).cpp
	$(CXX) -DTDG $(CFLAGS) $(GTEST) $(TDG) $(OMP) $^ -o $@ $(GTEST_LIB)

$(BIN)_prealloc_gtest: $(BIN)_prealloc.cpp
	$(CXX) -DTDG $(CFLAGS) $(GTEST) $(TDG) -prealloc $(OMP) $^ -o $@ $(GTEST_LIB)

clean:
	rm -f $(BIN)_gtest $(BIN)_prealloc_gtest *.o tdg.cpp tdg_*.dot
