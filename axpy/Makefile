CC = clang
CXX = clang++
CFLAGS = -O2 -g
OMP = -fopenmp
GTEST = -I/home/amunera/LLVMTesting/gtest_install/include -L/home/amunera/LLVMTesting/gtest_install/lib
GTEST_LIB = -lgtest
	
TDG = -fopenmp-taskgraph -static-tdg

BIN = axpy
all: $(BIN)


$(BIN): $(BIN).cpp
	$(CXX) -DTDG $(CFLAGS) $(GTEST) $(TDG) $(OMP) $^ -o axpy $(GTEST_LIB)

clean:
	rm -f $(BIN) *.o tdg.cpp tdg_*.dot
