SHELL=/bin/sh
BENCHMARK=cg
BENCHMARKU=CG

BENCHMARK_TASKLOOP=cg_taskloop
BENCHMARKU_TASKLOOP=CG_TASKLOOP

BENCHMARK_TASKLOOP_TDG=cg_taskloop_tdg
BENCHMARKU_TASKLOOP_TDG=CG_TASKLOOP_TDG

GTEST = -I$(GTEST_ROOT)/include -L$(GTEST_ROOT)/lib
GTEST_LIB = -lgtest

include ../config/make.def

OBJS = cg.o ${COMMON}/c_print_results.o  \
       ${COMMON}/c_${RAND}.o ${COMMON}/c_timers.o ${COMMON}/c_wtime.o

OBJS_TASKLOOP = cg_taskloop.o ${COMMON}/c_print_results.o  \
       ${COMMON}/c_${RAND}.o ${COMMON}/c_timers.o ${COMMON}/c_wtime.o

OBJS_TASKLOOP_TDG = cg_taskloop_tdg.o ${COMMON}/c_print_results.o  \
       ${COMMON}/c_${RAND}.o ${COMMON}/c_timers.o ${COMMON}/c_wtime.o

include ../sys/make.common

tdg: ${PROGRAM_TASKLOOP_TDG}
${PROGRAM}: config ${OBJS}
	${CLINK} ${CLINKFLAGS} -o ${PROGRAM} ${OBJS} ${C_LIB}

${PROGRAM_TASKLOOP}: config ${OBJS_TASKLOOP}
	${CLINK} ${CLINKFLAGS} -o ${PROGRAM_TASKLOOP} $(GTEST) ${OBJS_TASKLOOP} ${C_LIB} $(GTEST_LIB)

${PROGRAM_TASKLOOP_TDG}: config ${OBJS_TASKLOOP_TDG}
	${CLINK} ${CLINKFLAGS} -o ${PROGRAM_TASKLOOP_TDG} $(GTEST) ${OBJS_TASKLOOP_TDG} ${C_LIB} $(GTEST_LIB)

cg.o:             cg.cpp npbparams.hpp
	${CCOMPILE} cg.cpp

cg_taskloop.o:             cg_taskloop.cpp npbparams.hpp
	${CCOMPILE} cg_taskloop.cpp $(GTEST)

cg_taskloop_tdg.o:             cg_taskloop.cpp npbparams.hpp
	${CCOMPILE} -DTDG cg_taskloop.cpp $(GTEST) -fopenmp-taskgraph -o $@

clean:
	- rm -f *.o *~ 
	- rm -f npbparams.hpp core
