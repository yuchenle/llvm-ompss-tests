CC = clang
CFLAGS = -O2 -g
OMP = -fopenmp

TDG = -fopenmp-taskgraph -static-tdg

BIN = axpy
all: $(BIN)_dynamic $(BIN)_static $(BIN)_dynamic_rerecording


$(BIN)_dynamic: $(BIN)_dynamic.c
	$(CC) -DTDG $(CFLAGS) -fopenmp-taskgraph $(OMP) $^ -o axpy_dynamic

$(BIN)_static: $(BIN)_static.c
	$(CC) -DTDG $(CFLAGS) $(TDG) $(OMP) $^ -o axpy_static

$(BIN)_dynamic_rerecording: $(BIN)_dynamic_rerecording.c
	$(CC) -DTDG $(CFLAGS) $(TDG) $(OMP) $^ -o axpy_dynamic_rerecording

clean:
	rm -f $(BIN)_static $(BIN)_dynamic $(BIN)_dynamic_rerecording *.o tdg.cpp tdg_0.dot tdg_1.dot
