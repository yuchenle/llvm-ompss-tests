CC = clang
CXX = clang++
CFLAGS = -O2 -g
OMP = -fopenmp
GTEST = -I/home/amunera/LLVMTesting/gtest_install/include -L/home/amunera/LLVMTesting/gtest_install/lib
GTEST_LIB = -lgtest
	
TDG = -fopenmp-taskgraph -static-tdg

BIN = axpy
all: $(BIN)_dynamic $(BIN)_static $(BIN)_dynamic_rerecording


$(BIN)_dynamic: $(BIN)_dynamic.cpp
	$(CXX) -DTDG $(CFLAGS) $(GTEST) -fopenmp-taskgraph $(OMP) $^ -o axpy_dynamic $(GTEST_LIB)

$(BIN)_static: $(BIN)_static.cpp
	$(CXX) -DTDG $(CFLAGS) $(GTEST) $(TDG) $(OMP) $^ -o axpy_static $(GTEST_LIB)

$(BIN)_dynamic_rerecording: $(BIN)_dynamic_rerecording.cpp
	$(CXX) -DTDG $(CFLAGS) $(GTEST) $(TDG) $(OMP) $^ -o axpy_dynamic_rerecording $(GTEST_LIB)

$(BIN)_multiple_dynamic: $(BIN)_multiple_dynamic.cpp
	$(CXX) -DTDG $(CFLAGS) $(GTEST) -fopenmp-taskgraph $(OMP) $^ -o axpy_multiple_dynamic $(GTEST_LIB)

clean:
	rm -f $(BIN)_static $(BIN)_dynamic $(BIN)_dynamic_rerecording $((BIN)_multiple_dynamic *.o tdg.cpp tdg_0.dot tdg_1.dot
