; ModuleID = 'cg_taskloop.cpp'
source_filename = "cg_taskloop.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.ident_t = type { i32, i32, i32, i32, i8* }
%struct.timeval = type { i64, i64 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, %struct._IO_codecvt*, %struct._IO_wide_data*, %struct._IO_FILE*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type opaque
%struct._IO_codecvt = type opaque
%struct._IO_wide_data = type opaque
%struct.anon = type { double**, double**, double**, double**, double** }
%struct.anon.1 = type { double** }
%struct.anon.5 = type { i32**, double**, double**, i32**, double** }
%struct.anon.9 = type { double**, double** }
%struct.anon.14 = type { double**, double**, double**, double** }
%struct.anon.19 = type { double**, double** }
%struct.anon.23 = type { i32**, double**, double**, i32**, double** }
%struct.anon.27 = type { double**, double** }
%struct.anon.0 = type { i8 }
%struct.kmp_task_t_with_privates = type { %struct.kmp_task_t, %struct..kmp_privates.t }
%struct.kmp_task_t = type { i8*, i32 (i32, i8*)*, i32, %union.kmp_cmplrdata_t, %union.kmp_cmplrdata_t, i64, i64, i64, i32, i8* }
%union.kmp_cmplrdata_t = type { i32 (i32, i8*)* }
%struct..kmp_privates.t = type { double*, double*, double*, double*, double* }
%struct.anon.2 = type { double* }
%struct.kmp_taskred_input_t = type { i8*, i8*, i64, i8*, i8*, i8*, i32 }
%struct.kmp_task_t_with_privates.3 = type { %struct.kmp_task_t, %struct..kmp_privates.t.4 }
%struct..kmp_privates.t.4 = type { double* }
%struct.anon.6 = type { i8 }
%struct.kmp_task_t_with_privates.7 = type { %struct.kmp_task_t, %struct..kmp_privates.t.8 }
%struct..kmp_privates.t.8 = type { double, i32*, double*, double*, i32*, double*, i32 }
%struct.anon.10 = type { double* }
%struct.kmp_taskred_input_t.11 = type { i8*, i8*, i64, i8*, i8*, i8*, i32 }
%struct.kmp_task_t_with_privates.12 = type { %struct.kmp_task_t, %struct..kmp_privates.t.13 }
%struct..kmp_privates.t.13 = type { double*, double* }
%struct.anon.15 = type { double* }
%struct.kmp_taskred_input_t.16 = type { i8*, i8*, i64, i8*, i8*, i8*, i32 }
%struct.kmp_task_t_with_privates.17 = type { %struct.kmp_task_t, %struct..kmp_privates.t.18 }
%struct..kmp_privates.t.18 = type { double*, double*, double*, double* }
%struct.anon.20 = type { i8 }
%struct.kmp_task_t_with_privates.21 = type { %struct.kmp_task_t, %struct..kmp_privates.t.22 }
%struct..kmp_privates.t.22 = type { double*, double* }
%struct.anon.24 = type { i8 }
%struct.kmp_task_t_with_privates.25 = type { %struct.kmp_task_t, %struct..kmp_privates.t.26 }
%struct..kmp_privates.t.26 = type { double, i32*, double*, double*, i32*, double*, i32 }
%struct.anon.28 = type { double* }
%struct.kmp_taskred_input_t.29 = type { i8*, i8*, i64, i8*, i8*, i8*, i32 }
%struct.kmp_task_t_with_privates.30 = type { %struct.kmp_task_t, %struct..kmp_privates.t.31 }
%struct..kmp_privates.t.31 = type { double, double*, double* }

$__clang_call_terminate = comdat any

@numThreads = dso_local global i32 0, align 4
@_ZL6colidx = internal global i32* null, align 8
@_ZL6rowstr = internal global i32* null, align 8
@_ZL2iv = internal global i32* null, align 8
@_ZL4arow = internal global i32* null, align 8
@_ZL4acol = internal global i32* null, align 8
@_ZL4aelt = internal global double* null, align 8
@_ZL1a = internal global double* null, align 8
@_ZL1x = internal global double* null, align 8
@_ZL1z = internal global double* null, align 8
@_ZL1p = internal global double* null, align 8
@_ZL1q = internal global double* null, align 8
@_ZL1r = internal global double* null, align 8
@.str = private unnamed_addr constant [11 x i8] c"timer.flag\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@_ZL7timeron = internal global i32 0, align 4
@.str.14 = private unnamed_addr constant [5 x i8] c"init\00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c"benchmk\00", align 1
@.str.16 = private unnamed_addr constant [7 x i8] c"conjgd\00", align 1
@_ZL8firstrow = internal global i32 0, align 4
@_ZL7lastrow = internal global i32 0, align 4
@_ZL8firstcol = internal global i32 0, align 4
@_ZL7lastcol = internal global i32 0, align 4
@.str.17 = private unnamed_addr constant [81 x i8] c"\0A\0A NAS Parallel Benchmarks 4.1 Parallel C++ version with OpenMP - CG Benchmark\0A\0A\00", align 1
@.str.18 = private unnamed_addr constant [13 x i8] c" Size: %11d\0A\00", align 1
@.str.19 = private unnamed_addr constant [18 x i8] c" Iterations: %5d\0A\00", align 1
@_ZL3naa = internal global i32 0, align 4
@_ZL3nzz = internal global i32 0, align 4
@_ZL4tran = internal global double 0.000000e+00, align 8
@_ZL5amult = internal global double 0.000000e+00, align 8
@0 = private unnamed_addr constant [23 x i8] c";unknown;unknown;0;0;;\00", align 1
@1 = private unnamed_addr constant %struct.ident_t { i32 0, i32 514, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@2 = private unnamed_addr constant %struct.ident_t { i32 0, i32 2, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@3 = private unnamed_addr constant %struct.ident_t { i32 0, i32 322, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@.gomp_critical_user_.reduction.var = common global [8 x i32] zeroinitializer
@4 = private unnamed_addr constant %struct.ident_t { i32 0, i32 18, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@5 = private unnamed_addr constant %struct.ident_t { i32 0, i32 66, i32 0, i32 22, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @0, i32 0, i32 0) }, align 8
@.str.20 = private unnamed_addr constant [39 x i8] c" Initialization time = %15.3f seconds\0A\00", align 1
@.str.22 = private unnamed_addr constant [52 x i8] c"\0A   iteration           ||r||                 zeta\0A\00", align 1
@.str.23 = private unnamed_addr constant [30 x i8] c"    %5d       %20.14e%20.13e\0A\00", align 1
@.str.24 = private unnamed_addr constant [27 x i8] c"iteration %d took %ld us \0A\00", align 1
@.str.25 = private unnamed_addr constant [22 x i8] c" Benchmark completed\0A\00", align 1
@.str.26 = private unnamed_addr constant [26 x i8] c" VERIFICATION SUCCESSFUL\0A\00", align 1
@.str.27 = private unnamed_addr constant [21 x i8] c" Zeta is    %20.13e\0A\00", align 1
@.str.28 = private unnamed_addr constant [21 x i8] c" Error is   %20.13e\0A\00", align 1
@.str.29 = private unnamed_addr constant [22 x i8] c" VERIFICATION FAILED\0A\00", align 1
@.str.30 = private unnamed_addr constant [30 x i8] c" Zeta                %20.13e\0A\00", align 1
@.str.31 = private unnamed_addr constant [30 x i8] c" The correct zeta is %20.13e\0A\00", align 1
@.str.32 = private unnamed_addr constant [23 x i8] c" Problem size unknown\0A\00", align 1
@.str.33 = private unnamed_addr constant [28 x i8] c" NO VERIFICATION PERFORMED\0A\00", align 1
@.str.34 = private unnamed_addr constant [16 x i8] c"OMP_NUM_THREADS\00", align 1
@.str.35 = private unnamed_addr constant [2 x i8] c"1\00", align 1
@.str.36 = private unnamed_addr constant [3 x i8] c"CG\00", align 1
@.str.37 = private unnamed_addr constant [25 x i8] c"          floating point\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"4.1\00", align 1
@.str.39 = private unnamed_addr constant [12 x i8] c"16 Jan 2023\00", align 1
@.str.40 = private unnamed_addr constant [7 x i8] c"15.0.0\00", align 1
@.str.41 = private unnamed_addr constant [7 x i8] c"201811\00", align 1
@.str.42 = private unnamed_addr constant [19 x i8] c"clang++ -std=c++14\00", align 1
@.str.43 = private unnamed_addr constant [6 x i8] c"$(CC)\00", align 1
@.str.44 = private unnamed_addr constant [4 x i8] c"-lm\00", align 1
@.str.45 = private unnamed_addr constant [13 x i8] c"-I../common \00", align 1
@.str.46 = private unnamed_addr constant [32 x i8] c"-O3 -fopenmp -mcmodel=medium -g\00", align 1
@.str.47 = private unnamed_addr constant [7 x i8] c"randdp\00", align 1
@.str.48 = private unnamed_addr constant [25 x i8] c"  SECTION   Time (secs)\0A\00", align 1
@.str.49 = private unnamed_addr constant [13 x i8] c"  %8s:%9.3f\0A\00", align 1
@.str.50 = private unnamed_addr constant [24 x i8] c"  %8s:%9.3f  (%6.2f%%)\0A\00", align 1
@.str.51 = private unnamed_addr constant [30 x i8] c"    --> %8s:%9.3f  (%6.2f%%)\0A\00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c"rest\00", align 1
@.str.53 = private unnamed_addr constant [46 x i8] c"Space for matrix elements exceeded in sparse\0A\00", align 1
@.str.54 = private unnamed_addr constant [21 x i8] c"nza, nzmax = %d, %d\0A\00", align 1
@.str.55 = private unnamed_addr constant [32 x i8] c"internal error in sparse: i=%d\0A\00", align 1
@_ZZL9conj_gradPiS_PdS0_S0_S0_S0_S0_S0_E4rho0 = internal global double 0.000000e+00, align 8
@_ZL3rho = internal global double 0.000000e+00, align 8
@_ZL3sum = internal global double 0.000000e+00, align 8
@__replication_architecture_minimum = weak constant i32 -1, align 4
@_ZL1d = internal global double 0.000000e+00, align 8
@_ZL5alpha = internal global double 0.000000e+00, align 8
@_ZL4beta = internal global double 0.000000e+00, align 8
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [{ i32, void ()*, i8* } { i32 65535, void ()* @_GLOBAL__sub_I_cg_taskloop.cpp, i8* null }]

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init() #0 section ".text.startup" {
  %1 = call i32 @omp_get_num_procs()
  %2 = mul nsw i32 %1, 4
  store i32 %2, i32* @numThreads, align 4
  ret void
}

declare dso_local i32 @omp_get_num_procs() #1

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.1() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 153600000) #18
  %2 = bitcast i8* %1 to i32*
  store i32* %2, i32** @_ZL6colidx, align 8
  ret void
}

; Function Attrs: nounwind allocsize(0)
declare dso_local noalias i8* @malloc(i64 noundef) #2

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.2() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 600004) #18
  %2 = bitcast i8* %1 to i32*
  store i32* %2, i32** @_ZL6rowstr, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.3() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 600000) #18
  %2 = bitcast i8* %1 to i32*
  store i32* %2, i32** @_ZL2iv, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.4() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 600000) #18
  %2 = bitcast i8* %1 to i32*
  store i32* %2, i32** @_ZL4arow, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.5() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 9600000) #18
  %2 = bitcast i8* %1 to i32*
  store i32* %2, i32** @_ZL4acol, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.6() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 19200000) #18
  %2 = bitcast i8* %1 to double*
  store double* %2, double** @_ZL4aelt, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.7() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 307200000) #18
  %2 = bitcast i8* %1 to double*
  store double* %2, double** @_ZL1a, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.8() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 1200016) #18
  %2 = bitcast i8* %1 to double*
  store double* %2, double** @_ZL1x, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.9() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 1200016) #18
  %2 = bitcast i8* %1 to double*
  store double* %2, double** @_ZL1z, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.10() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 1200016) #18
  %2 = bitcast i8* %1 to double*
  store double* %2, double** @_ZL1p, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.11() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 1200016) #18
  %2 = bitcast i8* %1 to double*
  store double* %2, double** @_ZL1q, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @__cxx_global_var_init.12() #0 section ".text.startup" {
  %1 = call noalias align 16 i8* @malloc(i64 noundef 1200016) #18
  %2 = bitcast i8* %1 to double*
  store double* %2, double** @_ZL1r, align 8
  ret void
}

; Function Attrs: mustprogress noinline norecurse optnone uwtable
define dso_local noundef i32 @main(i32 noundef %0, i8** noundef %1) #3 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca i8, align 1
  %18 = alloca i32, align 4
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca double, align 8
  %22 = alloca [3 x i8*], align 16
  %23 = alloca %struct.timeval, align 8
  %24 = alloca %struct.timeval, align 8
  %25 = alloca %struct._IO_FILE*, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 0, i32* %6, align 4
  br label %26

26:                                               ; preds = %31, %2
  %27 = load i32, i32* %6, align 4
  %28 = icmp slt i32 %27, 3
  br i1 %28, label %29, label %34

29:                                               ; preds = %26
  %30 = load i32, i32* %6, align 4
  call void @_Z11timer_cleari(i32 noundef %30)
  br label %31

31:                                               ; preds = %29
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %6, align 4
  br label %26, !llvm.loop !5

34:                                               ; preds = %26
  %35 = call noalias %struct._IO_FILE* @fopen(i8* noundef getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i64 0, i64 0))
  store %struct._IO_FILE* %35, %struct._IO_FILE** %25, align 8
  %36 = icmp ne %struct._IO_FILE* %35, null
  br i1 %36, label %37, label %43

37:                                               ; preds = %34
  store i32 1, i32* @_ZL7timeron, align 4
  %38 = getelementptr inbounds [3 x i8*], [3 x i8*]* %22, i64 0, i64 0
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.14, i64 0, i64 0), i8** %38, align 16
  %39 = getelementptr inbounds [3 x i8*], [3 x i8*]* %22, i64 0, i64 1
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i64 0, i64 0), i8** %39, align 8
  %40 = getelementptr inbounds [3 x i8*], [3 x i8*]* %22, i64 0, i64 2
  store i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.16, i64 0, i64 0), i8** %40, align 16
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** %25, align 8
  %42 = call i32 @fclose(%struct._IO_FILE* noundef %41)
  br label %44

43:                                               ; preds = %34
  store i32 0, i32* @_ZL7timeron, align 4
  br label %44

44:                                               ; preds = %43, %37
  call void @_Z11timer_starti(i32 noundef 0)
  store i32 0, i32* @_ZL8firstrow, align 4
  store i32 149999, i32* @_ZL7lastrow, align 4
  store i32 0, i32* @_ZL8firstcol, align 4
  store i32 149999, i32* @_ZL7lastcol, align 4
  store i8 67, i8* %17, align 1
  store double 0x403CF93E375478D3, double* %19, align 8
  %45 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([81 x i8], [81 x i8]* @.str.17, i64 0, i64 0))
  %46 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.18, i64 0, i64 0), i32 noundef 150000)
  %47 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([18 x i8], [18 x i8]* @.str.19, i64 0, i64 0), i32 noundef 75)
  store i32 150000, i32* @_ZL3naa, align 4
  store i32 38400000, i32* @_ZL3nzz, align 4
  store double 0x41B2B9B0A1000000, double* @_ZL4tran, align 8
  store double 0x41D2309CE5400000, double* @_ZL5amult, align 8
  %48 = load double, double* @_ZL5amult, align 8
  %49 = call noundef double @_Z6randlcPdd(double* noundef @_ZL4tran, double noundef %48)
  store double %49, double* %10, align 8
  %50 = load i32, i32* @_ZL3naa, align 4
  %51 = load i32, i32* @_ZL3nzz, align 4
  %52 = load double*, double** @_ZL1a, align 8
  %53 = load i32*, i32** @_ZL6colidx, align 8
  %54 = load i32*, i32** @_ZL6rowstr, align 8
  %55 = load i32, i32* @_ZL8firstrow, align 4
  %56 = load i32, i32* @_ZL7lastrow, align 4
  %57 = load i32, i32* @_ZL8firstcol, align 4
  %58 = load i32, i32* @_ZL7lastcol, align 4
  %59 = load i32*, i32** @_ZL4arow, align 8
  %60 = load i32*, i32** @_ZL4acol, align 8
  %61 = bitcast i32* %60 to i8*
  %62 = bitcast i8* %61 to [16 x i32]*
  %63 = load double*, double** @_ZL4aelt, align 8
  %64 = bitcast double* %63 to i8*
  %65 = bitcast i8* %64 to [16 x double]*
  %66 = load i32*, i32** @_ZL2iv, align 8
  call void @_ZL5makeaiiPdPiS0_iiiiS0_PA16_iPA16_dS0_(i32 noundef %50, i32 noundef %51, double* noundef %52, i32* noundef %53, i32* noundef %54, i32 noundef %55, i32 noundef %56, i32 noundef %57, i32 noundef %58, i32* noundef %59, [16 x i32]* noundef %62, [16 x double]* noundef %65, i32* noundef %66)
  call void (%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) @__kmpc_fork_call(%struct.ident_t* @2, i32 6, void (i32*, i32*, ...)* bitcast (void (i32*, i32*, double*, double*, double*, double*, %struct.timeval*, %struct.timeval*)* @.omp_outlined. to void (i32*, i32*, ...)*), double* %10, double* %11, double* %12, double* %13, %struct.timeval* %23, %struct.timeval* %24)
  call void @_Z10timer_stopi(i32 noundef 1)
  %67 = call noundef double @_Z10timer_readi(i32 noundef 1)
  store double %67, double* %14, align 8
  %68 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0))
  store double 1.000000e-10, double* %20, align 8
  %69 = load i8, i8* %17, align 1
  %70 = sext i8 %69 to i32
  %71 = icmp ne i32 %70, 85
  br i1 %71, label %72, label %95

72:                                               ; preds = %44
  %73 = load double, double* %10, align 8
  %74 = load double, double* %19, align 8
  %75 = fsub double %73, %74
  %76 = call double @llvm.fabs.f64(double %75)
  %77 = load double, double* %19, align 8
  %78 = fdiv double %76, %77
  store double %78, double* %21, align 8
  %79 = load double, double* %21, align 8
  %80 = load double, double* %20, align 8
  %81 = fcmp ole double %79, %80
  br i1 %81, label %82, label %88

82:                                               ; preds = %72
  store i32 1, i32* %18, align 4
  %83 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([26 x i8], [26 x i8]* @.str.26, i64 0, i64 0))
  %84 = load double, double* %10, align 8
  %85 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.27, i64 0, i64 0), double noundef %84)
  %86 = load double, double* %21, align 8
  %87 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.28, i64 0, i64 0), double noundef %86)
  br label %94

88:                                               ; preds = %72
  store i32 0, i32* %18, align 4
  %89 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([22 x i8], [22 x i8]* @.str.29, i64 0, i64 0))
  %90 = load double, double* %10, align 8
  %91 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.30, i64 0, i64 0), double noundef %90)
  %92 = load double, double* %19, align 8
  %93 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.31, i64 0, i64 0), double noundef %92)
  br label %94

94:                                               ; preds = %88, %82
  br label %98

95:                                               ; preds = %44
  store i32 0, i32* %18, align 4
  %96 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([23 x i8], [23 x i8]* @.str.32, i64 0, i64 0))
  %97 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([28 x i8], [28 x i8]* @.str.33, i64 0, i64 0))
  br label %98

98:                                               ; preds = %95, %94
  %99 = load double, double* %14, align 8
  %100 = fcmp une double %99, 0.000000e+00
  br i1 %100, label %101, label %105

101:                                              ; preds = %98
  %102 = load double, double* %14, align 8
  %103 = fdiv double 0x4240B016A1F00000, %102
  %104 = fdiv double %103, 1.000000e+06
  store double %104, double* %15, align 8
  br label %106

105:                                              ; preds = %98
  store double 0.000000e+00, double* %15, align 8
  br label %106

106:                                              ; preds = %105, %101
  %107 = call i32 @setenv(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.34, i64 0, i64 0), i8* noundef getelementptr inbounds ([2 x i8], [2 x i8]* @.str.35, i64 0, i64 0), i32 noundef 0) #6
  %108 = load i8, i8* %17, align 1
  %109 = load double, double* %14, align 8
  %110 = load double, double* %15, align 8
  %111 = load i32, i32* %18, align 4
  %112 = call i8* @getenv(i8* noundef getelementptr inbounds ([16 x i8], [16 x i8]* @.str.34, i64 0, i64 0)) #6
  call void @_Z15c_print_resultsPcciiiiddS_iS_S_S_S_S_S_S_S_S_S_S_S_(i8* noundef getelementptr inbounds ([3 x i8], [3 x i8]* @.str.36, i64 0, i64 0), i8 noundef signext %108, i32 noundef 150000, i32 noundef 0, i32 noundef 0, i32 noundef 75, double noundef %109, double noundef %110, i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.37, i64 0, i64 0), i32 noundef %111, i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i64 0, i64 0), i8* noundef getelementptr inbounds ([12 x i8], [12 x i8]* @.str.39, i64 0, i64 0), i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.40, i64 0, i64 0), i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.41, i64 0, i64 0), i8* noundef %112, i8* noundef getelementptr inbounds ([19 x i8], [19 x i8]* @.str.42, i64 0, i64 0), i8* noundef getelementptr inbounds ([6 x i8], [6 x i8]* @.str.43, i64 0, i64 0), i8* noundef getelementptr inbounds ([4 x i8], [4 x i8]* @.str.44, i64 0, i64 0), i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.45, i64 0, i64 0), i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.46, i64 0, i64 0), i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.46, i64 0, i64 0), i8* noundef getelementptr inbounds ([7 x i8], [7 x i8]* @.str.47, i64 0, i64 0))
  %113 = load i32, i32* @_ZL7timeron, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %166

115:                                              ; preds = %106
  %116 = call noundef double @_Z10timer_readi(i32 noundef 1)
  store double %116, double* %16, align 8
  %117 = load double, double* %16, align 8
  %118 = fcmp oeq double %117, 0.000000e+00
  br i1 %118, label %119, label %120

119:                                              ; preds = %115
  store double 1.000000e+00, double* %16, align 8
  br label %120

120:                                              ; preds = %119, %115
  %121 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([25 x i8], [25 x i8]* @.str.48, i64 0, i64 0))
  store i32 0, i32* %6, align 4
  br label %122

122:                                              ; preds = %162, %120
  %123 = load i32, i32* %6, align 4
  %124 = icmp slt i32 %123, 3
  br i1 %124, label %125, label %165

125:                                              ; preds = %122
  %126 = load i32, i32* %6, align 4
  %127 = call noundef double @_Z10timer_readi(i32 noundef %126)
  store double %127, double* %14, align 8
  %128 = load i32, i32* %6, align 4
  %129 = icmp eq i32 %128, 0
  br i1 %129, label %130, label %137

130:                                              ; preds = %125
  %131 = load i32, i32* %6, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [3 x i8*], [3 x i8*]* %22, i64 0, i64 %132
  %134 = load i8*, i8** %133, align 8
  %135 = load double, double* %14, align 8
  %136 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([13 x i8], [13 x i8]* @.str.49, i64 0, i64 0), i8* noundef %134, double noundef %135)
  br label %161

137:                                              ; preds = %125
  %138 = load i32, i32* %6, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [3 x i8*], [3 x i8*]* %22, i64 0, i64 %139
  %141 = load i8*, i8** %140, align 8
  %142 = load double, double* %14, align 8
  %143 = load double, double* %14, align 8
  %144 = fmul double %143, 1.000000e+02
  %145 = load double, double* %16, align 8
  %146 = fdiv double %144, %145
  %147 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([24 x i8], [24 x i8]* @.str.50, i64 0, i64 0), i8* noundef %141, double noundef %142, double noundef %146)
  %148 = load i32, i32* %6, align 4
  %149 = icmp eq i32 %148, 2
  br i1 %149, label %150, label %160

150:                                              ; preds = %137
  %151 = load double, double* %16, align 8
  %152 = load double, double* %14, align 8
  %153 = fsub double %151, %152
  store double %153, double* %14, align 8
  %154 = load double, double* %14, align 8
  %155 = load double, double* %14, align 8
  %156 = fmul double %155, 1.000000e+02
  %157 = load double, double* %16, align 8
  %158 = fdiv double %156, %157
  %159 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.51, i64 0, i64 0), i8* noundef getelementptr inbounds ([5 x i8], [5 x i8]* @.str.52, i64 0, i64 0), double noundef %154, double noundef %158)
  br label %160

160:                                              ; preds = %150, %137
  br label %161

161:                                              ; preds = %160, %130
  br label %162

162:                                              ; preds = %161
  %163 = load i32, i32* %6, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %6, align 4
  br label %122, !llvm.loop !7

165:                                              ; preds = %122
  br label %166

166:                                              ; preds = %165, %106
  ret i32 0
}

declare dso_local void @_Z11timer_cleari(i32 noundef) #1

declare dso_local noalias %struct._IO_FILE* @fopen(i8* noundef, i8* noundef) #1

declare dso_local i32 @fclose(%struct._IO_FILE* noundef) #1

declare dso_local void @_Z11timer_starti(i32 noundef) #1

declare dso_local i32 @printf(i8* noundef, ...) #1

declare dso_local noundef double @_Z6randlcPdd(double* noundef, double noundef) #1

; Function Attrs: mustprogress noinline optnone uwtable
define internal void @_ZL5makeaiiPdPiS0_iiiiS0_PA16_iPA16_dS0_(i32 noundef %0, i32 noundef %1, double* noundef %2, i32* noundef %3, i32* noundef %4, i32 noundef %5, i32 noundef %6, i32 noundef %7, i32 noundef %8, i32* noundef %9, [16 x i32]* noundef %10, [16 x double]* noundef %11, i32* noundef %12) #4 {
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca double*, align 8
  %17 = alloca i32*, align 8
  %18 = alloca i32*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32*, align 8
  %24 = alloca [16 x i32]*, align 8
  %25 = alloca [16 x double]*, align 8
  %26 = alloca i32*, align 8
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca [16 x i32], align 16
  %32 = alloca [16 x double], align 16
  store i32 %0, i32* %14, align 4
  store i32 %1, i32* %15, align 4
  store double* %2, double** %16, align 8
  store i32* %3, i32** %17, align 8
  store i32* %4, i32** %18, align 8
  store i32 %5, i32* %19, align 4
  store i32 %6, i32* %20, align 4
  store i32 %7, i32* %21, align 4
  store i32 %8, i32* %22, align 4
  store i32* %9, i32** %23, align 8
  store [16 x i32]* %10, [16 x i32]** %24, align 8
  store [16 x double]* %11, [16 x double]** %25, align 8
  store i32* %12, i32** %26, align 8
  store i32 1, i32* %30, align 4
  br label %33

33:                                               ; preds = %36, %13
  %34 = load i32, i32* %30, align 4
  %35 = mul nsw i32 2, %34
  store i32 %35, i32* %30, align 4
  br label %36

36:                                               ; preds = %33
  %37 = load i32, i32* %30, align 4
  %38 = load i32, i32* %14, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %33, label %40, !llvm.loop !8

40:                                               ; preds = %36
  store i32 0, i32* %27, align 4
  br label %41

41:                                               ; preds = %93, %40
  %42 = load i32, i32* %27, align 4
  %43 = load i32, i32* %14, align 4
  %44 = icmp slt i32 %42, %43
  br i1 %44, label %45, label %96

45:                                               ; preds = %41
  store i32 15, i32* %29, align 4
  %46 = load i32, i32* %14, align 4
  %47 = load i32, i32* %29, align 4
  %48 = load i32, i32* %30, align 4
  %49 = getelementptr inbounds [16 x double], [16 x double]* %32, i64 0, i64 0
  %50 = getelementptr inbounds [16 x i32], [16 x i32]* %31, i64 0, i64 0
  call void @_ZL6sprnvciiiPdPi(i32 noundef %46, i32 noundef %47, i32 noundef %48, double* noundef %49, i32* noundef %50)
  %51 = load i32, i32* %14, align 4
  %52 = getelementptr inbounds [16 x double], [16 x double]* %32, i64 0, i64 0
  %53 = getelementptr inbounds [16 x i32], [16 x i32]* %31, i64 0, i64 0
  %54 = load i32, i32* %27, align 4
  %55 = add nsw i32 %54, 1
  call void @_ZL6vecsetiPdPiS0_id(i32 noundef %51, double* noundef %52, i32* noundef %53, i32* noundef %29, i32 noundef %55, double noundef 5.000000e-01)
  %56 = load i32, i32* %29, align 4
  %57 = load i32*, i32** %23, align 8
  %58 = load i32, i32* %27, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds i32, i32* %57, i64 %59
  store i32 %56, i32* %60, align 4
  store i32 0, i32* %28, align 4
  br label %61

61:                                               ; preds = %89, %45
  %62 = load i32, i32* %28, align 4
  %63 = load i32, i32* %29, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %92

65:                                               ; preds = %61
  %66 = load i32, i32* %28, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [16 x i32], [16 x i32]* %31, i64 0, i64 %67
  %69 = load i32, i32* %68, align 4
  %70 = sub nsw i32 %69, 1
  %71 = load [16 x i32]*, [16 x i32]** %24, align 8
  %72 = load i32, i32* %27, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [16 x i32], [16 x i32]* %71, i64 %73
  %75 = load i32, i32* %28, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [16 x i32], [16 x i32]* %74, i64 0, i64 %76
  store i32 %70, i32* %77, align 4
  %78 = load i32, i32* %28, align 4
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds [16 x double], [16 x double]* %32, i64 0, i64 %79
  %81 = load double, double* %80, align 8
  %82 = load [16 x double]*, [16 x double]** %25, align 8
  %83 = load i32, i32* %27, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [16 x double], [16 x double]* %82, i64 %84
  %86 = load i32, i32* %28, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [16 x double], [16 x double]* %85, i64 0, i64 %87
  store double %81, double* %88, align 8
  br label %89

89:                                               ; preds = %65
  %90 = load i32, i32* %28, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %28, align 4
  br label %61, !llvm.loop !9

92:                                               ; preds = %61
  br label %93

93:                                               ; preds = %92
  %94 = load i32, i32* %27, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %27, align 4
  br label %41, !llvm.loop !10

96:                                               ; preds = %41
  %97 = load double*, double** %16, align 8
  %98 = load i32*, i32** %17, align 8
  %99 = load i32*, i32** %18, align 8
  %100 = load i32, i32* %14, align 4
  %101 = load i32, i32* %15, align 4
  %102 = load i32*, i32** %23, align 8
  %103 = load [16 x i32]*, [16 x i32]** %24, align 8
  %104 = load [16 x double]*, [16 x double]** %25, align 8
  %105 = load i32, i32* %19, align 4
  %106 = load i32, i32* %20, align 4
  %107 = load i32*, i32** %26, align 8
  call void @_ZL6sparsePdPiS0_iiiS0_PA16_iPA16_diiS0_dd(double* noundef %97, i32* noundef %98, i32* noundef %99, i32 noundef %100, i32 noundef %101, i32 noundef 15, i32* noundef %102, [16 x i32]* noundef %103, [16 x double]* noundef %104, i32 noundef %105, i32 noundef %106, i32* noundef %107, double noundef 1.000000e-01, double noundef 1.100000e+02)
  ret void
}

; Function Attrs: noinline norecurse nounwind optnone uwtable
define internal void @.omp_outlined.(i32* noalias noundef %0, i32* noalias noundef %1, double* noundef nonnull align 8 dereferenceable(8) %2, double* noundef nonnull align 8 dereferenceable(8) %3, double* noundef nonnull align 8 dereferenceable(8) %4, double* noundef nonnull align 8 dereferenceable(8) %5, %struct.timeval* noundef nonnull align 8 dereferenceable(16) %6, %struct.timeval* noundef nonnull align 8 dereferenceable(16) %7) #5 personality i8* bitcast (i32 (...)* @__gxx_personality_v0 to i8*) {
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double*, align 8
  %14 = alloca double*, align 8
  %15 = alloca %struct.timeval*, align 8
  %16 = alloca %struct.timeval*, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  %46 = alloca i32, align 4
  %47 = alloca i32, align 4
  %48 = alloca i32, align 4
  %49 = alloca i32, align 4
  %50 = alloca i32, align 4
  %51 = alloca i32, align 4
  %52 = alloca i32, align 4
  %53 = alloca i32, align 4
  %54 = alloca i32, align 4
  %55 = alloca i32, align 4
  %56 = alloca i32, align 4
  %57 = alloca double, align 8
  %58 = alloca double, align 8
  %59 = alloca i32, align 4
  %60 = alloca [2 x i8*], align 8
  %61 = alloca double, align 8
  %62 = alloca double, align 8
  %63 = alloca double, align 8
  %64 = alloca double, align 8
  %65 = alloca i32, align 4
  %66 = alloca i32, align 4
  %67 = alloca i32, align 4
  %68 = alloca i32, align 4
  %69 = alloca i32, align 4
  %70 = alloca i32, align 4
  %71 = alloca i32, align 4
  %72 = alloca i32, align 4
  %73 = alloca i32, align 4
  %74 = alloca i32, align 4
  %75 = alloca i32, align 4
  %76 = alloca i32, align 4
  %77 = alloca i32, align 4
  %78 = alloca i32, align 4
  %79 = alloca i32, align 4
  %80 = alloca i32, align 4
  %81 = alloca i32, align 4
  %82 = alloca i32, align 4
  %83 = alloca i32, align 4
  %84 = alloca i32, align 4
  %85 = alloca i32, align 4
  %86 = alloca i32, align 4
  %87 = alloca i32, align 4
  %88 = alloca i32, align 4
  %89 = alloca i32, align 4
  %90 = alloca i32, align 4
  %91 = alloca double, align 8
  %92 = alloca double, align 8
  %93 = alloca i32, align 4
  %94 = alloca [2 x i8*], align 8
  %95 = alloca double, align 8
  %96 = alloca double, align 8
  %97 = alloca double, align 8
  %98 = alloca double, align 8
  %99 = alloca i32, align 4
  %100 = alloca i32, align 4
  %101 = alloca i32, align 4
  %102 = alloca i32, align 4
  %103 = alloca i32, align 4
  %104 = alloca i32, align 4
  %105 = alloca i32, align 4
  %106 = alloca i32, align 4
  %107 = alloca i32, align 4
  %108 = alloca i32, align 4
  store i32* %0, i32** %9, align 8
  store i32* %1, i32** %10, align 8
  store double* %2, double** %11, align 8
  store double* %3, double** %12, align 8
  store double* %4, double** %13, align 8
  store double* %5, double** %14, align 8
  store %struct.timeval* %6, %struct.timeval** %15, align 8
  store %struct.timeval* %7, %struct.timeval** %16, align 8
  %109 = load double*, double** %11, align 8
  %110 = load double*, double** %12, align 8
  %111 = load double*, double** %13, align 8
  %112 = load double*, double** %14, align 8
  %113 = load %struct.timeval*, %struct.timeval** %15, align 8
  %114 = load %struct.timeval*, %struct.timeval** %16, align 8
  %115 = load i32, i32* @_ZL7lastrow, align 4
  %116 = load i32, i32* @_ZL8firstrow, align 4
  %117 = sub nsw i32 %115, %116
  %118 = add nsw i32 %117, 1
  store i32 %118, i32* %23, align 4
  %119 = load i32, i32* %23, align 4
  %120 = sub nsw i32 %119, 0
  %121 = sdiv i32 %120, 1
  %122 = sub nsw i32 %121, 1
  store i32 %122, i32* %24, align 4
  store i32 0, i32* %25, align 4
  %123 = load i32, i32* %23, align 4
  %124 = icmp slt i32 0, %123
  br i1 %124, label %125, label %185

125:                                              ; preds = %8
  store i32 0, i32* %26, align 4
  %126 = load i32, i32* %24, align 4
  store i32 %126, i32* %27, align 4
  store i32 1, i32* %28, align 4
  store i32 0, i32* %29, align 4
  %127 = load i32*, i32** %9, align 8
  %128 = load i32, i32* %127, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %128, i32 34, i32* %29, i32* %26, i32* %27, i32* %28, i32 1, i32 1)
  %129 = load i32, i32* %27, align 4
  %130 = load i32, i32* %24, align 4
  %131 = icmp sgt i32 %129, %130
  br i1 %131, label %132, label %134

132:                                              ; preds = %125
  %133 = load i32, i32* %24, align 4
  br label %136

134:                                              ; preds = %125
  %135 = load i32, i32* %27, align 4
  br label %136

136:                                              ; preds = %134, %132
  %137 = phi i32 [ %133, %132 ], [ %135, %134 ]
  store i32 %137, i32* %27, align 4
  %138 = load i32, i32* %26, align 4
  store i32 %138, i32* %21, align 4
  br label %139

139:                                              ; preds = %178, %136
  %140 = load i32, i32* %21, align 4
  %141 = load i32, i32* %27, align 4
  %142 = icmp sle i32 %140, %141
  br i1 %142, label %143, label %181

143:                                              ; preds = %139
  %144 = load i32, i32* %21, align 4
  %145 = mul nsw i32 %144, 1
  %146 = add nsw i32 0, %145
  store i32 %146, i32* %30, align 4
  %147 = load i32*, i32** @_ZL6rowstr, align 8
  %148 = load i32, i32* %30, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32* %147, i64 %149
  %151 = load i32, i32* %150, align 4
  store i32 %151, i32* %20, align 4
  br label %152

152:                                              ; preds = %173, %143
  %153 = load i32, i32* %20, align 4
  %154 = load i32*, i32** @_ZL6rowstr, align 8
  %155 = load i32, i32* %30, align 4
  %156 = add nsw i32 %155, 1
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds i32, i32* %154, i64 %157
  %159 = load i32, i32* %158, align 4
  %160 = icmp slt i32 %153, %159
  br i1 %160, label %161, label %176

161:                                              ; preds = %152
  %162 = load i32*, i32** @_ZL6colidx, align 8
  %163 = load i32, i32* %20, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds i32, i32* %162, i64 %164
  %166 = load i32, i32* %165, align 4
  %167 = load i32, i32* @_ZL8firstcol, align 4
  %168 = sub nsw i32 %166, %167
  %169 = load i32*, i32** @_ZL6colidx, align 8
  %170 = load i32, i32* %20, align 4
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds i32, i32* %169, i64 %171
  store i32 %168, i32* %172, align 4
  br label %173

173:                                              ; preds = %161
  %174 = load i32, i32* %20, align 4
  %175 = add nsw i32 %174, 1
  store i32 %175, i32* %20, align 4
  br label %152, !llvm.loop !11

176:                                              ; preds = %152
  br label %177

177:                                              ; preds = %176
  br label %178

178:                                              ; preds = %177
  %179 = load i32, i32* %21, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, i32* %21, align 4
  br label %139

181:                                              ; preds = %139
  br label %182

182:                                              ; preds = %181
  %183 = load i32*, i32** %9, align 8
  %184 = load i32, i32* %183, align 4
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %184)
  br label %185

185:                                              ; preds = %182, %8
  store i32 0, i32* %33, align 4
  store i32 150000, i32* %34, align 4
  store i32 1, i32* %35, align 4
  store i32 0, i32* %36, align 4
  %186 = load i32*, i32** %9, align 8
  %187 = load i32, i32* %186, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %187, i32 34, i32* %36, i32* %33, i32* %34, i32* %35, i32 1, i32 1)
  %188 = load i32, i32* %34, align 4
  %189 = icmp sgt i32 %188, 150000
  br i1 %189, label %190, label %191

190:                                              ; preds = %185
  br label %193

191:                                              ; preds = %185
  %192 = load i32, i32* %34, align 4
  br label %193

193:                                              ; preds = %191, %190
  %194 = phi i32 [ 150000, %190 ], [ %192, %191 ]
  store i32 %194, i32* %34, align 4
  %195 = load i32, i32* %33, align 4
  store i32 %195, i32* %31, align 4
  br label %196

196:                                              ; preds = %209, %193
  %197 = load i32, i32* %31, align 4
  %198 = load i32, i32* %34, align 4
  %199 = icmp sle i32 %197, %198
  br i1 %199, label %200, label %212

200:                                              ; preds = %196
  %201 = load i32, i32* %31, align 4
  %202 = mul nsw i32 %201, 1
  %203 = add nsw i32 0, %202
  store i32 %203, i32* %37, align 4
  %204 = load double*, double** @_ZL1x, align 8
  %205 = load i32, i32* %37, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds double, double* %204, i64 %206
  store double 1.000000e+00, double* %207, align 8
  br label %208

208:                                              ; preds = %200
  br label %209

209:                                              ; preds = %208
  %210 = load i32, i32* %31, align 4
  %211 = add nsw i32 %210, 1
  store i32 %211, i32* %31, align 4
  br label %196

212:                                              ; preds = %196
  br label %213

213:                                              ; preds = %212
  %214 = load i32*, i32** %9, align 8
  %215 = load i32, i32* %214, align 4
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %215)
  %216 = load i32, i32* @_ZL7lastcol, align 4
  %217 = load i32, i32* @_ZL8firstcol, align 4
  %218 = sub nsw i32 %216, %217
  %219 = add nsw i32 %218, 1
  store i32 %219, i32* %40, align 4
  %220 = load i32, i32* %40, align 4
  %221 = sub nsw i32 %220, 0
  %222 = sdiv i32 %221, 1
  %223 = sub nsw i32 %222, 1
  store i32 %223, i32* %41, align 4
  store i32 0, i32* %42, align 4
  %224 = load i32, i32* %40, align 4
  %225 = icmp slt i32 0, %224
  br i1 %225, label %226, label %272

226:                                              ; preds = %213
  store i32 0, i32* %43, align 4
  %227 = load i32, i32* %41, align 4
  store i32 %227, i32* %44, align 4
  store i32 1, i32* %45, align 4
  store i32 0, i32* %46, align 4
  %228 = load i32*, i32** %9, align 8
  %229 = load i32, i32* %228, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %229, i32 34, i32* %46, i32* %43, i32* %44, i32* %45, i32 1, i32 1)
  %230 = load i32, i32* %44, align 4
  %231 = load i32, i32* %41, align 4
  %232 = icmp sgt i32 %230, %231
  br i1 %232, label %233, label %235

233:                                              ; preds = %226
  %234 = load i32, i32* %41, align 4
  br label %237

235:                                              ; preds = %226
  %236 = load i32, i32* %44, align 4
  br label %237

237:                                              ; preds = %235, %233
  %238 = phi i32 [ %234, %233 ], [ %236, %235 ]
  store i32 %238, i32* %44, align 4
  %239 = load i32, i32* %43, align 4
  store i32 %239, i32* %38, align 4
  br label %240

240:                                              ; preds = %265, %237
  %241 = load i32, i32* %38, align 4
  %242 = load i32, i32* %44, align 4
  %243 = icmp sle i32 %241, %242
  br i1 %243, label %244, label %268

244:                                              ; preds = %240
  %245 = load i32, i32* %38, align 4
  %246 = mul nsw i32 %245, 1
  %247 = add nsw i32 0, %246
  store i32 %247, i32* %47, align 4
  %248 = load double*, double** @_ZL1q, align 8
  %249 = load i32, i32* %47, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds double, double* %248, i64 %250
  store double 0.000000e+00, double* %251, align 8
  %252 = load double*, double** @_ZL1z, align 8
  %253 = load i32, i32* %47, align 4
  %254 = sext i32 %253 to i64
  %255 = getelementptr inbounds double, double* %252, i64 %254
  store double 0.000000e+00, double* %255, align 8
  %256 = load double*, double** @_ZL1r, align 8
  %257 = load i32, i32* %47, align 4
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds double, double* %256, i64 %258
  store double 0.000000e+00, double* %259, align 8
  %260 = load double*, double** @_ZL1p, align 8
  %261 = load i32, i32* %47, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds double, double* %260, i64 %262
  store double 0.000000e+00, double* %263, align 8
  br label %264

264:                                              ; preds = %244
  br label %265

265:                                              ; preds = %264
  %266 = load i32, i32* %38, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, i32* %38, align 4
  br label %240

268:                                              ; preds = %240
  br label %269

269:                                              ; preds = %268
  %270 = load i32*, i32** %9, align 8
  %271 = load i32, i32* %270, align 4
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %271)
  br label %272

272:                                              ; preds = %269, %213
  %273 = load i32*, i32** %9, align 8
  %274 = load i32, i32* %273, align 4
  %275 = call i32 @__kmpc_single(%struct.ident_t* @2, i32 %274)
  %276 = icmp ne i32 %275, 0
  br i1 %276, label %277, label %278

277:                                              ; preds = %272
  store double 0.000000e+00, double* %109, align 8
  call void @__kmpc_end_single(%struct.ident_t* @2, i32 %274)
  br label %278

278:                                              ; preds = %277, %272
  %279 = load i32*, i32** %9, align 8
  %280 = load i32, i32* %279, align 4
  call void @__kmpc_barrier(%struct.ident_t* @3, i32 %280)
  store i32 1, i32* %17, align 4
  br label %281

281:                                              ; preds = %483, %278
  %282 = load i32, i32* %17, align 4
  %283 = icmp sle i32 %282, 1
  br i1 %283, label %284, label %486

284:                                              ; preds = %281
  %285 = load i32*, i32** @_ZL6colidx, align 8
  %286 = load i32*, i32** @_ZL6rowstr, align 8
  %287 = load double*, double** @_ZL1x, align 8
  %288 = load double*, double** @_ZL1z, align 8
  %289 = load double*, double** @_ZL1a, align 8
  %290 = load double*, double** @_ZL1p, align 8
  %291 = load double*, double** @_ZL1q, align 8
  %292 = load double*, double** @_ZL1r, align 8
  invoke void @_ZL9conj_gradPiS_PdS0_S0_S0_S0_S0_S0_(i32* noundef %285, i32* noundef %286, double* noundef %287, double* noundef %288, double* noundef %289, double* noundef %290, double* noundef %291, double* noundef %292, double* noundef %110)
          to label %293 unwind label %816

293:                                              ; preds = %284
  %294 = load i32*, i32** %9, align 8
  %295 = load i32, i32* %294, align 4
  %296 = call i32 @__kmpc_single(%struct.ident_t* @2, i32 %295)
  %297 = icmp ne i32 %296, 0
  br i1 %297, label %298, label %299

298:                                              ; preds = %293
  store double 0.000000e+00, double* %111, align 8
  store double 0.000000e+00, double* %112, align 8
  call void @__kmpc_end_single(%struct.ident_t* @2, i32 %295)
  br label %299

299:                                              ; preds = %298, %293
  %300 = load i32*, i32** %9, align 8
  %301 = load i32, i32* %300, align 4
  call void @__kmpc_barrier(%struct.ident_t* @3, i32 %301)
  %302 = load i32, i32* @_ZL7lastcol, align 4
  %303 = load i32, i32* @_ZL8firstcol, align 4
  %304 = sub nsw i32 %302, %303
  %305 = add nsw i32 %304, 1
  store i32 %305, i32* %50, align 4
  %306 = load i32, i32* %50, align 4
  %307 = sub nsw i32 %306, 0
  %308 = sdiv i32 %307, 1
  %309 = sub nsw i32 %308, 1
  store i32 %309, i32* %51, align 4
  store i32 0, i32* %52, align 4
  %310 = load i32, i32* %50, align 4
  %311 = icmp slt i32 0, %310
  br i1 %311, label %312, label %415

312:                                              ; preds = %299
  store i32 0, i32* %53, align 4
  %313 = load i32, i32* %51, align 4
  store i32 %313, i32* %54, align 4
  store i32 1, i32* %55, align 4
  store i32 0, i32* %56, align 4
  store double 0.000000e+00, double* %57, align 8
  store double 0.000000e+00, double* %58, align 8
  %314 = load i32*, i32** %9, align 8
  %315 = load i32, i32* %314, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %315, i32 34, i32* %56, i32* %53, i32* %54, i32* %55, i32 1, i32 1)
  %316 = load i32, i32* %54, align 4
  %317 = load i32, i32* %51, align 4
  %318 = icmp sgt i32 %316, %317
  br i1 %318, label %319, label %321

319:                                              ; preds = %312
  %320 = load i32, i32* %51, align 4
  br label %323

321:                                              ; preds = %312
  %322 = load i32, i32* %54, align 4
  br label %323

323:                                              ; preds = %321, %319
  %324 = phi i32 [ %320, %319 ], [ %322, %321 ]
  store i32 %324, i32* %54, align 4
  %325 = load i32, i32* %53, align 4
  store i32 %325, i32* %48, align 4
  br label %326

326:                                              ; preds = %359, %323
  %327 = load i32, i32* %48, align 4
  %328 = load i32, i32* %54, align 4
  %329 = icmp sle i32 %327, %328
  br i1 %329, label %330, label %362

330:                                              ; preds = %326
  %331 = load i32, i32* %48, align 4
  %332 = mul nsw i32 %331, 1
  %333 = add nsw i32 0, %332
  store i32 %333, i32* %59, align 4
  %334 = load double*, double** @_ZL1x, align 8
  %335 = load i32, i32* %59, align 4
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds double, double* %334, i64 %336
  %338 = load double, double* %337, align 8
  %339 = load double*, double** @_ZL1z, align 8
  %340 = load i32, i32* %59, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds double, double* %339, i64 %341
  %343 = load double, double* %342, align 8
  %344 = load double, double* %57, align 8
  %345 = call double @llvm.fmuladd.f64(double %338, double %343, double %344)
  store double %345, double* %57, align 8
  %346 = load double*, double** @_ZL1z, align 8
  %347 = load i32, i32* %59, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds double, double* %346, i64 %348
  %350 = load double, double* %349, align 8
  %351 = load double*, double** @_ZL1z, align 8
  %352 = load i32, i32* %59, align 4
  %353 = sext i32 %352 to i64
  %354 = getelementptr inbounds double, double* %351, i64 %353
  %355 = load double, double* %354, align 8
  %356 = load double, double* %58, align 8
  %357 = call double @llvm.fmuladd.f64(double %350, double %355, double %356)
  store double %357, double* %58, align 8
  br label %358

358:                                              ; preds = %330
  br label %359

359:                                              ; preds = %358
  %360 = load i32, i32* %48, align 4
  %361 = add nsw i32 %360, 1
  store i32 %361, i32* %48, align 4
  br label %326

362:                                              ; preds = %326
  br label %363

363:                                              ; preds = %362
  %364 = load i32*, i32** %9, align 8
  %365 = load i32, i32* %364, align 4
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %365)
  %366 = getelementptr inbounds [2 x i8*], [2 x i8*]* %60, i64 0, i64 0
  %367 = bitcast double* %57 to i8*
  store i8* %367, i8** %366, align 8
  %368 = getelementptr inbounds [2 x i8*], [2 x i8*]* %60, i64 0, i64 1
  %369 = bitcast double* %58 to i8*
  store i8* %369, i8** %368, align 8
  %370 = load i32*, i32** %9, align 8
  %371 = load i32, i32* %370, align 4
  %372 = bitcast [2 x i8*]* %60 to i8*
  %373 = call i32 @__kmpc_reduce(%struct.ident_t* @4, i32 %371, i32 2, i64 16, i8* %372, void (i8*, i8*)* @.omp.reduction.reduction_func, [8 x i32]* @.gomp_critical_user_.reduction.var)
  switch i32 %373, label %414 [
    i32 1, label %374
    i32 2, label %381
  ]

374:                                              ; preds = %363
  %375 = load double, double* %111, align 8
  %376 = load double, double* %57, align 8
  %377 = fadd double %375, %376
  store double %377, double* %111, align 8
  %378 = load double, double* %112, align 8
  %379 = load double, double* %58, align 8
  %380 = fadd double %378, %379
  store double %380, double* %112, align 8
  call void @__kmpc_end_reduce(%struct.ident_t* @4, i32 %371, [8 x i32]* @.gomp_critical_user_.reduction.var)
  br label %414

381:                                              ; preds = %363
  %382 = load double, double* %57, align 8
  %383 = bitcast double* %111 to i64*
  %384 = load atomic i64, i64* %383 monotonic, align 8
  br label %385

385:                                              ; preds = %385, %381
  %386 = phi i64 [ %384, %381 ], [ %395, %385 ]
  %387 = bitcast double* %61 to i64*
  %388 = bitcast i64 %386 to double
  store double %388, double* %62, align 8
  %389 = load double, double* %62, align 8
  %390 = load double, double* %57, align 8
  %391 = fadd double %389, %390
  store double %391, double* %61, align 8
  %392 = load i64, i64* %387, align 8
  %393 = bitcast double* %111 to i64*
  %394 = cmpxchg i64* %393, i64 %386, i64 %392 monotonic monotonic, align 8
  %395 = extractvalue { i64, i1 } %394, 0
  %396 = extractvalue { i64, i1 } %394, 1
  br i1 %396, label %397, label %385

397:                                              ; preds = %385
  %398 = load double, double* %58, align 8
  %399 = bitcast double* %112 to i64*
  %400 = load atomic i64, i64* %399 monotonic, align 8
  br label %401

401:                                              ; preds = %401, %397
  %402 = phi i64 [ %400, %397 ], [ %411, %401 ]
  %403 = bitcast double* %63 to i64*
  %404 = bitcast i64 %402 to double
  store double %404, double* %64, align 8
  %405 = load double, double* %64, align 8
  %406 = load double, double* %58, align 8
  %407 = fadd double %405, %406
  store double %407, double* %63, align 8
  %408 = load i64, i64* %403, align 8
  %409 = bitcast double* %112 to i64*
  %410 = cmpxchg i64* %409, i64 %402, i64 %408 monotonic monotonic, align 8
  %411 = extractvalue { i64, i1 } %410, 0
  %412 = extractvalue { i64, i1 } %410, 1
  br i1 %412, label %413, label %401

413:                                              ; preds = %401
  call void @__kmpc_end_reduce(%struct.ident_t* @4, i32 %371, [8 x i32]* @.gomp_critical_user_.reduction.var)
  br label %414

414:                                              ; preds = %413, %374, %363
  br label %415

415:                                              ; preds = %414, %299
  %416 = load i32*, i32** %9, align 8
  %417 = load i32, i32* %416, align 4
  call void @__kmpc_barrier(%struct.ident_t* @5, i32 %417)
  %418 = load i32*, i32** %9, align 8
  %419 = load i32, i32* %418, align 4
  %420 = call i32 @__kmpc_single(%struct.ident_t* @2, i32 %419)
  %421 = icmp ne i32 %420, 0
  br i1 %421, label %422, label %426

422:                                              ; preds = %415
  %423 = load double, double* %112, align 8
  %424 = call double @sqrt(double noundef %423) #6
  %425 = fdiv double 1.000000e+00, %424
  store double %425, double* %112, align 8
  call void @__kmpc_end_single(%struct.ident_t* @2, i32 %419)
  br label %426

426:                                              ; preds = %422, %415
  %427 = load i32*, i32** %9, align 8
  %428 = load i32, i32* %427, align 4
  call void @__kmpc_barrier(%struct.ident_t* @3, i32 %428)
  %429 = load i32, i32* @_ZL7lastcol, align 4
  %430 = load i32, i32* @_ZL8firstcol, align 4
  %431 = sub nsw i32 %429, %430
  %432 = add nsw i32 %431, 1
  store i32 %432, i32* %67, align 4
  %433 = load i32, i32* %67, align 4
  %434 = sub nsw i32 %433, 0
  %435 = sdiv i32 %434, 1
  %436 = sub nsw i32 %435, 1
  store i32 %436, i32* %68, align 4
  store i32 0, i32* %69, align 4
  %437 = load i32, i32* %67, align 4
  %438 = icmp slt i32 0, %437
  br i1 %438, label %439, label %480

439:                                              ; preds = %426
  store i32 0, i32* %70, align 4
  %440 = load i32, i32* %68, align 4
  store i32 %440, i32* %71, align 4
  store i32 1, i32* %72, align 4
  store i32 0, i32* %73, align 4
  %441 = load i32*, i32** %9, align 8
  %442 = load i32, i32* %441, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %442, i32 34, i32* %73, i32* %70, i32* %71, i32* %72, i32 1, i32 1)
  %443 = load i32, i32* %71, align 4
  %444 = load i32, i32* %68, align 4
  %445 = icmp sgt i32 %443, %444
  br i1 %445, label %446, label %448

446:                                              ; preds = %439
  %447 = load i32, i32* %68, align 4
  br label %450

448:                                              ; preds = %439
  %449 = load i32, i32* %71, align 4
  br label %450

450:                                              ; preds = %448, %446
  %451 = phi i32 [ %447, %446 ], [ %449, %448 ]
  store i32 %451, i32* %71, align 4
  %452 = load i32, i32* %70, align 4
  store i32 %452, i32* %65, align 4
  br label %453

453:                                              ; preds = %473, %450
  %454 = load i32, i32* %65, align 4
  %455 = load i32, i32* %71, align 4
  %456 = icmp sle i32 %454, %455
  br i1 %456, label %457, label %476

457:                                              ; preds = %453
  %458 = load i32, i32* %65, align 4
  %459 = mul nsw i32 %458, 1
  %460 = add nsw i32 0, %459
  store i32 %460, i32* %74, align 4
  %461 = load double, double* %112, align 8
  %462 = load double*, double** @_ZL1z, align 8
  %463 = load i32, i32* %74, align 4
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds double, double* %462, i64 %464
  %466 = load double, double* %465, align 8
  %467 = fmul double %461, %466
  %468 = load double*, double** @_ZL1x, align 8
  %469 = load i32, i32* %74, align 4
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds double, double* %468, i64 %470
  store double %467, double* %471, align 8
  br label %472

472:                                              ; preds = %457
  br label %473

473:                                              ; preds = %472
  %474 = load i32, i32* %65, align 4
  %475 = add nsw i32 %474, 1
  store i32 %475, i32* %65, align 4
  br label %453

476:                                              ; preds = %453
  br label %477

477:                                              ; preds = %476
  %478 = load i32*, i32** %9, align 8
  %479 = load i32, i32* %478, align 4
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %479)
  br label %480

480:                                              ; preds = %477, %426
  %481 = load i32*, i32** %9, align 8
  %482 = load i32, i32* %481, align 4
  call void @__kmpc_barrier(%struct.ident_t* @5, i32 %482)
  br label %483

483:                                              ; preds = %480
  %484 = load i32, i32* %17, align 4
  %485 = add nsw i32 %484, 1
  store i32 %485, i32* %17, align 4
  br label %281, !llvm.loop !12

486:                                              ; preds = %281
  store i32 0, i32* %77, align 4
  store i32 150000, i32* %78, align 4
  store i32 1, i32* %79, align 4
  store i32 0, i32* %80, align 4
  %487 = load i32*, i32** %9, align 8
  %488 = load i32, i32* %487, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %488, i32 34, i32* %80, i32* %77, i32* %78, i32* %79, i32 1, i32 1)
  %489 = load i32, i32* %78, align 4
  %490 = icmp sgt i32 %489, 150000
  br i1 %490, label %491, label %492

491:                                              ; preds = %486
  br label %494

492:                                              ; preds = %486
  %493 = load i32, i32* %78, align 4
  br label %494

494:                                              ; preds = %492, %491
  %495 = phi i32 [ 150000, %491 ], [ %493, %492 ]
  store i32 %495, i32* %78, align 4
  %496 = load i32, i32* %77, align 4
  store i32 %496, i32* %75, align 4
  br label %497

497:                                              ; preds = %510, %494
  %498 = load i32, i32* %75, align 4
  %499 = load i32, i32* %78, align 4
  %500 = icmp sle i32 %498, %499
  br i1 %500, label %501, label %513

501:                                              ; preds = %497
  %502 = load i32, i32* %75, align 4
  %503 = mul nsw i32 %502, 1
  %504 = add nsw i32 0, %503
  store i32 %504, i32* %81, align 4
  %505 = load double*, double** @_ZL1x, align 8
  %506 = load i32, i32* %81, align 4
  %507 = sext i32 %506 to i64
  %508 = getelementptr inbounds double, double* %505, i64 %507
  store double 1.000000e+00, double* %508, align 8
  br label %509

509:                                              ; preds = %501
  br label %510

510:                                              ; preds = %509
  %511 = load i32, i32* %75, align 4
  %512 = add nsw i32 %511, 1
  store i32 %512, i32* %75, align 4
  br label %497

513:                                              ; preds = %497
  br label %514

514:                                              ; preds = %513
  %515 = load i32*, i32** %9, align 8
  %516 = load i32, i32* %515, align 4
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %516)
  %517 = load i32*, i32** %9, align 8
  %518 = load i32, i32* %517, align 4
  call void @__kmpc_barrier(%struct.ident_t* @5, i32 %518)
  %519 = load i32*, i32** %9, align 8
  %520 = load i32, i32* %519, align 4
  %521 = call i32 @__kmpc_single(%struct.ident_t* @2, i32 %520)
  %522 = icmp ne i32 %521, 0
  br i1 %522, label %523, label %524

523:                                              ; preds = %514
  store double 0.000000e+00, double* %109, align 8
  call void @__kmpc_end_single(%struct.ident_t* @2, i32 %520)
  br label %524

524:                                              ; preds = %523, %514
  %525 = load i32*, i32** %9, align 8
  %526 = load i32, i32* %525, align 4
  call void @__kmpc_barrier(%struct.ident_t* @3, i32 %526)
  %527 = load i32*, i32** %9, align 8
  %528 = load i32, i32* %527, align 4
  %529 = call i32 @__kmpc_master(%struct.ident_t* @2, i32 %528)
  %530 = icmp ne i32 %529, 0
  br i1 %530, label %531, label %538

531:                                              ; preds = %524
  invoke void @_Z10timer_stopi(i32 noundef 0)
          to label %532 unwind label %816

532:                                              ; preds = %531
  %533 = invoke noundef double @_Z10timer_readi(i32 noundef 0)
          to label %534 unwind label %816

534:                                              ; preds = %532
  %535 = invoke i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([39 x i8], [39 x i8]* @.str.20, i64 0, i64 0), double noundef %533)
          to label %536 unwind label %816

536:                                              ; preds = %534
  invoke void @_Z11timer_starti(i32 noundef 1)
          to label %537 unwind label %816

537:                                              ; preds = %536
  call void @__kmpc_end_master(%struct.ident_t* @2, i32 %528)
  br label %538

538:                                              ; preds = %537, %524
  store i32 1, i32* %17, align 4
  br label %539

539:                                              ; preds = %812, %538
  %540 = load i32, i32* %17, align 4
  %541 = icmp sle i32 %540, 75
  br i1 %541, label %542, label %815

542:                                              ; preds = %539
  %543 = load i32*, i32** %9, align 8
  %544 = load i32, i32* %543, align 4
  %545 = call i32 @__kmpc_master(%struct.ident_t* @2, i32 %544)
  %546 = icmp ne i32 %545, 0
  br i1 %546, label %547, label %549

547:                                              ; preds = %542
  %548 = call i32 @gettimeofday(%struct.timeval* noundef %113, i8* noundef null) #6
  call void @__kmpc_end_master(%struct.ident_t* @2, i32 %544)
  br label %549

549:                                              ; preds = %547, %542
  %550 = load i32*, i32** %9, align 8
  %551 = load i32, i32* %550, align 4
  %552 = call i32 @__kmpc_master(%struct.ident_t* @2, i32 %551)
  %553 = icmp ne i32 %552, 0
  br i1 %553, label %554, label %560

554:                                              ; preds = %549
  %555 = load i32, i32* @_ZL7timeron, align 4
  %556 = icmp ne i32 %555, 0
  br i1 %556, label %557, label %559

557:                                              ; preds = %554
  invoke void @_Z11timer_starti(i32 noundef 2)
          to label %558 unwind label %816

558:                                              ; preds = %557
  br label %559

559:                                              ; preds = %558, %554
  call void @__kmpc_end_master(%struct.ident_t* @2, i32 %551)
  br label %560

560:                                              ; preds = %559, %549
  %561 = load i32*, i32** @_ZL6colidx, align 8
  %562 = load i32*, i32** @_ZL6rowstr, align 8
  %563 = load double*, double** @_ZL1x, align 8
  %564 = load double*, double** @_ZL1z, align 8
  %565 = load double*, double** @_ZL1a, align 8
  %566 = load double*, double** @_ZL1p, align 8
  %567 = load double*, double** @_ZL1q, align 8
  %568 = load double*, double** @_ZL1r, align 8
  invoke void @_ZL9conj_gradPiS_PdS0_S0_S0_S0_S0_S0_(i32* noundef %561, i32* noundef %562, double* noundef %563, double* noundef %564, double* noundef %565, double* noundef %566, double* noundef %567, double* noundef %568, double* noundef %110)
          to label %569 unwind label %816

569:                                              ; preds = %560
  %570 = load i32*, i32** %9, align 8
  %571 = load i32, i32* %570, align 4
  %572 = call i32 @__kmpc_master(%struct.ident_t* @2, i32 %571)
  %573 = icmp ne i32 %572, 0
  br i1 %573, label %574, label %580

574:                                              ; preds = %569
  %575 = load i32, i32* @_ZL7timeron, align 4
  %576 = icmp ne i32 %575, 0
  br i1 %576, label %577, label %579

577:                                              ; preds = %574
  invoke void @_Z10timer_stopi(i32 noundef 2)
          to label %578 unwind label %816

578:                                              ; preds = %577
  br label %579

579:                                              ; preds = %578, %574
  call void @__kmpc_end_master(%struct.ident_t* @2, i32 %571)
  br label %580

580:                                              ; preds = %579, %569
  %581 = load i32*, i32** %9, align 8
  %582 = load i32, i32* %581, align 4
  %583 = call i32 @__kmpc_single(%struct.ident_t* @2, i32 %582)
  %584 = icmp ne i32 %583, 0
  br i1 %584, label %585, label %586

585:                                              ; preds = %580
  store double 0.000000e+00, double* %111, align 8
  store double 0.000000e+00, double* %112, align 8
  call void @__kmpc_end_single(%struct.ident_t* @2, i32 %582)
  br label %586

586:                                              ; preds = %585, %580
  %587 = load i32*, i32** %9, align 8
  %588 = load i32, i32* %587, align 4
  call void @__kmpc_barrier(%struct.ident_t* @3, i32 %588)
  %589 = load i32, i32* @_ZL7lastcol, align 4
  %590 = load i32, i32* @_ZL8firstcol, align 4
  %591 = sub nsw i32 %589, %590
  %592 = add nsw i32 %591, 1
  store i32 %592, i32* %84, align 4
  %593 = load i32, i32* %84, align 4
  %594 = sub nsw i32 %593, 0
  %595 = sdiv i32 %594, 1
  %596 = sub nsw i32 %595, 1
  store i32 %596, i32* %85, align 4
  store i32 0, i32* %86, align 4
  %597 = load i32, i32* %84, align 4
  %598 = icmp slt i32 0, %597
  br i1 %598, label %599, label %702

599:                                              ; preds = %586
  store i32 0, i32* %87, align 4
  %600 = load i32, i32* %85, align 4
  store i32 %600, i32* %88, align 4
  store i32 1, i32* %89, align 4
  store i32 0, i32* %90, align 4
  store double 0.000000e+00, double* %91, align 8
  store double 0.000000e+00, double* %92, align 8
  %601 = load i32*, i32** %9, align 8
  %602 = load i32, i32* %601, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %602, i32 34, i32* %90, i32* %87, i32* %88, i32* %89, i32 1, i32 1)
  %603 = load i32, i32* %88, align 4
  %604 = load i32, i32* %85, align 4
  %605 = icmp sgt i32 %603, %604
  br i1 %605, label %606, label %608

606:                                              ; preds = %599
  %607 = load i32, i32* %85, align 4
  br label %610

608:                                              ; preds = %599
  %609 = load i32, i32* %88, align 4
  br label %610

610:                                              ; preds = %608, %606
  %611 = phi i32 [ %607, %606 ], [ %609, %608 ]
  store i32 %611, i32* %88, align 4
  %612 = load i32, i32* %87, align 4
  store i32 %612, i32* %82, align 4
  br label %613

613:                                              ; preds = %646, %610
  %614 = load i32, i32* %82, align 4
  %615 = load i32, i32* %88, align 4
  %616 = icmp sle i32 %614, %615
  br i1 %616, label %617, label %649

617:                                              ; preds = %613
  %618 = load i32, i32* %82, align 4
  %619 = mul nsw i32 %618, 1
  %620 = add nsw i32 0, %619
  store i32 %620, i32* %93, align 4
  %621 = load double*, double** @_ZL1x, align 8
  %622 = load i32, i32* %93, align 4
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds double, double* %621, i64 %623
  %625 = load double, double* %624, align 8
  %626 = load double*, double** @_ZL1z, align 8
  %627 = load i32, i32* %93, align 4
  %628 = sext i32 %627 to i64
  %629 = getelementptr inbounds double, double* %626, i64 %628
  %630 = load double, double* %629, align 8
  %631 = load double, double* %91, align 8
  %632 = call double @llvm.fmuladd.f64(double %625, double %630, double %631)
  store double %632, double* %91, align 8
  %633 = load double*, double** @_ZL1z, align 8
  %634 = load i32, i32* %93, align 4
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds double, double* %633, i64 %635
  %637 = load double, double* %636, align 8
  %638 = load double*, double** @_ZL1z, align 8
  %639 = load i32, i32* %93, align 4
  %640 = sext i32 %639 to i64
  %641 = getelementptr inbounds double, double* %638, i64 %640
  %642 = load double, double* %641, align 8
  %643 = load double, double* %92, align 8
  %644 = call double @llvm.fmuladd.f64(double %637, double %642, double %643)
  store double %644, double* %92, align 8
  br label %645

645:                                              ; preds = %617
  br label %646

646:                                              ; preds = %645
  %647 = load i32, i32* %82, align 4
  %648 = add nsw i32 %647, 1
  store i32 %648, i32* %82, align 4
  br label %613

649:                                              ; preds = %613
  br label %650

650:                                              ; preds = %649
  %651 = load i32*, i32** %9, align 8
  %652 = load i32, i32* %651, align 4
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %652)
  %653 = getelementptr inbounds [2 x i8*], [2 x i8*]* %94, i64 0, i64 0
  %654 = bitcast double* %91 to i8*
  store i8* %654, i8** %653, align 8
  %655 = getelementptr inbounds [2 x i8*], [2 x i8*]* %94, i64 0, i64 1
  %656 = bitcast double* %92 to i8*
  store i8* %656, i8** %655, align 8
  %657 = load i32*, i32** %9, align 8
  %658 = load i32, i32* %657, align 4
  %659 = bitcast [2 x i8*]* %94 to i8*
  %660 = call i32 @__kmpc_reduce(%struct.ident_t* @4, i32 %658, i32 2, i64 16, i8* %659, void (i8*, i8*)* @.omp.reduction.reduction_func.21, [8 x i32]* @.gomp_critical_user_.reduction.var)
  switch i32 %660, label %701 [
    i32 1, label %661
    i32 2, label %668
  ]

661:                                              ; preds = %650
  %662 = load double, double* %111, align 8
  %663 = load double, double* %91, align 8
  %664 = fadd double %662, %663
  store double %664, double* %111, align 8
  %665 = load double, double* %112, align 8
  %666 = load double, double* %92, align 8
  %667 = fadd double %665, %666
  store double %667, double* %112, align 8
  call void @__kmpc_end_reduce(%struct.ident_t* @4, i32 %658, [8 x i32]* @.gomp_critical_user_.reduction.var)
  br label %701

668:                                              ; preds = %650
  %669 = load double, double* %91, align 8
  %670 = bitcast double* %111 to i64*
  %671 = load atomic i64, i64* %670 monotonic, align 8
  br label %672

672:                                              ; preds = %672, %668
  %673 = phi i64 [ %671, %668 ], [ %682, %672 ]
  %674 = bitcast double* %95 to i64*
  %675 = bitcast i64 %673 to double
  store double %675, double* %96, align 8
  %676 = load double, double* %96, align 8
  %677 = load double, double* %91, align 8
  %678 = fadd double %676, %677
  store double %678, double* %95, align 8
  %679 = load i64, i64* %674, align 8
  %680 = bitcast double* %111 to i64*
  %681 = cmpxchg i64* %680, i64 %673, i64 %679 monotonic monotonic, align 8
  %682 = extractvalue { i64, i1 } %681, 0
  %683 = extractvalue { i64, i1 } %681, 1
  br i1 %683, label %684, label %672

684:                                              ; preds = %672
  %685 = load double, double* %92, align 8
  %686 = bitcast double* %112 to i64*
  %687 = load atomic i64, i64* %686 monotonic, align 8
  br label %688

688:                                              ; preds = %688, %684
  %689 = phi i64 [ %687, %684 ], [ %698, %688 ]
  %690 = bitcast double* %97 to i64*
  %691 = bitcast i64 %689 to double
  store double %691, double* %98, align 8
  %692 = load double, double* %98, align 8
  %693 = load double, double* %92, align 8
  %694 = fadd double %692, %693
  store double %694, double* %97, align 8
  %695 = load i64, i64* %690, align 8
  %696 = bitcast double* %112 to i64*
  %697 = cmpxchg i64* %696, i64 %689, i64 %695 monotonic monotonic, align 8
  %698 = extractvalue { i64, i1 } %697, 0
  %699 = extractvalue { i64, i1 } %697, 1
  br i1 %699, label %700, label %688

700:                                              ; preds = %688
  call void @__kmpc_end_reduce(%struct.ident_t* @4, i32 %658, [8 x i32]* @.gomp_critical_user_.reduction.var)
  br label %701

701:                                              ; preds = %700, %661, %650
  br label %702

702:                                              ; preds = %701, %586
  %703 = load i32*, i32** %9, align 8
  %704 = load i32, i32* %703, align 4
  call void @__kmpc_barrier(%struct.ident_t* @5, i32 %704)
  %705 = load i32*, i32** %9, align 8
  %706 = load i32, i32* %705, align 4
  %707 = call i32 @__kmpc_single(%struct.ident_t* @2, i32 %706)
  %708 = icmp ne i32 %707, 0
  br i1 %708, label %709, label %716

709:                                              ; preds = %702
  %710 = load double, double* %112, align 8
  %711 = call double @sqrt(double noundef %710) #6
  %712 = fdiv double 1.000000e+00, %711
  store double %712, double* %112, align 8
  %713 = load double, double* %111, align 8
  %714 = fdiv double 1.000000e+00, %713
  %715 = fadd double 1.100000e+02, %714
  store double %715, double* %109, align 8
  call void @__kmpc_end_single(%struct.ident_t* @2, i32 %706)
  br label %716

716:                                              ; preds = %709, %702
  %717 = load i32*, i32** %9, align 8
  %718 = load i32, i32* %717, align 4
  call void @__kmpc_barrier(%struct.ident_t* @3, i32 %718)
  %719 = load i32*, i32** %9, align 8
  %720 = load i32, i32* %719, align 4
  %721 = call i32 @__kmpc_master(%struct.ident_t* @2, i32 %720)
  %722 = icmp ne i32 %721, 0
  br i1 %722, label %723, label %735

723:                                              ; preds = %716
  %724 = load i32, i32* %17, align 4
  %725 = icmp eq i32 %724, 1
  br i1 %725, label %726, label %729

726:                                              ; preds = %723
  %727 = invoke i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([52 x i8], [52 x i8]* @.str.22, i64 0, i64 0))
          to label %728 unwind label %816

728:                                              ; preds = %726
  br label %729

729:                                              ; preds = %728, %723
  %730 = load i32, i32* %17, align 4
  %731 = load double, double* %110, align 8
  %732 = load double, double* %109, align 8
  %733 = invoke i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([30 x i8], [30 x i8]* @.str.23, i64 0, i64 0), i32 noundef %730, double noundef %731, double noundef %732)
          to label %734 unwind label %816

734:                                              ; preds = %729
  call void @__kmpc_end_master(%struct.ident_t* @2, i32 %720)
  br label %735

735:                                              ; preds = %734, %716
  %736 = load i32, i32* @_ZL7lastcol, align 4
  %737 = load i32, i32* @_ZL8firstcol, align 4
  %738 = sub nsw i32 %736, %737
  %739 = add nsw i32 %738, 1
  store i32 %739, i32* %101, align 4
  %740 = load i32, i32* %101, align 4
  %741 = sub nsw i32 %740, 0
  %742 = sdiv i32 %741, 1
  %743 = sub nsw i32 %742, 1
  store i32 %743, i32* %102, align 4
  store i32 0, i32* %103, align 4
  %744 = load i32, i32* %101, align 4
  %745 = icmp slt i32 0, %744
  br i1 %745, label %746, label %787

746:                                              ; preds = %735
  store i32 0, i32* %104, align 4
  %747 = load i32, i32* %102, align 4
  store i32 %747, i32* %105, align 4
  store i32 1, i32* %106, align 4
  store i32 0, i32* %107, align 4
  %748 = load i32*, i32** %9, align 8
  %749 = load i32, i32* %748, align 4
  call void @__kmpc_for_static_init_4(%struct.ident_t* @1, i32 %749, i32 34, i32* %107, i32* %104, i32* %105, i32* %106, i32 1, i32 1)
  %750 = load i32, i32* %105, align 4
  %751 = load i32, i32* %102, align 4
  %752 = icmp sgt i32 %750, %751
  br i1 %752, label %753, label %755

753:                                              ; preds = %746
  %754 = load i32, i32* %102, align 4
  br label %757

755:                                              ; preds = %746
  %756 = load i32, i32* %105, align 4
  br label %757

757:                                              ; preds = %755, %753
  %758 = phi i32 [ %754, %753 ], [ %756, %755 ]
  store i32 %758, i32* %105, align 4
  %759 = load i32, i32* %104, align 4
  store i32 %759, i32* %99, align 4
  br label %760

760:                                              ; preds = %780, %757
  %761 = load i32, i32* %99, align 4
  %762 = load i32, i32* %105, align 4
  %763 = icmp sle i32 %761, %762
  br i1 %763, label %764, label %783

764:                                              ; preds = %760
  %765 = load i32, i32* %99, align 4
  %766 = mul nsw i32 %765, 1
  %767 = add nsw i32 0, %766
  store i32 %767, i32* %108, align 4
  %768 = load double, double* %112, align 8
  %769 = load double*, double** @_ZL1z, align 8
  %770 = load i32, i32* %108, align 4
  %771 = sext i32 %770 to i64
  %772 = getelementptr inbounds double, double* %769, i64 %771
  %773 = load double, double* %772, align 8
  %774 = fmul double %768, %773
  %775 = load double*, double** @_ZL1x, align 8
  %776 = load i32, i32* %108, align 4
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds double, double* %775, i64 %777
  store double %774, double* %778, align 8
  br label %779

779:                                              ; preds = %764
  br label %780

780:                                              ; preds = %779
  %781 = load i32, i32* %99, align 4
  %782 = add nsw i32 %781, 1
  store i32 %782, i32* %99, align 4
  br label %760

783:                                              ; preds = %760
  br label %784

784:                                              ; preds = %783
  %785 = load i32*, i32** %9, align 8
  %786 = load i32, i32* %785, align 4
  call void @__kmpc_for_static_fini(%struct.ident_t* @1, i32 %786)
  br label %787

787:                                              ; preds = %784, %735
  %788 = load i32*, i32** %9, align 8
  %789 = load i32, i32* %788, align 4
  call void @__kmpc_barrier(%struct.ident_t* @5, i32 %789)
  %790 = load i32*, i32** %9, align 8
  %791 = load i32, i32* %790, align 4
  %792 = call i32 @__kmpc_master(%struct.ident_t* @2, i32 %791)
  %793 = icmp ne i32 %792, 0
  br i1 %793, label %794, label %811

794:                                              ; preds = %787
  %795 = call i32 @gettimeofday(%struct.timeval* noundef %114, i8* noundef null) #6
  %796 = load i32, i32* %17, align 4
  %797 = getelementptr inbounds %struct.timeval, %struct.timeval* %114, i32 0, i32 0
  %798 = load i64, i64* %797, align 8
  %799 = getelementptr inbounds %struct.timeval, %struct.timeval* %113, i32 0, i32 0
  %800 = load i64, i64* %799, align 8
  %801 = sub nsw i64 %798, %800
  %802 = mul nsw i64 %801, 1000000
  %803 = getelementptr inbounds %struct.timeval, %struct.timeval* %114, i32 0, i32 1
  %804 = load i64, i64* %803, align 8
  %805 = getelementptr inbounds %struct.timeval, %struct.timeval* %113, i32 0, i32 1
  %806 = load i64, i64* %805, align 8
  %807 = sub nsw i64 %804, %806
  %808 = add nsw i64 %802, %807
  %809 = invoke i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([27 x i8], [27 x i8]* @.str.24, i64 0, i64 0), i32 noundef %796, i64 noundef %808)
          to label %810 unwind label %816

810:                                              ; preds = %794
  call void @__kmpc_end_master(%struct.ident_t* @2, i32 %791)
  br label %811

811:                                              ; preds = %810, %787
  br label %812

812:                                              ; preds = %811
  %813 = load i32, i32* %17, align 4
  %814 = add nsw i32 %813, 1
  store i32 %814, i32* %17, align 4
  br label %539, !llvm.loop !13

815:                                              ; preds = %539
  ret void

816:                                              ; preds = %794, %729, %726, %577, %560, %557, %536, %534, %532, %531, %284
  %817 = landingpad { i8*, i32 }
          catch i8* null
  %818 = extractvalue { i8*, i32 } %817, 0
  call void @__clang_call_terminate(i8* %818) #19
  unreachable
}

declare dso_local void @__kmpc_for_static_init_4(%struct.ident_t*, i32, i32, i32*, i32*, i32*, i32*, i32, i32)

; Function Attrs: nounwind
declare void @__kmpc_for_static_fini(%struct.ident_t*, i32) #6

; Function Attrs: convergent nounwind
declare i32 @__kmpc_single(%struct.ident_t*, i32) #7

; Function Attrs: convergent nounwind
declare void @__kmpc_end_single(%struct.ident_t*, i32) #7

; Function Attrs: convergent nounwind
declare void @__kmpc_barrier(%struct.ident_t*, i32) #7

; Function Attrs: mustprogress noinline optnone uwtable
define internal void @_ZL9conj_gradPiS_PdS0_S0_S0_S0_S0_S0_(i32* noundef %0, i32* noundef %1, double* noundef %2, double* noundef %3, double* noundef %4, double* noundef %5, double* noundef %6, double* noundef %7, double* noundef %8) #4 {
  %10 = alloca i32*, align 8
  %11 = alloca i32*, align 8
  %12 = alloca double*, align 8
  %13 = alloca double*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca double*, align 8
  %17 = alloca double*, align 8
  %18 = alloca double*, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca double, align 8
  %24 = alloca %struct.anon, align 8
  %25 = alloca %struct.anon.1, align 8
  %26 = alloca %struct.anon.5, align 8
  %27 = alloca %struct.anon.9, align 8
  %28 = alloca %struct.anon.14, align 8
  %29 = alloca %struct.anon.19, align 8
  %30 = alloca %struct.anon.23, align 8
  %31 = alloca %struct.anon.27, align 8
  %32 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store i32* %0, i32** %10, align 8
  store i32* %1, i32** %11, align 8
  store double* %2, double** %12, align 8
  store double* %3, double** %13, align 8
  store double* %4, double** %14, align 8
  store double* %5, double** %15, align 8
  store double* %6, double** %16, align 8
  store double* %7, double** %17, align 8
  store double* %8, double** %18, align 8
  store i32 25, i32* %22, align 4
  %33 = call i32 @__kmpc_single(%struct.ident_t* @2, i32 %32)
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %35, label %89

35:                                               ; preds = %9
  store double 0.000000e+00, double* @_ZL3rho, align 8
  store double 0.000000e+00, double* @_ZL3sum, align 8
  %36 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 0
  store double** %16, double*** %36, align 8
  %37 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 1
  store double** %13, double*** %37, align 8
  %38 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 2
  store double** %17, double*** %38, align 8
  %39 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 3
  store double** %12, double*** %39, align 8
  %40 = getelementptr inbounds %struct.anon, %struct.anon* %24, i32 0, i32 4
  store double** %15, double*** %40, align 8
  %41 = bitcast %struct.anon* %24 to i8*
  call void @__kmpc_taskgraph(%struct.ident_t* @2, i32 %32, i32 1000, i8* bitcast (void (%struct.anon*)* @__captured_stmt to i8*), i8* %41, i32 0, i32 0, i1 false)
  %42 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %25, i32 0, i32 0
  store double** %17, double*** %42, align 8
  %43 = bitcast %struct.anon.1* %25 to i8*
  call void @__kmpc_taskgraph(%struct.ident_t* @2, i32 %32, i32 1001, i8* bitcast (void (%struct.anon.1*)* @__captured_stmt.57 to i8*), i8* %43, i32 0, i32 0, i1 false)
  store i32 1, i32* %21, align 4
  br label %44

44:                                               ; preds = %73, %35
  %45 = load i32, i32* %21, align 4
  %46 = load i32, i32* %22, align 4
  %47 = icmp sle i32 %45, %46
  br i1 %47, label %48, label %76

48:                                               ; preds = %44
  store double 0.000000e+00, double* @_ZL1d, align 8
  %49 = load double, double* @_ZL3rho, align 8
  store double %49, double* @_ZZL9conj_gradPiS_PdS0_S0_S0_S0_S0_S0_E4rho0, align 8
  store double 0.000000e+00, double* @_ZL3rho, align 8
  %50 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %26, i32 0, i32 0
  store i32** %11, i32*** %50, align 8
  %51 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %26, i32 0, i32 1
  store double** %14, double*** %51, align 8
  %52 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %26, i32 0, i32 2
  store double** %15, double*** %52, align 8
  %53 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %26, i32 0, i32 3
  store i32** %10, i32*** %53, align 8
  %54 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %26, i32 0, i32 4
  store double** %16, double*** %54, align 8
  %55 = bitcast %struct.anon.5* %26 to i8*
  call void @__kmpc_taskgraph(%struct.ident_t* @2, i32 %32, i32 1002, i8* bitcast (void (%struct.anon.5*)* @__captured_stmt.61 to i8*), i8* %55, i32 0, i32 0, i1 false)
  %56 = getelementptr inbounds %struct.anon.9, %struct.anon.9* %27, i32 0, i32 0
  store double** %15, double*** %56, align 8
  %57 = getelementptr inbounds %struct.anon.9, %struct.anon.9* %27, i32 0, i32 1
  store double** %16, double*** %57, align 8
  %58 = bitcast %struct.anon.9* %27 to i8*
  call void @__kmpc_taskgraph(%struct.ident_t* @2, i32 %32, i32 1003, i8* bitcast (void (%struct.anon.9*)* @__captured_stmt.65 to i8*), i8* %58, i32 0, i32 0, i1 false)
  %59 = load double, double* @_ZZL9conj_gradPiS_PdS0_S0_S0_S0_S0_S0_E4rho0, align 8
  %60 = load double, double* @_ZL1d, align 8
  %61 = fdiv double %59, %60
  store double %61, double* @_ZL5alpha, align 8
  %62 = getelementptr inbounds %struct.anon.14, %struct.anon.14* %28, i32 0, i32 0
  store double** %13, double*** %62, align 8
  %63 = getelementptr inbounds %struct.anon.14, %struct.anon.14* %28, i32 0, i32 1
  store double** %15, double*** %63, align 8
  %64 = getelementptr inbounds %struct.anon.14, %struct.anon.14* %28, i32 0, i32 2
  store double** %17, double*** %64, align 8
  %65 = getelementptr inbounds %struct.anon.14, %struct.anon.14* %28, i32 0, i32 3
  store double** %16, double*** %65, align 8
  %66 = bitcast %struct.anon.14* %28 to i8*
  call void @__kmpc_taskgraph(%struct.ident_t* @2, i32 %32, i32 1004, i8* bitcast (void (%struct.anon.14*)* @__captured_stmt.71 to i8*), i8* %66, i32 0, i32 0, i1 false)
  %67 = load double, double* @_ZL3rho, align 8
  %68 = load double, double* @_ZZL9conj_gradPiS_PdS0_S0_S0_S0_S0_S0_E4rho0, align 8
  %69 = fdiv double %67, %68
  store double %69, double* @_ZL4beta, align 8
  %70 = getelementptr inbounds %struct.anon.19, %struct.anon.19* %29, i32 0, i32 0
  store double** %15, double*** %70, align 8
  %71 = getelementptr inbounds %struct.anon.19, %struct.anon.19* %29, i32 0, i32 1
  store double** %17, double*** %71, align 8
  %72 = bitcast %struct.anon.19* %29 to i8*
  call void @__kmpc_taskgraph(%struct.ident_t* @2, i32 %32, i32 1005, i8* bitcast (void (%struct.anon.19*)* @__captured_stmt.77 to i8*), i8* %72, i32 0, i32 0, i1 false)
  br label %73

73:                                               ; preds = %48
  %74 = load i32, i32* %21, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %21, align 4
  br label %44, !llvm.loop !14

76:                                               ; preds = %44
  %77 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %30, i32 0, i32 0
  store i32** %11, i32*** %77, align 8
  %78 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %30, i32 0, i32 1
  store double** %14, double*** %78, align 8
  %79 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %30, i32 0, i32 2
  store double** %13, double*** %79, align 8
  %80 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %30, i32 0, i32 3
  store i32** %10, i32*** %80, align 8
  %81 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %30, i32 0, i32 4
  store double** %17, double*** %81, align 8
  %82 = bitcast %struct.anon.23* %30 to i8*
  call void @__kmpc_taskgraph(%struct.ident_t* @2, i32 %32, i32 1006, i8* bitcast (void (%struct.anon.23*)* @__captured_stmt.81 to i8*), i8* %82, i32 0, i32 0, i1 false)
  %83 = getelementptr inbounds %struct.anon.27, %struct.anon.27* %31, i32 0, i32 0
  store double** %12, double*** %83, align 8
  %84 = getelementptr inbounds %struct.anon.27, %struct.anon.27* %31, i32 0, i32 1
  store double** %17, double*** %84, align 8
  %85 = bitcast %struct.anon.27* %31 to i8*
  call void @__kmpc_taskgraph(%struct.ident_t* @2, i32 %32, i32 1007, i8* bitcast (void (%struct.anon.27*)* @__captured_stmt.85 to i8*), i8* %85, i32 0, i32 0, i1 false)
  %86 = load double, double* @_ZL3sum, align 8
  %87 = call double @sqrt(double noundef %86) #6
  %88 = load double*, double** %18, align 8
  store double %87, double* %88, align 8
  call void @__kmpc_end_single(%struct.ident_t* @2, i32 %32)
  br label %89

89:                                               ; preds = %76, %9
  call void @__kmpc_barrier(%struct.ident_t* @3, i32 %32)
  ret void
}

declare dso_local i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(i8* %0) #8 comdat {
  %2 = call i8* @__cxa_begin_catch(i8* %0) #6
  call void @_ZSt9terminatev() #19
  unreachable
}

declare dso_local i8* @__cxa_begin_catch(i8*)

declare dso_local void @_ZSt9terminatev()

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fmuladd.f64(double, double, double) #9

; Function Attrs: noinline norecurse uwtable
define internal void @.omp.reduction.reduction_func(i8* noundef %0, i8* noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to [2 x i8*]*
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to [2 x i8*]*
  %9 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to double*
  %12 = getelementptr inbounds [2 x i8*], [2 x i8*]* %6, i64 0, i64 0
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to double*
  %15 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 1
  %16 = load i8*, i8** %15, align 8
  %17 = bitcast i8* %16 to double*
  %18 = getelementptr inbounds [2 x i8*], [2 x i8*]* %6, i64 0, i64 1
  %19 = load i8*, i8** %18, align 8
  %20 = bitcast i8* %19 to double*
  %21 = load double, double* %14, align 8
  %22 = load double, double* %11, align 8
  %23 = fadd double %21, %22
  store double %23, double* %14, align 8
  %24 = load double, double* %20, align 8
  %25 = load double, double* %17, align 8
  %26 = fadd double %24, %25
  store double %26, double* %20, align 8
  ret void
}

; Function Attrs: convergent nounwind
declare i32 @__kmpc_reduce(%struct.ident_t*, i32, i32, i64, i8*, void (i8*, i8*)*, [8 x i32]*) #7

; Function Attrs: convergent nounwind
declare void @__kmpc_end_reduce(%struct.ident_t*, i32, [8 x i32]*) #7

; Function Attrs: nounwind
declare dso_local double @sqrt(double noundef) #11

; Function Attrs: nounwind
declare i32 @__kmpc_master(%struct.ident_t*, i32) #6

; Function Attrs: nounwind
declare void @__kmpc_end_master(%struct.ident_t*, i32) #6

declare dso_local void @_Z10timer_stopi(i32 noundef) #1

declare dso_local noundef double @_Z10timer_readi(i32 noundef) #1

; Function Attrs: nounwind
declare dso_local i32 @gettimeofday(%struct.timeval* noundef, i8* noundef) #11

; Function Attrs: noinline norecurse uwtable
define internal void @.omp.reduction.reduction_func.21(i8* noundef %0, i8* noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to [2 x i8*]*
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to [2 x i8*]*
  %9 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 0
  %10 = load i8*, i8** %9, align 8
  %11 = bitcast i8* %10 to double*
  %12 = getelementptr inbounds [2 x i8*], [2 x i8*]* %6, i64 0, i64 0
  %13 = load i8*, i8** %12, align 8
  %14 = bitcast i8* %13 to double*
  %15 = getelementptr inbounds [2 x i8*], [2 x i8*]* %8, i64 0, i64 1
  %16 = load i8*, i8** %15, align 8
  %17 = bitcast i8* %16 to double*
  %18 = getelementptr inbounds [2 x i8*], [2 x i8*]* %6, i64 0, i64 1
  %19 = load i8*, i8** %18, align 8
  %20 = bitcast i8* %19 to double*
  %21 = load double, double* %14, align 8
  %22 = load double, double* %11, align 8
  %23 = fadd double %21, %22
  store double %23, double* %14, align 8
  %24 = load double, double* %20, align 8
  %25 = load double, double* %17, align 8
  %26 = fadd double %24, %25
  store double %26, double* %20, align 8
  ret void
}

; Function Attrs: nounwind
declare !callback !15 void @__kmpc_fork_call(%struct.ident_t*, i32, void (i32*, i32*, ...)*, ...) #6

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.fabs.f64(double) #9

; Function Attrs: nounwind
declare dso_local i32 @setenv(i8* noundef, i8* noundef, i32 noundef) #11

declare dso_local void @_Z15c_print_resultsPcciiiiddS_iS_S_S_S_S_S_S_S_S_S_S_S_(i8* noundef, i8 noundef signext, i32 noundef, i32 noundef, i32 noundef, i32 noundef, double noundef, double noundef, i8* noundef, i32 noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef, i8* noundef) #1

; Function Attrs: nounwind
declare dso_local i8* @getenv(i8* noundef) #11

; Function Attrs: mustprogress noinline optnone uwtable
define internal void @_ZL6sprnvciiiPdPi(i32 noundef %0, i32 noundef %1, i32 noundef %2, double* noundef %3, i32* noundef %4) #4 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca double*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store double* %3, double** %9, align 8
  store i32* %4, i32** %10, align 8
  store i32 0, i32* %11, align 4
  br label %17

17:                                               ; preds = %56, %55, %33, %5
  %18 = load i32, i32* %11, align 4
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %69

21:                                               ; preds = %17
  %22 = load double, double* @_ZL5amult, align 8
  %23 = call noundef double @_Z6randlcPdd(double* noundef @_ZL4tran, double noundef %22)
  store double %23, double* %14, align 8
  %24 = load double, double* @_ZL5amult, align 8
  %25 = call noundef double @_Z6randlcPdd(double* noundef @_ZL4tran, double noundef %24)
  store double %25, double* %15, align 8
  %26 = load double, double* %15, align 8
  %27 = load i32, i32* %8, align 4
  %28 = call noundef i32 @_ZL6icnvrtdi(double noundef %26, i32 noundef %27)
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %13, align 4
  %30 = load i32, i32* %13, align 4
  %31 = load i32, i32* %6, align 4
  %32 = icmp sgt i32 %30, %31
  br i1 %32, label %33, label %34

33:                                               ; preds = %21
  br label %17, !llvm.loop !17

34:                                               ; preds = %21
  store i32 0, i32* %16, align 4
  store i32 0, i32* %12, align 4
  br label %35

35:                                               ; preds = %49, %34
  %36 = load i32, i32* %12, align 4
  %37 = load i32, i32* %11, align 4
  %38 = icmp slt i32 %36, %37
  br i1 %38, label %39, label %52

39:                                               ; preds = %35
  %40 = load i32*, i32** %10, align 8
  %41 = load i32, i32* %12, align 4
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i32, i32* %40, i64 %42
  %44 = load i32, i32* %43, align 4
  %45 = load i32, i32* %13, align 4
  %46 = icmp eq i32 %44, %45
  br i1 %46, label %47, label %48

47:                                               ; preds = %39
  store i32 1, i32* %16, align 4
  br label %52

48:                                               ; preds = %39
  br label %49

49:                                               ; preds = %48
  %50 = load i32, i32* %12, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %12, align 4
  br label %35, !llvm.loop !18

52:                                               ; preds = %47, %35
  %53 = load i32, i32* %16, align 4
  %54 = icmp ne i32 %53, 0
  br i1 %54, label %55, label %56

55:                                               ; preds = %52
  br label %17, !llvm.loop !17

56:                                               ; preds = %52
  %57 = load double, double* %14, align 8
  %58 = load double*, double** %9, align 8
  %59 = load i32, i32* %11, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds double, double* %58, i64 %60
  store double %57, double* %61, align 8
  %62 = load i32, i32* %13, align 4
  %63 = load i32*, i32** %10, align 8
  %64 = load i32, i32* %11, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i32, i32* %63, i64 %65
  store i32 %62, i32* %66, align 4
  %67 = load i32, i32* %11, align 4
  %68 = add nsw i32 %67, 1
  store i32 %68, i32* %11, align 4
  br label %17, !llvm.loop !17

69:                                               ; preds = %17
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal void @_ZL6vecsetiPdPiS0_id(i32 noundef %0, double* noundef %1, i32* noundef %2, i32* noundef %3, i32 noundef %4, double noundef %5) #12 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store i32* %2, i32** %9, align 8
  store i32* %3, i32** %10, align 8
  store i32 %4, i32* %11, align 4
  store double %5, double* %12, align 8
  store i32 0, i32* %14, align 4
  store i32 0, i32* %13, align 4
  br label %15

15:                                               ; preds = %35, %6
  %16 = load i32, i32* %13, align 4
  %17 = load i32*, i32** %10, align 8
  %18 = load i32, i32* %17, align 4
  %19 = icmp slt i32 %16, %18
  br i1 %19, label %20, label %38

20:                                               ; preds = %15
  %21 = load i32*, i32** %9, align 8
  %22 = load i32, i32* %13, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i32, i32* %21, i64 %23
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %11, align 4
  %27 = icmp eq i32 %25, %26
  br i1 %27, label %28, label %34

28:                                               ; preds = %20
  %29 = load double, double* %12, align 8
  %30 = load double*, double** %8, align 8
  %31 = load i32, i32* %13, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds double, double* %30, i64 %32
  store double %29, double* %33, align 8
  store i32 1, i32* %14, align 4
  br label %34

34:                                               ; preds = %28, %20
  br label %35

35:                                               ; preds = %34
  %36 = load i32, i32* %13, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %13, align 4
  br label %15, !llvm.loop !19

38:                                               ; preds = %15
  %39 = load i32, i32* %14, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %58

41:                                               ; preds = %38
  %42 = load double, double* %12, align 8
  %43 = load double*, double** %8, align 8
  %44 = load i32*, i32** %10, align 8
  %45 = load i32, i32* %44, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds double, double* %43, i64 %46
  store double %42, double* %47, align 8
  %48 = load i32, i32* %11, align 4
  %49 = load i32*, i32** %9, align 8
  %50 = load i32*, i32** %10, align 8
  %51 = load i32, i32* %50, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32* %49, i64 %52
  store i32 %48, i32* %53, align 4
  %54 = load i32*, i32** %10, align 8
  %55 = load i32, i32* %54, align 4
  %56 = add nsw i32 %55, 1
  %57 = load i32*, i32** %10, align 8
  store i32 %56, i32* %57, align 4
  br label %58

58:                                               ; preds = %41, %38
  ret void
}

; Function Attrs: mustprogress noinline optnone uwtable
define internal void @_ZL6sparsePdPiS0_iiiS0_PA16_iPA16_diiS0_dd(double* noundef %0, i32* noundef %1, i32* noundef %2, i32 noundef %3, i32 noundef %4, i32 noundef %5, i32* noundef %6, [16 x i32]* noundef %7, [16 x double]* noundef %8, i32 noundef %9, i32 noundef %10, i32* noundef %11, double noundef %12, double noundef %13) #4 {
  %15 = alloca double*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca i32*, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32*, align 8
  %22 = alloca [16 x i32]*, align 8
  %23 = alloca [16 x double]*, align 8
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32*, align 8
  %27 = alloca double, align 8
  %28 = alloca double, align 8
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca i32, align 4
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca double, align 8
  %40 = alloca double, align 8
  %41 = alloca double, align 8
  %42 = alloca double, align 8
  %43 = alloca i32, align 4
  store double* %0, double** %15, align 8
  store i32* %1, i32** %16, align 8
  store i32* %2, i32** %17, align 8
  store i32 %3, i32* %18, align 4
  store i32 %4, i32* %19, align 4
  store i32 %5, i32* %20, align 4
  store i32* %6, i32** %21, align 8
  store [16 x i32]* %7, [16 x i32]** %22, align 8
  store [16 x double]* %8, [16 x double]** %23, align 8
  store i32 %9, i32* %24, align 4
  store i32 %10, i32* %25, align 4
  store i32* %11, i32** %26, align 8
  store double %12, double* %27, align 8
  store double %13, double* %28, align 8
  %44 = load i32, i32* %25, align 4
  %45 = load i32, i32* %24, align 4
  %46 = sub nsw i32 %44, %45
  %47 = add nsw i32 %46, 1
  store i32 %47, i32* %29, align 4
  store i32 0, i32* %31, align 4
  br label %48

48:                                               ; preds = %58, %14
  %49 = load i32, i32* %31, align 4
  %50 = load i32, i32* %29, align 4
  %51 = add nsw i32 %50, 1
  %52 = icmp slt i32 %49, %51
  br i1 %52, label %53, label %61

53:                                               ; preds = %48
  %54 = load i32*, i32** %17, align 8
  %55 = load i32, i32* %31, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %54, i64 %56
  store i32 0, i32* %57, align 4
  br label %58

58:                                               ; preds = %53
  %59 = load i32, i32* %31, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %31, align 4
  br label %48, !llvm.loop !20

61:                                               ; preds = %48
  store i32 0, i32* %30, align 4
  br label %62

62:                                               ; preds = %104, %61
  %63 = load i32, i32* %30, align 4
  %64 = load i32, i32* %18, align 4
  %65 = icmp slt i32 %63, %64
  br i1 %65, label %66, label %107

66:                                               ; preds = %62
  store i32 0, i32* %34, align 4
  br label %67

67:                                               ; preds = %100, %66
  %68 = load i32, i32* %34, align 4
  %69 = load i32*, i32** %21, align 8
  %70 = load i32, i32* %30, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i32, i32* %69, i64 %71
  %73 = load i32, i32* %72, align 4
  %74 = icmp slt i32 %68, %73
  br i1 %74, label %75, label %103

75:                                               ; preds = %67
  %76 = load [16 x i32]*, [16 x i32]** %22, align 8
  %77 = load i32, i32* %30, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [16 x i32], [16 x i32]* %76, i64 %78
  %80 = load i32, i32* %34, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [16 x i32], [16 x i32]* %79, i64 0, i64 %81
  %83 = load i32, i32* %82, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %31, align 4
  %85 = load i32*, i32** %17, align 8
  %86 = load i32, i32* %31, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %85, i64 %87
  %89 = load i32, i32* %88, align 4
  %90 = load i32*, i32** %21, align 8
  %91 = load i32, i32* %30, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %90, i64 %92
  %94 = load i32, i32* %93, align 4
  %95 = add nsw i32 %89, %94
  %96 = load i32*, i32** %17, align 8
  %97 = load i32, i32* %31, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32* %96, i64 %98
  store i32 %95, i32* %99, align 4
  br label %100

100:                                              ; preds = %75
  %101 = load i32, i32* %34, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %34, align 4
  br label %67, !llvm.loop !21

103:                                              ; preds = %67
  br label %104

104:                                              ; preds = %103
  %105 = load i32, i32* %30, align 4
  %106 = add nsw i32 %105, 1
  store i32 %106, i32* %30, align 4
  br label %62, !llvm.loop !22

107:                                              ; preds = %62
  %108 = load i32*, i32** %17, align 8
  %109 = getelementptr inbounds i32, i32* %108, i64 0
  store i32 0, i32* %109, align 4
  store i32 1, i32* %31, align 4
  br label %110

110:                                              ; preds = %132, %107
  %111 = load i32, i32* %31, align 4
  %112 = load i32, i32* %29, align 4
  %113 = add nsw i32 %112, 1
  %114 = icmp slt i32 %111, %113
  br i1 %114, label %115, label %135

115:                                              ; preds = %110
  %116 = load i32*, i32** %17, align 8
  %117 = load i32, i32* %31, align 4
  %118 = sext i32 %117 to i64
  %119 = getelementptr inbounds i32, i32* %116, i64 %118
  %120 = load i32, i32* %119, align 4
  %121 = load i32*, i32** %17, align 8
  %122 = load i32, i32* %31, align 4
  %123 = sub nsw i32 %122, 1
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32* %121, i64 %124
  %126 = load i32, i32* %125, align 4
  %127 = add nsw i32 %120, %126
  %128 = load i32*, i32** %17, align 8
  %129 = load i32, i32* %31, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds i32, i32* %128, i64 %130
  store i32 %127, i32* %131, align 4
  br label %132

132:                                              ; preds = %115
  %133 = load i32, i32* %31, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %31, align 4
  br label %110, !llvm.loop !23

135:                                              ; preds = %110
  %136 = load i32*, i32** %17, align 8
  %137 = load i32, i32* %29, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32* %136, i64 %138
  %140 = load i32, i32* %139, align 4
  %141 = sub nsw i32 %140, 1
  store i32 %141, i32* %34, align 4
  %142 = load i32, i32* %34, align 4
  %143 = load i32, i32* %19, align 4
  %144 = icmp sgt i32 %142, %143
  br i1 %144, label %145, label %150

145:                                              ; preds = %135
  %146 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([46 x i8], [46 x i8]* @.str.53, i64 0, i64 0))
  %147 = load i32, i32* %34, align 4
  %148 = load i32, i32* %19, align 4
  %149 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([21 x i8], [21 x i8]* @.str.54, i64 0, i64 0), i32 noundef %147, i32 noundef %148)
  call void @exit(i32 noundef 1) #19
  unreachable

150:                                              ; preds = %135
  store i32 0, i32* %31, align 4
  br label %151

151:                                              ; preds = %187, %150
  %152 = load i32, i32* %31, align 4
  %153 = load i32, i32* %29, align 4
  %154 = icmp slt i32 %152, %153
  br i1 %154, label %155, label %190

155:                                              ; preds = %151
  %156 = load i32*, i32** %17, align 8
  %157 = load i32, i32* %31, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i32, i32* %156, i64 %158
  %160 = load i32, i32* %159, align 4
  store i32 %160, i32* %35, align 4
  br label %161

161:                                              ; preds = %179, %155
  %162 = load i32, i32* %35, align 4
  %163 = load i32*, i32** %17, align 8
  %164 = load i32, i32* %31, align 4
  %165 = add nsw i32 %164, 1
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds i32, i32* %163, i64 %166
  %168 = load i32, i32* %167, align 4
  %169 = icmp slt i32 %162, %168
  br i1 %169, label %170, label %182

170:                                              ; preds = %161
  %171 = load double*, double** %15, align 8
  %172 = load i32, i32* %35, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds double, double* %171, i64 %173
  store double 0.000000e+00, double* %174, align 8
  %175 = load i32*, i32** %16, align 8
  %176 = load i32, i32* %35, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i32, i32* %175, i64 %177
  store i32 -1, i32* %178, align 4
  br label %179

179:                                              ; preds = %170
  %180 = load i32, i32* %35, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %35, align 4
  br label %161, !llvm.loop !24

182:                                              ; preds = %161
  %183 = load i32*, i32** %26, align 8
  %184 = load i32, i32* %31, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds i32, i32* %183, i64 %185
  store i32 0, i32* %186, align 4
  br label %187

187:                                              ; preds = %182
  %188 = load i32, i32* %31, align 4
  %189 = add nsw i32 %188, 1
  store i32 %189, i32* %31, align 4
  br label %151, !llvm.loop !25

190:                                              ; preds = %151
  store double 1.000000e+00, double* %39, align 8
  %191 = load double, double* %27, align 8
  %192 = load i32, i32* %18, align 4
  %193 = sitofp i32 %192 to double
  %194 = fdiv double 1.000000e+00, %193
  %195 = call double @pow(double noundef %191, double noundef %194) #6
  store double %195, double* %41, align 8
  store i32 0, i32* %30, align 4
  br label %196

196:                                              ; preds = %412, %190
  %197 = load i32, i32* %30, align 4
  %198 = load i32, i32* %18, align 4
  %199 = icmp slt i32 %197, %198
  br i1 %199, label %200, label %415

200:                                              ; preds = %196
  store i32 0, i32* %34, align 4
  br label %201

201:                                              ; preds = %405, %200
  %202 = load i32, i32* %34, align 4
  %203 = load i32*, i32** %21, align 8
  %204 = load i32, i32* %30, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds i32, i32* %203, i64 %205
  %207 = load i32, i32* %206, align 4
  %208 = icmp slt i32 %202, %207
  br i1 %208, label %209, label %408

209:                                              ; preds = %201
  %210 = load [16 x i32]*, [16 x i32]** %22, align 8
  %211 = load i32, i32* %30, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [16 x i32], [16 x i32]* %210, i64 %212
  %214 = load i32, i32* %34, align 4
  %215 = sext i32 %214 to i64
  %216 = getelementptr inbounds [16 x i32], [16 x i32]* %213, i64 0, i64 %215
  %217 = load i32, i32* %216, align 4
  store i32 %217, i32* %31, align 4
  %218 = load double, double* %39, align 8
  %219 = load [16 x double]*, [16 x double]** %23, align 8
  %220 = load i32, i32* %30, align 4
  %221 = sext i32 %220 to i64
  %222 = getelementptr inbounds [16 x double], [16 x double]* %219, i64 %221
  %223 = load i32, i32* %34, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [16 x double], [16 x double]* %222, i64 0, i64 %224
  %226 = load double, double* %225, align 8
  %227 = fmul double %218, %226
  store double %227, double* %40, align 8
  store i32 0, i32* %37, align 4
  br label %228

228:                                              ; preds = %401, %209
  %229 = load i32, i32* %37, align 4
  %230 = load i32*, i32** %21, align 8
  %231 = load i32, i32* %30, align 4
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds i32, i32* %230, i64 %232
  %234 = load i32, i32* %233, align 4
  %235 = icmp slt i32 %229, %234
  br i1 %235, label %236, label %404

236:                                              ; preds = %228
  %237 = load [16 x i32]*, [16 x i32]** %22, align 8
  %238 = load i32, i32* %30, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [16 x i32], [16 x i32]* %237, i64 %239
  %241 = load i32, i32* %37, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [16 x i32], [16 x i32]* %240, i64 0, i64 %242
  %244 = load i32, i32* %243, align 4
  store i32 %244, i32* %38, align 4
  %245 = load [16 x double]*, [16 x double]** %23, align 8
  %246 = load i32, i32* %30, align 4
  %247 = sext i32 %246 to i64
  %248 = getelementptr inbounds [16 x double], [16 x double]* %245, i64 %247
  %249 = load i32, i32* %37, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [16 x double], [16 x double]* %248, i64 0, i64 %250
  %252 = load double, double* %251, align 8
  %253 = load double, double* %40, align 8
  %254 = fmul double %252, %253
  store double %254, double* %42, align 8
  %255 = load i32, i32* %38, align 4
  %256 = load i32, i32* %31, align 4
  %257 = icmp eq i32 %255, %256
  br i1 %257, label %258, label %268

258:                                              ; preds = %236
  %259 = load i32, i32* %31, align 4
  %260 = load i32, i32* %30, align 4
  %261 = icmp eq i32 %259, %260
  br i1 %261, label %262, label %268

262:                                              ; preds = %258
  %263 = load double, double* %42, align 8
  %264 = load double, double* %27, align 8
  %265 = fadd double %263, %264
  %266 = load double, double* %28, align 8
  %267 = fsub double %265, %266
  store double %267, double* %42, align 8
  br label %268

268:                                              ; preds = %262, %258, %236
  store i32 0, i32* %43, align 4
  %269 = load i32*, i32** %17, align 8
  %270 = load i32, i32* %31, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds i32, i32* %269, i64 %271
  %273 = load i32, i32* %272, align 4
  store i32 %273, i32* %35, align 4
  br label %274

274:                                              ; preds = %380, %268
  %275 = load i32, i32* %35, align 4
  %276 = load i32*, i32** %17, align 8
  %277 = load i32, i32* %31, align 4
  %278 = add nsw i32 %277, 1
  %279 = sext i32 %278 to i64
  %280 = getelementptr inbounds i32, i32* %276, i64 %279
  %281 = load i32, i32* %280, align 4
  %282 = icmp slt i32 %275, %281
  br i1 %282, label %283, label %383

283:                                              ; preds = %274
  %284 = load i32*, i32** %16, align 8
  %285 = load i32, i32* %35, align 4
  %286 = sext i32 %285 to i64
  %287 = getelementptr inbounds i32, i32* %284, i64 %286
  %288 = load i32, i32* %287, align 4
  %289 = load i32, i32* %38, align 4
  %290 = icmp sgt i32 %288, %289
  br i1 %290, label %291, label %345

291:                                              ; preds = %283
  %292 = load i32*, i32** %17, align 8
  %293 = load i32, i32* %31, align 4
  %294 = add nsw i32 %293, 1
  %295 = sext i32 %294 to i64
  %296 = getelementptr inbounds i32, i32* %292, i64 %295
  %297 = load i32, i32* %296, align 4
  %298 = sub nsw i32 %297, 2
  store i32 %298, i32* %36, align 4
  br label %299

299:                                              ; preds = %332, %291
  %300 = load i32, i32* %36, align 4
  %301 = load i32, i32* %35, align 4
  %302 = icmp sge i32 %300, %301
  br i1 %302, label %303, label %335

303:                                              ; preds = %299
  %304 = load i32*, i32** %16, align 8
  %305 = load i32, i32* %36, align 4
  %306 = sext i32 %305 to i64
  %307 = getelementptr inbounds i32, i32* %304, i64 %306
  %308 = load i32, i32* %307, align 4
  %309 = icmp sgt i32 %308, -1
  br i1 %309, label %310, label %331

310:                                              ; preds = %303
  %311 = load double*, double** %15, align 8
  %312 = load i32, i32* %36, align 4
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds double, double* %311, i64 %313
  %315 = load double, double* %314, align 8
  %316 = load double*, double** %15, align 8
  %317 = load i32, i32* %36, align 4
  %318 = add nsw i32 %317, 1
  %319 = sext i32 %318 to i64
  %320 = getelementptr inbounds double, double* %316, i64 %319
  store double %315, double* %320, align 8
  %321 = load i32*, i32** %16, align 8
  %322 = load i32, i32* %36, align 4
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds i32, i32* %321, i64 %323
  %325 = load i32, i32* %324, align 4
  %326 = load i32*, i32** %16, align 8
  %327 = load i32, i32* %36, align 4
  %328 = add nsw i32 %327, 1
  %329 = sext i32 %328 to i64
  %330 = getelementptr inbounds i32, i32* %326, i64 %329
  store i32 %325, i32* %330, align 4
  br label %331

331:                                              ; preds = %310, %303
  br label %332

332:                                              ; preds = %331
  %333 = load i32, i32* %36, align 4
  %334 = add nsw i32 %333, -1
  store i32 %334, i32* %36, align 4
  br label %299, !llvm.loop !26

335:                                              ; preds = %299
  %336 = load i32, i32* %38, align 4
  %337 = load i32*, i32** %16, align 8
  %338 = load i32, i32* %35, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds i32, i32* %337, i64 %339
  store i32 %336, i32* %340, align 4
  %341 = load double*, double** %15, align 8
  %342 = load i32, i32* %35, align 4
  %343 = sext i32 %342 to i64
  %344 = getelementptr inbounds double, double* %341, i64 %343
  store double 0.000000e+00, double* %344, align 8
  store i32 1, i32* %43, align 4
  br label %383

345:                                              ; preds = %283
  %346 = load i32*, i32** %16, align 8
  %347 = load i32, i32* %35, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds i32, i32* %346, i64 %348
  %350 = load i32, i32* %349, align 4
  %351 = icmp eq i32 %350, -1
  br i1 %351, label %352, label %358

352:                                              ; preds = %345
  %353 = load i32, i32* %38, align 4
  %354 = load i32*, i32** %16, align 8
  %355 = load i32, i32* %35, align 4
  %356 = sext i32 %355 to i64
  %357 = getelementptr inbounds i32, i32* %354, i64 %356
  store i32 %353, i32* %357, align 4
  store i32 1, i32* %43, align 4
  br label %383

358:                                              ; preds = %345
  %359 = load i32*, i32** %16, align 8
  %360 = load i32, i32* %35, align 4
  %361 = sext i32 %360 to i64
  %362 = getelementptr inbounds i32, i32* %359, i64 %361
  %363 = load i32, i32* %362, align 4
  %364 = load i32, i32* %38, align 4
  %365 = icmp eq i32 %363, %364
  br i1 %365, label %366, label %377

366:                                              ; preds = %358
  %367 = load i32*, i32** %26, align 8
  %368 = load i32, i32* %31, align 4
  %369 = sext i32 %368 to i64
  %370 = getelementptr inbounds i32, i32* %367, i64 %369
  %371 = load i32, i32* %370, align 4
  %372 = add nsw i32 %371, 1
  %373 = load i32*, i32** %26, align 8
  %374 = load i32, i32* %31, align 4
  %375 = sext i32 %374 to i64
  %376 = getelementptr inbounds i32, i32* %373, i64 %375
  store i32 %372, i32* %376, align 4
  store i32 1, i32* %43, align 4
  br label %383

377:                                              ; preds = %358
  br label %378

378:                                              ; preds = %377
  br label %379

379:                                              ; preds = %378
  br label %380

380:                                              ; preds = %379
  %381 = load i32, i32* %35, align 4
  %382 = add nsw i32 %381, 1
  store i32 %382, i32* %35, align 4
  br label %274, !llvm.loop !27

383:                                              ; preds = %366, %352, %335, %274
  %384 = load i32, i32* %43, align 4
  %385 = icmp eq i32 %384, 0
  br i1 %385, label %386, label %389

386:                                              ; preds = %383
  %387 = load i32, i32* %30, align 4
  %388 = call i32 (i8*, ...) @printf(i8* noundef getelementptr inbounds ([32 x i8], [32 x i8]* @.str.55, i64 0, i64 0), i32 noundef %387)
  call void @exit(i32 noundef 1) #19
  unreachable

389:                                              ; preds = %383
  %390 = load double*, double** %15, align 8
  %391 = load i32, i32* %35, align 4
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds double, double* %390, i64 %392
  %394 = load double, double* %393, align 8
  %395 = load double, double* %42, align 8
  %396 = fadd double %394, %395
  %397 = load double*, double** %15, align 8
  %398 = load i32, i32* %35, align 4
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds double, double* %397, i64 %399
  store double %396, double* %400, align 8
  br label %401

401:                                              ; preds = %389
  %402 = load i32, i32* %37, align 4
  %403 = add nsw i32 %402, 1
  store i32 %403, i32* %37, align 4
  br label %228, !llvm.loop !28

404:                                              ; preds = %228
  br label %405

405:                                              ; preds = %404
  %406 = load i32, i32* %34, align 4
  %407 = add nsw i32 %406, 1
  store i32 %407, i32* %34, align 4
  br label %201, !llvm.loop !29

408:                                              ; preds = %201
  %409 = load double, double* %39, align 8
  %410 = load double, double* %41, align 8
  %411 = fmul double %409, %410
  store double %411, double* %39, align 8
  br label %412

412:                                              ; preds = %408
  %413 = load i32, i32* %30, align 4
  %414 = add nsw i32 %413, 1
  store i32 %414, i32* %30, align 4
  br label %196, !llvm.loop !30

415:                                              ; preds = %196
  store i32 1, i32* %31, align 4
  br label %416

416:                                              ; preds = %437, %415
  %417 = load i32, i32* %31, align 4
  %418 = load i32, i32* %29, align 4
  %419 = icmp slt i32 %417, %418
  br i1 %419, label %420, label %440

420:                                              ; preds = %416
  %421 = load i32*, i32** %26, align 8
  %422 = load i32, i32* %31, align 4
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds i32, i32* %421, i64 %423
  %425 = load i32, i32* %424, align 4
  %426 = load i32*, i32** %26, align 8
  %427 = load i32, i32* %31, align 4
  %428 = sub nsw i32 %427, 1
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds i32, i32* %426, i64 %429
  %431 = load i32, i32* %430, align 4
  %432 = add nsw i32 %425, %431
  %433 = load i32*, i32** %26, align 8
  %434 = load i32, i32* %31, align 4
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds i32, i32* %433, i64 %435
  store i32 %432, i32* %436, align 4
  br label %437

437:                                              ; preds = %420
  %438 = load i32, i32* %31, align 4
  %439 = add nsw i32 %438, 1
  store i32 %439, i32* %31, align 4
  br label %416, !llvm.loop !31

440:                                              ; preds = %416
  store i32 0, i32* %31, align 4
  br label %441

441:                                              ; preds = %510, %440
  %442 = load i32, i32* %31, align 4
  %443 = load i32, i32* %29, align 4
  %444 = icmp slt i32 %442, %443
  br i1 %444, label %445, label %513

445:                                              ; preds = %441
  %446 = load i32, i32* %31, align 4
  %447 = icmp sgt i32 %446, 0
  br i1 %447, label %448, label %461

448:                                              ; preds = %445
  %449 = load i32*, i32** %17, align 8
  %450 = load i32, i32* %31, align 4
  %451 = sext i32 %450 to i64
  %452 = getelementptr inbounds i32, i32* %449, i64 %451
  %453 = load i32, i32* %452, align 4
  %454 = load i32*, i32** %26, align 8
  %455 = load i32, i32* %31, align 4
  %456 = sub nsw i32 %455, 1
  %457 = sext i32 %456 to i64
  %458 = getelementptr inbounds i32, i32* %454, i64 %457
  %459 = load i32, i32* %458, align 4
  %460 = sub nsw i32 %453, %459
  store i32 %460, i32* %32, align 4
  br label %462

461:                                              ; preds = %445
  store i32 0, i32* %32, align 4
  br label %462

462:                                              ; preds = %461, %448
  %463 = load i32*, i32** %17, align 8
  %464 = load i32, i32* %31, align 4
  %465 = add nsw i32 %464, 1
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds i32, i32* %463, i64 %466
  %468 = load i32, i32* %467, align 4
  %469 = load i32*, i32** %26, align 8
  %470 = load i32, i32* %31, align 4
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds i32, i32* %469, i64 %471
  %473 = load i32, i32* %472, align 4
  %474 = sub nsw i32 %468, %473
  store i32 %474, i32* %33, align 4
  %475 = load i32*, i32** %17, align 8
  %476 = load i32, i32* %31, align 4
  %477 = sext i32 %476 to i64
  %478 = getelementptr inbounds i32, i32* %475, i64 %477
  %479 = load i32, i32* %478, align 4
  store i32 %479, i32* %34, align 4
  %480 = load i32, i32* %32, align 4
  store i32 %480, i32* %35, align 4
  br label %481

481:                                              ; preds = %506, %462
  %482 = load i32, i32* %35, align 4
  %483 = load i32, i32* %33, align 4
  %484 = icmp slt i32 %482, %483
  br i1 %484, label %485, label %509

485:                                              ; preds = %481
  %486 = load double*, double** %15, align 8
  %487 = load i32, i32* %34, align 4
  %488 = sext i32 %487 to i64
  %489 = getelementptr inbounds double, double* %486, i64 %488
  %490 = load double, double* %489, align 8
  %491 = load double*, double** %15, align 8
  %492 = load i32, i32* %35, align 4
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds double, double* %491, i64 %493
  store double %490, double* %494, align 8
  %495 = load i32*, i32** %16, align 8
  %496 = load i32, i32* %34, align 4
  %497 = sext i32 %496 to i64
  %498 = getelementptr inbounds i32, i32* %495, i64 %497
  %499 = load i32, i32* %498, align 4
  %500 = load i32*, i32** %16, align 8
  %501 = load i32, i32* %35, align 4
  %502 = sext i32 %501 to i64
  %503 = getelementptr inbounds i32, i32* %500, i64 %502
  store i32 %499, i32* %503, align 4
  %504 = load i32, i32* %34, align 4
  %505 = add nsw i32 %504, 1
  store i32 %505, i32* %34, align 4
  br label %506

506:                                              ; preds = %485
  %507 = load i32, i32* %35, align 4
  %508 = add nsw i32 %507, 1
  store i32 %508, i32* %35, align 4
  br label %481, !llvm.loop !32

509:                                              ; preds = %481
  br label %510

510:                                              ; preds = %509
  %511 = load i32, i32* %31, align 4
  %512 = add nsw i32 %511, 1
  store i32 %512, i32* %31, align 4
  br label %441, !llvm.loop !33

513:                                              ; preds = %441
  store i32 1, i32* %31, align 4
  br label %514

514:                                              ; preds = %536, %513
  %515 = load i32, i32* %31, align 4
  %516 = load i32, i32* %29, align 4
  %517 = add nsw i32 %516, 1
  %518 = icmp slt i32 %515, %517
  br i1 %518, label %519, label %539

519:                                              ; preds = %514
  %520 = load i32*, i32** %17, align 8
  %521 = load i32, i32* %31, align 4
  %522 = sext i32 %521 to i64
  %523 = getelementptr inbounds i32, i32* %520, i64 %522
  %524 = load i32, i32* %523, align 4
  %525 = load i32*, i32** %26, align 8
  %526 = load i32, i32* %31, align 4
  %527 = sub nsw i32 %526, 1
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds i32, i32* %525, i64 %528
  %530 = load i32, i32* %529, align 4
  %531 = sub nsw i32 %524, %530
  %532 = load i32*, i32** %17, align 8
  %533 = load i32, i32* %31, align 4
  %534 = sext i32 %533 to i64
  %535 = getelementptr inbounds i32, i32* %532, i64 %534
  store i32 %531, i32* %535, align 4
  br label %536

536:                                              ; preds = %519
  %537 = load i32, i32* %31, align 4
  %538 = add nsw i32 %537, 1
  store i32 %538, i32* %31, align 4
  br label %514, !llvm.loop !34

539:                                              ; preds = %514
  %540 = load i32*, i32** %17, align 8
  %541 = load i32, i32* %29, align 4
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds i32, i32* %540, i64 %542
  %544 = load i32, i32* %543, align 4
  %545 = sub nsw i32 %544, 1
  store i32 %545, i32* %34, align 4
  ret void
}

; Function Attrs: mustprogress noinline nounwind optnone uwtable
define internal noundef i32 @_ZL6icnvrtdi(double noundef %0, i32 noundef %1) #12 {
  %3 = alloca double, align 8
  %4 = alloca i32, align 4
  store double %0, double* %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = sitofp i32 %5 to double
  %7 = load double, double* %3, align 8
  %8 = fmul double %6, %7
  %9 = fptosi double %8 to i32
  ret i32 %9
}

; Function Attrs: noreturn nounwind
declare dso_local void @exit(i32 noundef) #13

; Function Attrs: nounwind
declare dso_local double @pow(double noundef, double noundef) #11

; Function Attrs: nounwind
declare i32 @__kmpc_global_thread_num(%struct.ident_t*) #6

; Function Attrs: noinline optnone uwtable
define internal void @__captured_stmt(%struct.anon* noalias noundef %0) #14 {
  %2 = alloca %struct.anon*, align 8
  %3 = alloca %struct.anon.0, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store %struct.anon* %0, %struct.anon** %2, align 8
  %8 = load %struct.anon*, %struct.anon** %2, align 8
  %9 = load i32, i32* @numThreads, align 4
  call void @__kmpc_taskgroup(%struct.ident_t* @2, i32 %7)
  %10 = load i32, i32* @_ZL3naa, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* %5, align 4
  %12 = load i32, i32* %5, align 4
  %13 = sub nsw i32 %12, 0
  %14 = sdiv i32 %13, 1
  %15 = sub nsw i32 %14, 1
  store i32 %15, i32* %6, align 4
  %16 = call i8* @__kmpc_omp_task_alloc(%struct.ident_t* @2, i32 %7, i32 1, i64 120, i64 1, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates*)* @.omp_task_entry to i32 (i32, i8*)*))
  call void @__kmpc_set_task_static_id(i32 %7, i8* %16)
  %17 = bitcast i8* %16 to %struct.kmp_task_t_with_privates*
  %18 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %17, i32 0, i32 0
  %19 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %17, i32 0, i32 1
  %20 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.anon, %struct.anon* %8, i32 0, i32 0
  %22 = load double**, double*** %21, align 8
  %23 = load double*, double** %22, align 8
  store double* %23, double** %20, align 8
  %24 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %19, i32 0, i32 1
  %25 = getelementptr inbounds %struct.anon, %struct.anon* %8, i32 0, i32 1
  %26 = load double**, double*** %25, align 8
  %27 = load double*, double** %26, align 8
  store double* %27, double** %24, align 8
  %28 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %19, i32 0, i32 2
  %29 = getelementptr inbounds %struct.anon, %struct.anon* %8, i32 0, i32 2
  %30 = load double**, double*** %29, align 8
  %31 = load double*, double** %30, align 8
  store double* %31, double** %28, align 8
  %32 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %19, i32 0, i32 3
  %33 = getelementptr inbounds %struct.anon, %struct.anon* %8, i32 0, i32 3
  %34 = load double**, double*** %33, align 8
  %35 = load double*, double** %34, align 8
  store double* %35, double** %32, align 8
  %36 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %19, i32 0, i32 4
  %37 = getelementptr inbounds %struct.anon, %struct.anon* %8, i32 0, i32 4
  %38 = load double**, double*** %37, align 8
  %39 = load double*, double** %38, align 8
  store double* %39, double** %36, align 8
  %40 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %18, i32 0, i32 5
  store i64 0, i64* %40, align 8
  %41 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %18, i32 0, i32 6
  %42 = load i32, i32* %6, align 4
  %43 = sext i32 %42 to i64
  store i64 %43, i64* %41, align 8
  %44 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %18, i32 0, i32 7
  store i64 1, i64* %44, align 8
  %45 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %18, i32 0, i32 9
  %46 = bitcast i8** %45 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %46, i8 0, i64 8, i1 false)
  %47 = load i64, i64* %44, align 8
  %48 = zext i32 %9 to i64
  call void @__kmpc_taskloop(%struct.ident_t* @2, i32 %7, i8* %16, i32 1, i64* %40, i64* %41, i64 %47, i32 1, i32 2, i64 %48, i8* null)
  call void @__kmpc_end_taskgroup(%struct.ident_t* @2, i32 %7)
  ret void
}

; Function Attrs: convergent nounwind
declare void @__kmpc_taskgroup(%struct.ident_t*, i32) #7

; Function Attrs: convergent nounwind
declare void @__kmpc_end_taskgroup(%struct.ident_t*, i32) #7

; Function Attrs: noinline uwtable
define internal void @.omp_task_privates_map.(%struct..kmp_privates.t* noalias noundef %0, double*** noalias noundef %1, double*** noalias noundef %2, double*** noalias noundef %3, double*** noalias noundef %4, double*** noalias noundef %5) #0 {
  %7 = alloca %struct..kmp_privates.t*, align 8
  %8 = alloca double***, align 8
  %9 = alloca double***, align 8
  %10 = alloca double***, align 8
  %11 = alloca double***, align 8
  %12 = alloca double***, align 8
  store %struct..kmp_privates.t* %0, %struct..kmp_privates.t** %7, align 8
  store double*** %1, double**** %8, align 8
  store double*** %2, double**** %9, align 8
  store double*** %3, double**** %10, align 8
  store double*** %4, double**** %11, align 8
  store double*** %5, double**** %12, align 8
  %13 = load %struct..kmp_privates.t*, %struct..kmp_privates.t** %7, align 8
  %14 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %13, i32 0, i32 0
  %15 = load double***, double**** %8, align 8
  store double** %14, double*** %15, align 8
  %16 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %13, i32 0, i32 1
  %17 = load double***, double**** %9, align 8
  store double** %16, double*** %17, align 8
  %18 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %13, i32 0, i32 2
  %19 = load double***, double**** %10, align 8
  store double** %18, double*** %19, align 8
  %20 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %13, i32 0, i32 3
  %21 = load double***, double**** %11, align 8
  store double** %20, double*** %21, align 8
  %22 = getelementptr inbounds %struct..kmp_privates.t, %struct..kmp_privates.t* %13, i32 0, i32 4
  %23 = load double***, double**** %12, align 8
  store double** %22, double*** %23, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal noundef i32 @.omp_task_entry(i32 noundef %0, %struct.kmp_task_t_with_privates* noalias noundef %1) #10 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void (i8*, ...)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.anon.0*, align 8
  %14 = alloca double**, align 8
  %15 = alloca double**, align 8
  %16 = alloca double**, align 8
  %17 = alloca double**, align 8
  %18 = alloca double**, align 8
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca %struct.kmp_task_t_with_privates*, align 8
  store i32 %0, i32* %24, align 4
  store %struct.kmp_task_t_with_privates* %1, %struct.kmp_task_t_with_privates** %25, align 8
  %26 = load i32, i32* %24, align 4
  %27 = load %struct.kmp_task_t_with_privates*, %struct.kmp_task_t_with_privates** %25, align 8
  %28 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %27, i32 0, i32 0
  %29 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %28, i32 0, i32 2
  %30 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %28, i32 0, i32 0
  %31 = load i8*, i8** %30, align 8
  %32 = bitcast i8* %31 to %struct.anon.0*
  %33 = getelementptr inbounds %struct.kmp_task_t_with_privates, %struct.kmp_task_t_with_privates* %27, i32 0, i32 1
  %34 = bitcast %struct..kmp_privates.t* %33 to i8*
  %35 = bitcast %struct.kmp_task_t_with_privates* %27 to i8*
  %36 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %28, i32 0, i32 5
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %28, i32 0, i32 6
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %28, i32 0, i32 7
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %28, i32 0, i32 8
  %43 = load i32, i32* %42, align 8
  %44 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %28, i32 0, i32 9
  %45 = load i8*, i8** %44, align 8
  call void @llvm.experimental.noalias.scope.decl(metadata !35)
  call void @llvm.experimental.noalias.scope.decl(metadata !38)
  call void @llvm.experimental.noalias.scope.decl(metadata !40)
  call void @llvm.experimental.noalias.scope.decl(metadata !42)
  call void @llvm.experimental.noalias.scope.decl(metadata !44)
  store i32 %26, i32* %3, align 4, !noalias !46
  store i32* %29, i32** %4, align 8, !noalias !46
  store i8* %34, i8** %5, align 8, !noalias !46
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t*, double***, double***, double***, double***, double***)* @.omp_task_privates_map. to void (i8*, ...)*), void (i8*, ...)** %6, align 8, !noalias !46
  store i8* %35, i8** %7, align 8, !noalias !46
  store i64 %37, i64* %8, align 8, !noalias !46
  store i64 %39, i64* %9, align 8, !noalias !46
  store i64 %41, i64* %10, align 8, !noalias !46
  store i32 %43, i32* %11, align 4, !noalias !46
  store i8* %45, i8** %12, align 8, !noalias !46
  store %struct.anon.0* %32, %struct.anon.0** %13, align 8, !noalias !46
  %46 = load %struct.anon.0*, %struct.anon.0** %13, align 8, !noalias !46
  %47 = load void (i8*, ...)*, void (i8*, ...)** %6, align 8, !noalias !46
  %48 = load i8*, i8** %5, align 8, !noalias !46
  %49 = bitcast void (i8*, ...)* %47 to void (i8*, double***, double***, double***, double***, double***)*
  call void %49(i8* %48, double*** %14, double*** %15, double*** %16, double*** %17, double*** %18)
  %50 = load double**, double*** %14, align 8, !noalias !46
  %51 = load double**, double*** %15, align 8, !noalias !46
  %52 = load double**, double*** %16, align 8, !noalias !46
  %53 = load double**, double*** %17, align 8, !noalias !46
  %54 = load double**, double*** %18, align 8, !noalias !46
  %55 = load i32, i32* @_ZL3naa, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %19, align 4, !noalias !46
  %57 = load i32, i32* %19, align 4, !noalias !46
  %58 = sub nsw i32 %57, 1
  store i32 %58, i32* %20, align 4, !noalias !46
  store i32 0, i32* %21, align 4, !noalias !46
  %59 = load i32, i32* %19, align 4, !noalias !46
  %60 = icmp slt i32 0, %59
  br i1 %60, label %61, label %100

61:                                               ; preds = %2
  %62 = load i64, i64* %8, align 8, !noalias !46
  %63 = trunc i64 %62 to i32
  store i32 %63, i32* %23, align 4, !noalias !46
  br label %64

64:                                               ; preds = %69, %61
  %65 = load i32, i32* %23, align 4, !noalias !46
  %66 = sext i32 %65 to i64
  %67 = load i64, i64* %9, align 8, !noalias !46
  %68 = icmp ule i64 %66, %67
  br i1 %68, label %69, label %99

69:                                               ; preds = %64
  %70 = load i32, i32* %23, align 4, !noalias !46
  store i32 %70, i32* %22, align 4, !noalias !46
  %71 = load double*, double** %50, align 8
  %72 = load i32, i32* %22, align 4, !noalias !46
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds double, double* %71, i64 %73
  store double 0.000000e+00, double* %74, align 8
  %75 = load double*, double** %51, align 8
  %76 = load i32, i32* %22, align 4, !noalias !46
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds double, double* %75, i64 %77
  store double 0.000000e+00, double* %78, align 8
  %79 = load double*, double** %53, align 8
  %80 = load i32, i32* %22, align 4, !noalias !46
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double* %79, i64 %81
  %83 = load double, double* %82, align 8
  %84 = load double*, double** %52, align 8
  %85 = load i32, i32* %22, align 4, !noalias !46
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds double, double* %84, i64 %86
  store double %83, double* %87, align 8
  %88 = load double*, double** %52, align 8
  %89 = load i32, i32* %22, align 4, !noalias !46
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double* %88, i64 %90
  %92 = load double, double* %91, align 8
  %93 = load double*, double** %54, align 8
  %94 = load i32, i32* %22, align 4, !noalias !46
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double* %93, i64 %95
  store double %92, double* %96, align 8
  %97 = load i32, i32* %23, align 4, !noalias !46
  %98 = add nsw i32 %97, 1
  store i32 %98, i32* %23, align 4, !noalias !46
  br label %64

99:                                               ; preds = %64
  br label %100

100:                                              ; preds = %2, %99
  ret i32 0
}

; Function Attrs: nounwind
declare i8* @__kmpc_omp_task_alloc(%struct.ident_t*, i32, i32, i64, i64, i32 (i32, i8*)*) #6

declare void @__kmpc_set_task_static_id(i8*, i32)

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #15

; Function Attrs: nounwind
declare void @__kmpc_taskloop(%struct.ident_t*, i32, i8*, i32, i64*, i64*, i64, i32, i32, i64, i8*) #6

declare void @__kmpc_taskgraph(%struct.ident_t*, i32, i64, i8*, i8*, i32, i32, i1)

; Function Attrs: noinline optnone uwtable
define internal void @__captured_stmt.57(%struct.anon.1* noalias noundef %0) #14 {
  %2 = alloca %struct.anon.1*, align 8
  %3 = alloca %struct.anon.2, align 8
  %4 = alloca [1 x %struct.kmp_taskred_input_t], align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store %struct.anon.1* %0, %struct.anon.1** %2, align 8
  %9 = load %struct.anon.1*, %struct.anon.1** %2, align 8
  %10 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %3, i32 0, i32 0
  store double* @_ZL3rho, double** %10, align 8
  %11 = load i32, i32* @numThreads, align 4
  call void @__kmpc_taskgroup(%struct.ident_t* @2, i32 %8)
  %12 = getelementptr inbounds [1 x %struct.kmp_taskred_input_t], [1 x %struct.kmp_taskred_input_t]* %4, i64 0, i64 0
  %13 = getelementptr inbounds %struct.kmp_taskred_input_t, %struct.kmp_taskred_input_t* %12, i32 0, i32 0
  store i8* bitcast (double* @_ZL3rho to i8*), i8** %13, align 8
  %14 = getelementptr inbounds %struct.kmp_taskred_input_t, %struct.kmp_taskred_input_t* %12, i32 0, i32 1
  store i8* bitcast (double* @_ZL3rho to i8*), i8** %14, align 8
  %15 = getelementptr inbounds %struct.kmp_taskred_input_t, %struct.kmp_taskred_input_t* %12, i32 0, i32 2
  store i64 8, i64* %15, align 8
  %16 = getelementptr inbounds %struct.kmp_taskred_input_t, %struct.kmp_taskred_input_t* %12, i32 0, i32 3
  store i8* bitcast (void (i8*, i8*)* @.red_init. to i8*), i8** %16, align 8
  %17 = getelementptr inbounds %struct.kmp_taskred_input_t, %struct.kmp_taskred_input_t* %12, i32 0, i32 4
  store i8* null, i8** %17, align 8
  %18 = getelementptr inbounds %struct.kmp_taskred_input_t, %struct.kmp_taskred_input_t* %12, i32 0, i32 5
  store i8* bitcast (void (i8*, i8*)* @.red_comb. to i8*), i8** %18, align 8
  %19 = getelementptr inbounds %struct.kmp_taskred_input_t, %struct.kmp_taskred_input_t* %12, i32 0, i32 6
  %20 = bitcast i32* %19 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %20, i8 0, i64 4, i1 false)
  %21 = bitcast [1 x %struct.kmp_taskred_input_t]* %4 to i8*
  %22 = call i8* @__kmpc_taskred_init(i32 %8, i32 1, i8* %21)
  %23 = load i32, i32* @_ZL7lastcol, align 4
  %24 = load i32, i32* @_ZL8firstcol, align 4
  %25 = sub nsw i32 %23, %24
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %6, align 4
  %27 = load i32, i32* %6, align 4
  %28 = sub nsw i32 %27, 0
  %29 = sdiv i32 %28, 1
  %30 = sub nsw i32 %29, 1
  store i32 %30, i32* %7, align 4
  %31 = call i8* @__kmpc_omp_task_alloc(%struct.ident_t* @2, i32 %8, i32 1, i64 88, i64 8, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates.3*)* @.omp_task_entry.60 to i32 (i32, i8*)*))
  call void @__kmpc_set_task_static_id(i32 %8, i8* %31)
  %32 = bitcast i8* %31 to %struct.kmp_task_t_with_privates.3*
  %33 = getelementptr inbounds %struct.kmp_task_t_with_privates.3, %struct.kmp_task_t_with_privates.3* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast %struct.anon.2* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %35, i8* align 8 %36, i64 8, i1 false)
  %37 = getelementptr inbounds %struct.kmp_task_t_with_privates.3, %struct.kmp_task_t_with_privates.3* %32, i32 0, i32 1
  %38 = getelementptr inbounds %struct..kmp_privates.t.4, %struct..kmp_privates.t.4* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.anon.1, %struct.anon.1* %9, i32 0, i32 0
  %40 = load double**, double*** %39, align 8
  %41 = load double*, double** %40, align 8
  store double* %41, double** %38, align 8
  %42 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 5
  store i64 0, i64* %42, align 8
  %43 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 6
  %44 = load i32, i32* %7, align 4
  %45 = sext i32 %44 to i64
  store i64 %45, i64* %43, align 8
  %46 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 7
  store i64 1, i64* %46, align 8
  %47 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 9
  store i8* %22, i8** %47, align 8
  %48 = load i64, i64* %46, align 8
  %49 = zext i32 %11 to i64
  call void @__kmpc_taskloop(%struct.ident_t* @2, i32 %8, i8* %31, i32 1, i64* %42, i64* %43, i64 %48, i32 1, i32 2, i64 %49, i8* null)
  call void @__kmpc_end_taskgroup(%struct.ident_t* @2, i32 %8)
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal void @.red_init.(i8* noalias noundef %0, i8* noalias noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to double*
  store double 0.000000e+00, double* %6, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal void @.red_comb.(i8* noundef %0, i8* noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load double, double* %6, align 8
  %10 = load double, double* %8, align 8
  %11 = fadd double %9, %10
  store double %11, double* %6, align 8
  ret void
}

; Function Attrs: nounwind
declare i8* @__kmpc_taskred_init(i32, i32, i8*) #6

; Function Attrs: nounwind
declare i8* @__kmpc_task_reduction_get_th_data(i32, i8*, i8*) #6

; Function Attrs: noinline uwtable
define internal void @.omp_task_privates_map..59(%struct..kmp_privates.t.4* noalias noundef %0, double*** noalias noundef %1) #0 {
  %3 = alloca %struct..kmp_privates.t.4*, align 8
  %4 = alloca double***, align 8
  store %struct..kmp_privates.t.4* %0, %struct..kmp_privates.t.4** %3, align 8
  store double*** %1, double**** %4, align 8
  %5 = load %struct..kmp_privates.t.4*, %struct..kmp_privates.t.4** %3, align 8
  %6 = getelementptr inbounds %struct..kmp_privates.t.4, %struct..kmp_privates.t.4* %5, i32 0, i32 0
  %7 = load double***, double**** %4, align 8
  store double** %6, double*** %7, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal noundef i32 @.omp_task_entry.60(i32 noundef %0, %struct.kmp_task_t_with_privates.3* noalias noundef %1) #10 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void (i8*, ...)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.anon.2*, align 8
  %14 = alloca double**, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca %struct.kmp_task_t_with_privates.3*, align 8
  store i32 %0, i32* %20, align 4
  store %struct.kmp_task_t_with_privates.3* %1, %struct.kmp_task_t_with_privates.3** %21, align 8
  %22 = load i32, i32* %20, align 4
  %23 = load %struct.kmp_task_t_with_privates.3*, %struct.kmp_task_t_with_privates.3** %21, align 8
  %24 = getelementptr inbounds %struct.kmp_task_t_with_privates.3, %struct.kmp_task_t_with_privates.3* %23, i32 0, i32 0
  %25 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %24, i32 0, i32 2
  %26 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %24, i32 0, i32 0
  %27 = load i8*, i8** %26, align 8
  %28 = bitcast i8* %27 to %struct.anon.2*
  %29 = getelementptr inbounds %struct.kmp_task_t_with_privates.3, %struct.kmp_task_t_with_privates.3* %23, i32 0, i32 1
  %30 = bitcast %struct..kmp_privates.t.4* %29 to i8*
  %31 = bitcast %struct.kmp_task_t_with_privates.3* %23 to i8*
  %32 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %24, i32 0, i32 5
  %33 = load i64, i64* %32, align 8
  %34 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %24, i32 0, i32 6
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %24, i32 0, i32 7
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %24, i32 0, i32 8
  %39 = load i32, i32* %38, align 8
  %40 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %24, i32 0, i32 9
  %41 = load i8*, i8** %40, align 8
  call void @llvm.experimental.noalias.scope.decl(metadata !47)
  call void @llvm.experimental.noalias.scope.decl(metadata !50)
  call void @llvm.experimental.noalias.scope.decl(metadata !52)
  call void @llvm.experimental.noalias.scope.decl(metadata !54)
  call void @llvm.experimental.noalias.scope.decl(metadata !56)
  store i32 %22, i32* %3, align 4, !noalias !58
  store i32* %25, i32** %4, align 8, !noalias !58
  store i8* %30, i8** %5, align 8, !noalias !58
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t.4*, double***)* @.omp_task_privates_map..59 to void (i8*, ...)*), void (i8*, ...)** %6, align 8, !noalias !58
  store i8* %31, i8** %7, align 8, !noalias !58
  store i64 %33, i64* %8, align 8, !noalias !58
  store i64 %35, i64* %9, align 8, !noalias !58
  store i64 %37, i64* %10, align 8, !noalias !58
  store i32 %39, i32* %11, align 4, !noalias !58
  store i8* %41, i8** %12, align 8, !noalias !58
  store %struct.anon.2* %28, %struct.anon.2** %13, align 8, !noalias !58
  %42 = load %struct.anon.2*, %struct.anon.2** %13, align 8, !noalias !58
  %43 = load void (i8*, ...)*, void (i8*, ...)** %6, align 8, !noalias !58
  %44 = load i8*, i8** %5, align 8, !noalias !58
  %45 = bitcast void (i8*, ...)* %43 to void (i8*, double***)*
  call void %45(i8* %44, double*** %14)
  %46 = load double**, double*** %14, align 8, !noalias !58
  %47 = load double**, double*** %14, align 8, !noalias !58
  %48 = getelementptr inbounds %struct.anon.2, %struct.anon.2* %42, i32 0, i32 0
  %49 = load double*, double** %48, align 8
  %50 = load i8*, i8** %12, align 8, !noalias !58
  %51 = load i32, i32* %3, align 4, !noalias !58
  %52 = bitcast double* %49 to i8*
  %53 = call i8* @__kmpc_task_reduction_get_th_data(i32 %51, i8* %50, i8* %52)
  %54 = bitcast i8* %53 to double*
  %55 = load i32, i32* @_ZL7lastcol, align 4
  %56 = load i32, i32* @_ZL8firstcol, align 4
  %57 = sub nsw i32 %55, %56
  %58 = add nsw i32 %57, 1
  store i32 %58, i32* %15, align 4, !noalias !58
  %59 = load i32, i32* %15, align 4, !noalias !58
  %60 = sub nsw i32 %59, 1
  store i32 %60, i32* %16, align 4, !noalias !58
  store i32 0, i32* %17, align 4, !noalias !58
  %61 = load i32, i32* %15, align 4, !noalias !58
  %62 = icmp slt i32 0, %61
  br i1 %62, label %63, label %88

63:                                               ; preds = %2
  %64 = load i64, i64* %8, align 8, !noalias !58
  %65 = trunc i64 %64 to i32
  store i32 %65, i32* %19, align 4, !noalias !58
  br label %66

66:                                               ; preds = %71, %63
  %67 = load i32, i32* %19, align 4, !noalias !58
  %68 = sext i32 %67 to i64
  %69 = load i64, i64* %9, align 8, !noalias !58
  %70 = icmp ule i64 %68, %69
  br i1 %70, label %71, label %87

71:                                               ; preds = %66
  %72 = load i32, i32* %19, align 4, !noalias !58
  store i32 %72, i32* %18, align 4, !noalias !58
  %73 = load double*, double** %46, align 8
  %74 = load i32, i32* %18, align 4, !noalias !58
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double* %73, i64 %75
  %77 = load double, double* %76, align 8
  %78 = load double*, double** %46, align 8
  %79 = load i32, i32* %18, align 4, !noalias !58
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double* %78, i64 %80
  %82 = load double, double* %81, align 8
  %83 = load double, double* %54, align 8
  %84 = call double @llvm.fmuladd.f64(double %77, double %82, double %83)
  store double %84, double* %54, align 8
  %85 = load i32, i32* %19, align 4, !noalias !58
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %19, align 4, !noalias !58
  br label %66

87:                                               ; preds = %66
  br label %88

88:                                               ; preds = %2, %87
  ret i32 0
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #16

; Function Attrs: noinline optnone uwtable
define internal void @__captured_stmt.61(%struct.anon.5* noalias noundef %0) #14 {
  %2 = alloca %struct.anon.5*, align 8
  %3 = alloca %struct.anon.6, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store %struct.anon.5* %0, %struct.anon.5** %2, align 8
  %8 = load %struct.anon.5*, %struct.anon.5** %2, align 8
  %9 = load i32, i32* @numThreads, align 4
  call void @__kmpc_taskgroup(%struct.ident_t* @2, i32 %7)
  %10 = load i32, i32* @_ZL7lastrow, align 4
  %11 = load i32, i32* @_ZL8firstrow, align 4
  %12 = sub nsw i32 %10, %11
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %5, align 4
  %14 = load i32, i32* %5, align 4
  %15 = sub nsw i32 %14, 0
  %16 = sdiv i32 %15, 1
  %17 = sub nsw i32 %16, 1
  store i32 %17, i32* %6, align 4
  %18 = call i8* @__kmpc_omp_task_alloc(%struct.ident_t* @2, i32 %7, i32 1, i64 136, i64 1, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates.7*)* @.omp_task_entry.64 to i32 (i32, i8*)*))
  call void @__kmpc_set_task_static_id(i32 %7, i8* %18)
  %19 = bitcast i8* %18 to %struct.kmp_task_t_with_privates.7*
  %20 = getelementptr inbounds %struct.kmp_task_t_with_privates.7, %struct.kmp_task_t_with_privates.7* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.kmp_task_t_with_privates.7, %struct.kmp_task_t_with_privates.7* %19, i32 0, i32 1
  %22 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %21, i32 0, i32 1
  %23 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %8, i32 0, i32 0
  %24 = load i32**, i32*** %23, align 8
  %25 = load i32*, i32** %24, align 8
  store i32* %25, i32** %22, align 8
  %26 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %21, i32 0, i32 2
  %27 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %8, i32 0, i32 1
  %28 = load double**, double*** %27, align 8
  %29 = load double*, double** %28, align 8
  store double* %29, double** %26, align 8
  %30 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %21, i32 0, i32 3
  %31 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %8, i32 0, i32 2
  %32 = load double**, double*** %31, align 8
  %33 = load double*, double** %32, align 8
  store double* %33, double** %30, align 8
  %34 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %21, i32 0, i32 4
  %35 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %8, i32 0, i32 3
  %36 = load i32**, i32*** %35, align 8
  %37 = load i32*, i32** %36, align 8
  store i32* %37, i32** %34, align 8
  %38 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %21, i32 0, i32 5
  %39 = getelementptr inbounds %struct.anon.5, %struct.anon.5* %8, i32 0, i32 4
  %40 = load double**, double*** %39, align 8
  %41 = load double*, double** %40, align 8
  store double* %41, double** %38, align 8
  %42 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 5
  store i64 0, i64* %42, align 8
  %43 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 6
  %44 = load i32, i32* %6, align 4
  %45 = sext i32 %44 to i64
  store i64 %45, i64* %43, align 8
  %46 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 7
  store i64 1, i64* %46, align 8
  %47 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 9
  %48 = bitcast i8** %47 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %48, i8 0, i64 8, i1 false)
  %49 = load i64, i64* %46, align 8
  %50 = zext i32 %9 to i64
  call void @__kmpc_taskloop(%struct.ident_t* @2, i32 %7, i8* %18, i32 1, i64* %42, i64* %43, i64 %49, i32 1, i32 2, i64 %50, i8* null)
  call void @__kmpc_end_taskgroup(%struct.ident_t* @2, i32 %7)
  ret void
}

; Function Attrs: noinline uwtable
define internal void @.omp_task_privates_map..63(%struct..kmp_privates.t.8* noalias noundef %0, double** noalias noundef %1, i32** noalias noundef %2, i32*** noalias noundef %3, double*** noalias noundef %4, double*** noalias noundef %5, i32*** noalias noundef %6, double*** noalias noundef %7) #0 {
  %9 = alloca %struct..kmp_privates.t.8*, align 8
  %10 = alloca double**, align 8
  %11 = alloca i32**, align 8
  %12 = alloca i32***, align 8
  %13 = alloca double***, align 8
  %14 = alloca double***, align 8
  %15 = alloca i32***, align 8
  %16 = alloca double***, align 8
  store %struct..kmp_privates.t.8* %0, %struct..kmp_privates.t.8** %9, align 8
  store double** %1, double*** %10, align 8
  store i32** %2, i32*** %11, align 8
  store i32*** %3, i32**** %12, align 8
  store double*** %4, double**** %13, align 8
  store double*** %5, double**** %14, align 8
  store i32*** %6, i32**** %15, align 8
  store double*** %7, double**** %16, align 8
  %17 = load %struct..kmp_privates.t.8*, %struct..kmp_privates.t.8** %9, align 8
  %18 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %17, i32 0, i32 0
  %19 = load double**, double*** %10, align 8
  store double* %18, double** %19, align 8
  %20 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %17, i32 0, i32 1
  %21 = load i32***, i32**** %12, align 8
  store i32** %20, i32*** %21, align 8
  %22 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %17, i32 0, i32 2
  %23 = load double***, double**** %13, align 8
  store double** %22, double*** %23, align 8
  %24 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %17, i32 0, i32 3
  %25 = load double***, double**** %14, align 8
  store double** %24, double*** %25, align 8
  %26 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %17, i32 0, i32 4
  %27 = load i32***, i32**** %15, align 8
  store i32** %26, i32*** %27, align 8
  %28 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %17, i32 0, i32 5
  %29 = load double***, double**** %16, align 8
  store double** %28, double*** %29, align 8
  %30 = getelementptr inbounds %struct..kmp_privates.t.8, %struct..kmp_privates.t.8* %17, i32 0, i32 6
  %31 = load i32**, i32*** %11, align 8
  store i32* %30, i32** %31, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal noundef i32 @.omp_task_entry.64(i32 noundef %0, %struct.kmp_task_t_with_privates.7* noalias noundef %1) #10 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void (i8*, ...)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.anon.6*, align 8
  %14 = alloca double*, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32**, align 8
  %17 = alloca double**, align 8
  %18 = alloca double**, align 8
  %19 = alloca i32**, align 8
  %20 = alloca double**, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca %struct.kmp_task_t_with_privates.7*, align 8
  store i32 %0, i32* %26, align 4
  store %struct.kmp_task_t_with_privates.7* %1, %struct.kmp_task_t_with_privates.7** %27, align 8
  %28 = load i32, i32* %26, align 4
  %29 = load %struct.kmp_task_t_with_privates.7*, %struct.kmp_task_t_with_privates.7** %27, align 8
  %30 = getelementptr inbounds %struct.kmp_task_t_with_privates.7, %struct.kmp_task_t_with_privates.7* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 2
  %32 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 0
  %33 = load i8*, i8** %32, align 8
  %34 = bitcast i8* %33 to %struct.anon.6*
  %35 = getelementptr inbounds %struct.kmp_task_t_with_privates.7, %struct.kmp_task_t_with_privates.7* %29, i32 0, i32 1
  %36 = bitcast %struct..kmp_privates.t.8* %35 to i8*
  %37 = bitcast %struct.kmp_task_t_with_privates.7* %29 to i8*
  %38 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 5
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 6
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 7
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 8
  %45 = load i32, i32* %44, align 8
  %46 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 9
  %47 = load i8*, i8** %46, align 8
  call void @llvm.experimental.noalias.scope.decl(metadata !59)
  call void @llvm.experimental.noalias.scope.decl(metadata !62)
  call void @llvm.experimental.noalias.scope.decl(metadata !64)
  call void @llvm.experimental.noalias.scope.decl(metadata !66)
  call void @llvm.experimental.noalias.scope.decl(metadata !68)
  store i32 %28, i32* %3, align 4, !noalias !70
  store i32* %31, i32** %4, align 8, !noalias !70
  store i8* %36, i8** %5, align 8, !noalias !70
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t.8*, double**, i32**, i32***, double***, double***, i32***, double***)* @.omp_task_privates_map..63 to void (i8*, ...)*), void (i8*, ...)** %6, align 8, !noalias !70
  store i8* %37, i8** %7, align 8, !noalias !70
  store i64 %39, i64* %8, align 8, !noalias !70
  store i64 %41, i64* %9, align 8, !noalias !70
  store i64 %43, i64* %10, align 8, !noalias !70
  store i32 %45, i32* %11, align 4, !noalias !70
  store i8* %47, i8** %12, align 8, !noalias !70
  store %struct.anon.6* %34, %struct.anon.6** %13, align 8, !noalias !70
  %48 = load %struct.anon.6*, %struct.anon.6** %13, align 8, !noalias !70
  %49 = load void (i8*, ...)*, void (i8*, ...)** %6, align 8, !noalias !70
  %50 = load i8*, i8** %5, align 8, !noalias !70
  %51 = bitcast void (i8*, ...)* %49 to void (i8*, double**, i32**, i32***, double***, double***, i32***, double***)*
  call void %51(i8* %50, double** %14, i32** %15, i32*** %16, double*** %17, double*** %18, i32*** %19, double*** %20)
  %52 = load double*, double** %14, align 8, !noalias !70
  %53 = load i32*, i32** %15, align 8, !noalias !70
  %54 = load i32**, i32*** %16, align 8, !noalias !70
  %55 = load double**, double*** %17, align 8, !noalias !70
  %56 = load double**, double*** %18, align 8, !noalias !70
  %57 = load i32**, i32*** %19, align 8, !noalias !70
  %58 = load double**, double*** %20, align 8, !noalias !70
  %59 = load i32, i32* @_ZL7lastrow, align 4
  %60 = load i32, i32* @_ZL8firstrow, align 4
  %61 = sub nsw i32 %59, %60
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %21, align 4, !noalias !70
  %63 = load i32, i32* %21, align 4, !noalias !70
  %64 = sub nsw i32 %63, 1
  store i32 %64, i32* %22, align 4, !noalias !70
  store i32 0, i32* %23, align 4, !noalias !70
  %65 = load i32, i32* %21, align 4, !noalias !70
  %66 = icmp slt i32 0, %65
  br i1 %66, label %67, label %119

67:                                               ; preds = %2
  %68 = load i64, i64* %8, align 8, !noalias !70
  %69 = trunc i64 %68 to i32
  store i32 %69, i32* %25, align 4, !noalias !70
  br label %70

70:                                               ; preds = %110, %67
  %71 = load i32, i32* %25, align 4, !noalias !70
  %72 = sext i32 %71 to i64
  %73 = load i64, i64* %9, align 8, !noalias !70
  %74 = icmp ule i64 %72, %73
  br i1 %74, label %75, label %118

75:                                               ; preds = %70
  %76 = load i32, i32* %25, align 4, !noalias !70
  store i32 %76, i32* %24, align 4, !noalias !70
  store double 0.000000e+00, double* %52, align 8
  %77 = load i32*, i32** %54, align 8
  %78 = load i32, i32* %24, align 4, !noalias !70
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32* %77, i64 %79
  %81 = load i32, i32* %80, align 4
  store i32 %81, i32* %53, align 4
  br label %82

82:                                               ; preds = %91, %75
  %83 = load i32, i32* %53, align 4
  %84 = load i32*, i32** %54, align 8
  %85 = load i32, i32* %24, align 4, !noalias !70
  %86 = add nsw i32 %85, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %84, i64 %87
  %89 = load i32, i32* %88, align 4
  %90 = icmp slt i32 %83, %89
  br i1 %90, label %91, label %110

91:                                               ; preds = %82
  %92 = load double*, double** %55, align 8
  %93 = load i32, i32* %53, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double, double* %92, i64 %94
  %96 = load double, double* %95, align 8
  %97 = load double*, double** %56, align 8
  %98 = load i32*, i32** %57, align 8
  %99 = load i32, i32* %53, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32* %98, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, double* %97, i64 %103
  %105 = load double, double* %104, align 8
  %106 = load double, double* %52, align 8
  %107 = call double @llvm.fmuladd.f64(double %96, double %105, double %106)
  store double %107, double* %52, align 8
  %108 = load i32, i32* %53, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %53, align 4
  br label %82, !llvm.loop !71

110:                                              ; preds = %82
  %111 = load double, double* %52, align 8
  %112 = load double*, double** %58, align 8
  %113 = load i32, i32* %24, align 4, !noalias !70
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double* %112, i64 %114
  store double %111, double* %115, align 8
  %116 = load i32, i32* %25, align 4, !noalias !70
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %25, align 4, !noalias !70
  br label %70

118:                                              ; preds = %70
  br label %119

119:                                              ; preds = %2, %118
  ret i32 0
}

; Function Attrs: noinline optnone uwtable
define internal void @__captured_stmt.65(%struct.anon.9* noalias noundef %0) #14 {
  %2 = alloca %struct.anon.9*, align 8
  %3 = alloca %struct.anon.10, align 8
  %4 = alloca [1 x %struct.kmp_taskred_input_t.11], align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store %struct.anon.9* %0, %struct.anon.9** %2, align 8
  %9 = load %struct.anon.9*, %struct.anon.9** %2, align 8
  %10 = getelementptr inbounds %struct.anon.10, %struct.anon.10* %3, i32 0, i32 0
  store double* @_ZL1d, double** %10, align 8
  %11 = load i32, i32* @numThreads, align 4
  call void @__kmpc_taskgroup(%struct.ident_t* @2, i32 %8)
  %12 = getelementptr inbounds [1 x %struct.kmp_taskred_input_t.11], [1 x %struct.kmp_taskred_input_t.11]* %4, i64 0, i64 0
  %13 = getelementptr inbounds %struct.kmp_taskred_input_t.11, %struct.kmp_taskred_input_t.11* %12, i32 0, i32 0
  store i8* bitcast (double* @_ZL1d to i8*), i8** %13, align 8
  %14 = getelementptr inbounds %struct.kmp_taskred_input_t.11, %struct.kmp_taskred_input_t.11* %12, i32 0, i32 1
  store i8* bitcast (double* @_ZL1d to i8*), i8** %14, align 8
  %15 = getelementptr inbounds %struct.kmp_taskred_input_t.11, %struct.kmp_taskred_input_t.11* %12, i32 0, i32 2
  store i64 8, i64* %15, align 8
  %16 = getelementptr inbounds %struct.kmp_taskred_input_t.11, %struct.kmp_taskred_input_t.11* %12, i32 0, i32 3
  store i8* bitcast (void (i8*, i8*)* @.red_init..66 to i8*), i8** %16, align 8
  %17 = getelementptr inbounds %struct.kmp_taskred_input_t.11, %struct.kmp_taskred_input_t.11* %12, i32 0, i32 4
  store i8* null, i8** %17, align 8
  %18 = getelementptr inbounds %struct.kmp_taskred_input_t.11, %struct.kmp_taskred_input_t.11* %12, i32 0, i32 5
  store i8* bitcast (void (i8*, i8*)* @.red_comb..67 to i8*), i8** %18, align 8
  %19 = getelementptr inbounds %struct.kmp_taskred_input_t.11, %struct.kmp_taskred_input_t.11* %12, i32 0, i32 6
  %20 = bitcast i32* %19 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %20, i8 0, i64 4, i1 false)
  %21 = bitcast [1 x %struct.kmp_taskred_input_t.11]* %4 to i8*
  %22 = call i8* @__kmpc_taskred_init(i32 %8, i32 1, i8* %21)
  %23 = load i32, i32* @_ZL7lastcol, align 4
  %24 = load i32, i32* @_ZL8firstcol, align 4
  %25 = sub nsw i32 %23, %24
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %6, align 4
  %27 = load i32, i32* %6, align 4
  %28 = sub nsw i32 %27, 0
  %29 = sdiv i32 %28, 1
  %30 = sub nsw i32 %29, 1
  store i32 %30, i32* %7, align 4
  %31 = call i8* @__kmpc_omp_task_alloc(%struct.ident_t* @2, i32 %8, i32 1, i64 96, i64 8, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates.12*)* @.omp_task_entry.70 to i32 (i32, i8*)*))
  call void @__kmpc_set_task_static_id(i32 %8, i8* %31)
  %32 = bitcast i8* %31 to %struct.kmp_task_t_with_privates.12*
  %33 = getelementptr inbounds %struct.kmp_task_t_with_privates.12, %struct.kmp_task_t_with_privates.12* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast %struct.anon.10* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %35, i8* align 8 %36, i64 8, i1 false)
  %37 = getelementptr inbounds %struct.kmp_task_t_with_privates.12, %struct.kmp_task_t_with_privates.12* %32, i32 0, i32 1
  %38 = getelementptr inbounds %struct..kmp_privates.t.13, %struct..kmp_privates.t.13* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.anon.9, %struct.anon.9* %9, i32 0, i32 0
  %40 = load double**, double*** %39, align 8
  %41 = load double*, double** %40, align 8
  store double* %41, double** %38, align 8
  %42 = getelementptr inbounds %struct..kmp_privates.t.13, %struct..kmp_privates.t.13* %37, i32 0, i32 1
  %43 = getelementptr inbounds %struct.anon.9, %struct.anon.9* %9, i32 0, i32 1
  %44 = load double**, double*** %43, align 8
  %45 = load double*, double** %44, align 8
  store double* %45, double** %42, align 8
  %46 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 5
  store i64 0, i64* %46, align 8
  %47 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 6
  %48 = load i32, i32* %7, align 4
  %49 = sext i32 %48 to i64
  store i64 %49, i64* %47, align 8
  %50 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 7
  store i64 1, i64* %50, align 8
  %51 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 9
  store i8* %22, i8** %51, align 8
  %52 = load i64, i64* %50, align 8
  %53 = zext i32 %11 to i64
  call void @__kmpc_taskloop(%struct.ident_t* @2, i32 %8, i8* %31, i32 1, i64* %46, i64* %47, i64 %52, i32 1, i32 2, i64 %53, i8* null)
  call void @__kmpc_end_taskgroup(%struct.ident_t* @2, i32 %8)
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal void @.red_init..66(i8* noalias noundef %0, i8* noalias noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to double*
  store double 0.000000e+00, double* %6, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal void @.red_comb..67(i8* noundef %0, i8* noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load double, double* %6, align 8
  %10 = load double, double* %8, align 8
  %11 = fadd double %9, %10
  store double %11, double* %6, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @.omp_task_privates_map..69(%struct..kmp_privates.t.13* noalias noundef %0, double*** noalias noundef %1, double*** noalias noundef %2) #0 {
  %4 = alloca %struct..kmp_privates.t.13*, align 8
  %5 = alloca double***, align 8
  %6 = alloca double***, align 8
  store %struct..kmp_privates.t.13* %0, %struct..kmp_privates.t.13** %4, align 8
  store double*** %1, double**** %5, align 8
  store double*** %2, double**** %6, align 8
  %7 = load %struct..kmp_privates.t.13*, %struct..kmp_privates.t.13** %4, align 8
  %8 = getelementptr inbounds %struct..kmp_privates.t.13, %struct..kmp_privates.t.13* %7, i32 0, i32 0
  %9 = load double***, double**** %5, align 8
  store double** %8, double*** %9, align 8
  %10 = getelementptr inbounds %struct..kmp_privates.t.13, %struct..kmp_privates.t.13* %7, i32 0, i32 1
  %11 = load double***, double**** %6, align 8
  store double** %10, double*** %11, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal noundef i32 @.omp_task_entry.70(i32 noundef %0, %struct.kmp_task_t_with_privates.12* noalias noundef %1) #10 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void (i8*, ...)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.anon.10*, align 8
  %14 = alloca double**, align 8
  %15 = alloca double**, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca %struct.kmp_task_t_with_privates.12*, align 8
  store i32 %0, i32* %21, align 4
  store %struct.kmp_task_t_with_privates.12* %1, %struct.kmp_task_t_with_privates.12** %22, align 8
  %23 = load i32, i32* %21, align 4
  %24 = load %struct.kmp_task_t_with_privates.12*, %struct.kmp_task_t_with_privates.12** %22, align 8
  %25 = getelementptr inbounds %struct.kmp_task_t_with_privates.12, %struct.kmp_task_t_with_privates.12* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 2
  %27 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 0
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to %struct.anon.10*
  %30 = getelementptr inbounds %struct.kmp_task_t_with_privates.12, %struct.kmp_task_t_with_privates.12* %24, i32 0, i32 1
  %31 = bitcast %struct..kmp_privates.t.13* %30 to i8*
  %32 = bitcast %struct.kmp_task_t_with_privates.12* %24 to i8*
  %33 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 5
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 6
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 7
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 8
  %40 = load i32, i32* %39, align 8
  %41 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 9
  %42 = load i8*, i8** %41, align 8
  call void @llvm.experimental.noalias.scope.decl(metadata !72)
  call void @llvm.experimental.noalias.scope.decl(metadata !75)
  call void @llvm.experimental.noalias.scope.decl(metadata !77)
  call void @llvm.experimental.noalias.scope.decl(metadata !79)
  call void @llvm.experimental.noalias.scope.decl(metadata !81)
  store i32 %23, i32* %3, align 4, !noalias !83
  store i32* %26, i32** %4, align 8, !noalias !83
  store i8* %31, i8** %5, align 8, !noalias !83
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t.13*, double***, double***)* @.omp_task_privates_map..69 to void (i8*, ...)*), void (i8*, ...)** %6, align 8, !noalias !83
  store i8* %32, i8** %7, align 8, !noalias !83
  store i64 %34, i64* %8, align 8, !noalias !83
  store i64 %36, i64* %9, align 8, !noalias !83
  store i64 %38, i64* %10, align 8, !noalias !83
  store i32 %40, i32* %11, align 4, !noalias !83
  store i8* %42, i8** %12, align 8, !noalias !83
  store %struct.anon.10* %29, %struct.anon.10** %13, align 8, !noalias !83
  %43 = load %struct.anon.10*, %struct.anon.10** %13, align 8, !noalias !83
  %44 = load void (i8*, ...)*, void (i8*, ...)** %6, align 8, !noalias !83
  %45 = load i8*, i8** %5, align 8, !noalias !83
  %46 = bitcast void (i8*, ...)* %44 to void (i8*, double***, double***)*
  call void %46(i8* %45, double*** %14, double*** %15)
  %47 = load double**, double*** %14, align 8, !noalias !83
  %48 = load double**, double*** %15, align 8, !noalias !83
  %49 = load double**, double*** %14, align 8, !noalias !83
  %50 = load double**, double*** %15, align 8, !noalias !83
  %51 = getelementptr inbounds %struct.anon.10, %struct.anon.10* %43, i32 0, i32 0
  %52 = load double*, double** %51, align 8
  %53 = load i8*, i8** %12, align 8, !noalias !83
  %54 = load i32, i32* %3, align 4, !noalias !83
  %55 = bitcast double* %52 to i8*
  %56 = call i8* @__kmpc_task_reduction_get_th_data(i32 %54, i8* %53, i8* %55)
  %57 = bitcast i8* %56 to double*
  %58 = load i32, i32* @_ZL7lastcol, align 4
  %59 = load i32, i32* @_ZL8firstcol, align 4
  %60 = sub nsw i32 %58, %59
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %16, align 4, !noalias !83
  %62 = load i32, i32* %16, align 4, !noalias !83
  %63 = sub nsw i32 %62, 1
  store i32 %63, i32* %17, align 4, !noalias !83
  store i32 0, i32* %18, align 4, !noalias !83
  %64 = load i32, i32* %16, align 4, !noalias !83
  %65 = icmp slt i32 0, %64
  br i1 %65, label %66, label %91

66:                                               ; preds = %2
  %67 = load i64, i64* %8, align 8, !noalias !83
  %68 = trunc i64 %67 to i32
  store i32 %68, i32* %20, align 4, !noalias !83
  br label %69

69:                                               ; preds = %74, %66
  %70 = load i32, i32* %20, align 4, !noalias !83
  %71 = sext i32 %70 to i64
  %72 = load i64, i64* %9, align 8, !noalias !83
  %73 = icmp ule i64 %71, %72
  br i1 %73, label %74, label %90

74:                                               ; preds = %69
  %75 = load i32, i32* %20, align 4, !noalias !83
  store i32 %75, i32* %19, align 4, !noalias !83
  %76 = load double*, double** %47, align 8
  %77 = load i32, i32* %19, align 4, !noalias !83
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds double, double* %76, i64 %78
  %80 = load double, double* %79, align 8
  %81 = load double*, double** %48, align 8
  %82 = load i32, i32* %19, align 4, !noalias !83
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double* %81, i64 %83
  %85 = load double, double* %84, align 8
  %86 = load double, double* %57, align 8
  %87 = call double @llvm.fmuladd.f64(double %80, double %85, double %86)
  store double %87, double* %57, align 8
  %88 = load i32, i32* %20, align 4, !noalias !83
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %20, align 4, !noalias !83
  br label %69

90:                                               ; preds = %69
  br label %91

91:                                               ; preds = %2, %90
  ret i32 0
}

; Function Attrs: noinline optnone uwtable
define internal void @__captured_stmt.71(%struct.anon.14* noalias noundef %0) #14 {
  %2 = alloca %struct.anon.14*, align 8
  %3 = alloca %struct.anon.15, align 8
  %4 = alloca [1 x %struct.kmp_taskred_input_t.16], align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store %struct.anon.14* %0, %struct.anon.14** %2, align 8
  %9 = load %struct.anon.14*, %struct.anon.14** %2, align 8
  %10 = getelementptr inbounds %struct.anon.15, %struct.anon.15* %3, i32 0, i32 0
  store double* @_ZL3rho, double** %10, align 8
  %11 = load i32, i32* @numThreads, align 4
  call void @__kmpc_taskgroup(%struct.ident_t* @2, i32 %8)
  %12 = getelementptr inbounds [1 x %struct.kmp_taskred_input_t.16], [1 x %struct.kmp_taskred_input_t.16]* %4, i64 0, i64 0
  %13 = getelementptr inbounds %struct.kmp_taskred_input_t.16, %struct.kmp_taskred_input_t.16* %12, i32 0, i32 0
  store i8* bitcast (double* @_ZL3rho to i8*), i8** %13, align 8
  %14 = getelementptr inbounds %struct.kmp_taskred_input_t.16, %struct.kmp_taskred_input_t.16* %12, i32 0, i32 1
  store i8* bitcast (double* @_ZL3rho to i8*), i8** %14, align 8
  %15 = getelementptr inbounds %struct.kmp_taskred_input_t.16, %struct.kmp_taskred_input_t.16* %12, i32 0, i32 2
  store i64 8, i64* %15, align 8
  %16 = getelementptr inbounds %struct.kmp_taskred_input_t.16, %struct.kmp_taskred_input_t.16* %12, i32 0, i32 3
  store i8* bitcast (void (i8*, i8*)* @.red_init..72 to i8*), i8** %16, align 8
  %17 = getelementptr inbounds %struct.kmp_taskred_input_t.16, %struct.kmp_taskred_input_t.16* %12, i32 0, i32 4
  store i8* null, i8** %17, align 8
  %18 = getelementptr inbounds %struct.kmp_taskred_input_t.16, %struct.kmp_taskred_input_t.16* %12, i32 0, i32 5
  store i8* bitcast (void (i8*, i8*)* @.red_comb..73 to i8*), i8** %18, align 8
  %19 = getelementptr inbounds %struct.kmp_taskred_input_t.16, %struct.kmp_taskred_input_t.16* %12, i32 0, i32 6
  %20 = bitcast i32* %19 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %20, i8 0, i64 4, i1 false)
  %21 = bitcast [1 x %struct.kmp_taskred_input_t.16]* %4 to i8*
  %22 = call i8* @__kmpc_taskred_init(i32 %8, i32 1, i8* %21)
  %23 = load i32, i32* @_ZL7lastcol, align 4
  %24 = load i32, i32* @_ZL8firstcol, align 4
  %25 = sub nsw i32 %23, %24
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %6, align 4
  %27 = load i32, i32* %6, align 4
  %28 = sub nsw i32 %27, 0
  %29 = sdiv i32 %28, 1
  %30 = sub nsw i32 %29, 1
  store i32 %30, i32* %7, align 4
  %31 = call i8* @__kmpc_omp_task_alloc(%struct.ident_t* @2, i32 %8, i32 1, i64 112, i64 8, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates.17*)* @.omp_task_entry.76 to i32 (i32, i8*)*))
  call void @__kmpc_set_task_static_id(i32 %8, i8* %31)
  %32 = bitcast i8* %31 to %struct.kmp_task_t_with_privates.17*
  %33 = getelementptr inbounds %struct.kmp_task_t_with_privates.17, %struct.kmp_task_t_with_privates.17* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast %struct.anon.15* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %35, i8* align 8 %36, i64 8, i1 false)
  %37 = getelementptr inbounds %struct.kmp_task_t_with_privates.17, %struct.kmp_task_t_with_privates.17* %32, i32 0, i32 1
  %38 = getelementptr inbounds %struct..kmp_privates.t.18, %struct..kmp_privates.t.18* %37, i32 0, i32 0
  %39 = getelementptr inbounds %struct.anon.14, %struct.anon.14* %9, i32 0, i32 0
  %40 = load double**, double*** %39, align 8
  %41 = load double*, double** %40, align 8
  store double* %41, double** %38, align 8
  %42 = getelementptr inbounds %struct..kmp_privates.t.18, %struct..kmp_privates.t.18* %37, i32 0, i32 1
  %43 = getelementptr inbounds %struct.anon.14, %struct.anon.14* %9, i32 0, i32 1
  %44 = load double**, double*** %43, align 8
  %45 = load double*, double** %44, align 8
  store double* %45, double** %42, align 8
  %46 = getelementptr inbounds %struct..kmp_privates.t.18, %struct..kmp_privates.t.18* %37, i32 0, i32 2
  %47 = getelementptr inbounds %struct.anon.14, %struct.anon.14* %9, i32 0, i32 2
  %48 = load double**, double*** %47, align 8
  %49 = load double*, double** %48, align 8
  store double* %49, double** %46, align 8
  %50 = getelementptr inbounds %struct..kmp_privates.t.18, %struct..kmp_privates.t.18* %37, i32 0, i32 3
  %51 = getelementptr inbounds %struct.anon.14, %struct.anon.14* %9, i32 0, i32 3
  %52 = load double**, double*** %51, align 8
  %53 = load double*, double** %52, align 8
  store double* %53, double** %50, align 8
  %54 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 5
  store i64 0, i64* %54, align 8
  %55 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 6
  %56 = load i32, i32* %7, align 4
  %57 = sext i32 %56 to i64
  store i64 %57, i64* %55, align 8
  %58 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 7
  store i64 1, i64* %58, align 8
  %59 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 9
  store i8* %22, i8** %59, align 8
  %60 = load i64, i64* %58, align 8
  %61 = zext i32 %11 to i64
  call void @__kmpc_taskloop(%struct.ident_t* @2, i32 %8, i8* %31, i32 1, i64* %54, i64* %55, i64 %60, i32 1, i32 2, i64 %61, i8* null)
  call void @__kmpc_end_taskgroup(%struct.ident_t* @2, i32 %8)
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal void @.red_init..72(i8* noalias noundef %0, i8* noalias noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to double*
  store double 0.000000e+00, double* %6, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal void @.red_comb..73(i8* noundef %0, i8* noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load double, double* %6, align 8
  %10 = load double, double* %8, align 8
  %11 = fadd double %9, %10
  store double %11, double* %6, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @.omp_task_privates_map..75(%struct..kmp_privates.t.18* noalias noundef %0, double*** noalias noundef %1, double*** noalias noundef %2, double*** noalias noundef %3, double*** noalias noundef %4) #0 {
  %6 = alloca %struct..kmp_privates.t.18*, align 8
  %7 = alloca double***, align 8
  %8 = alloca double***, align 8
  %9 = alloca double***, align 8
  %10 = alloca double***, align 8
  store %struct..kmp_privates.t.18* %0, %struct..kmp_privates.t.18** %6, align 8
  store double*** %1, double**** %7, align 8
  store double*** %2, double**** %8, align 8
  store double*** %3, double**** %9, align 8
  store double*** %4, double**** %10, align 8
  %11 = load %struct..kmp_privates.t.18*, %struct..kmp_privates.t.18** %6, align 8
  %12 = getelementptr inbounds %struct..kmp_privates.t.18, %struct..kmp_privates.t.18* %11, i32 0, i32 0
  %13 = load double***, double**** %7, align 8
  store double** %12, double*** %13, align 8
  %14 = getelementptr inbounds %struct..kmp_privates.t.18, %struct..kmp_privates.t.18* %11, i32 0, i32 1
  %15 = load double***, double**** %8, align 8
  store double** %14, double*** %15, align 8
  %16 = getelementptr inbounds %struct..kmp_privates.t.18, %struct..kmp_privates.t.18* %11, i32 0, i32 2
  %17 = load double***, double**** %9, align 8
  store double** %16, double*** %17, align 8
  %18 = getelementptr inbounds %struct..kmp_privates.t.18, %struct..kmp_privates.t.18* %11, i32 0, i32 3
  %19 = load double***, double**** %10, align 8
  store double** %18, double*** %19, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal noundef i32 @.omp_task_entry.76(i32 noundef %0, %struct.kmp_task_t_with_privates.17* noalias noundef %1) #10 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void (i8*, ...)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.anon.15*, align 8
  %14 = alloca double**, align 8
  %15 = alloca double**, align 8
  %16 = alloca double**, align 8
  %17 = alloca double**, align 8
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca %struct.kmp_task_t_with_privates.17*, align 8
  store i32 %0, i32* %23, align 4
  store %struct.kmp_task_t_with_privates.17* %1, %struct.kmp_task_t_with_privates.17** %24, align 8
  %25 = load i32, i32* %23, align 4
  %26 = load %struct.kmp_task_t_with_privates.17*, %struct.kmp_task_t_with_privates.17** %24, align 8
  %27 = getelementptr inbounds %struct.kmp_task_t_with_privates.17, %struct.kmp_task_t_with_privates.17* %26, i32 0, i32 0
  %28 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %27, i32 0, i32 2
  %29 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %27, i32 0, i32 0
  %30 = load i8*, i8** %29, align 8
  %31 = bitcast i8* %30 to %struct.anon.15*
  %32 = getelementptr inbounds %struct.kmp_task_t_with_privates.17, %struct.kmp_task_t_with_privates.17* %26, i32 0, i32 1
  %33 = bitcast %struct..kmp_privates.t.18* %32 to i8*
  %34 = bitcast %struct.kmp_task_t_with_privates.17* %26 to i8*
  %35 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %27, i32 0, i32 5
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %27, i32 0, i32 6
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %27, i32 0, i32 7
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %27, i32 0, i32 8
  %42 = load i32, i32* %41, align 8
  %43 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %27, i32 0, i32 9
  %44 = load i8*, i8** %43, align 8
  call void @llvm.experimental.noalias.scope.decl(metadata !84)
  call void @llvm.experimental.noalias.scope.decl(metadata !87)
  call void @llvm.experimental.noalias.scope.decl(metadata !89)
  call void @llvm.experimental.noalias.scope.decl(metadata !91)
  call void @llvm.experimental.noalias.scope.decl(metadata !93)
  store i32 %25, i32* %3, align 4, !noalias !95
  store i32* %28, i32** %4, align 8, !noalias !95
  store i8* %33, i8** %5, align 8, !noalias !95
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t.18*, double***, double***, double***, double***)* @.omp_task_privates_map..75 to void (i8*, ...)*), void (i8*, ...)** %6, align 8, !noalias !95
  store i8* %34, i8** %7, align 8, !noalias !95
  store i64 %36, i64* %8, align 8, !noalias !95
  store i64 %38, i64* %9, align 8, !noalias !95
  store i64 %40, i64* %10, align 8, !noalias !95
  store i32 %42, i32* %11, align 4, !noalias !95
  store i8* %44, i8** %12, align 8, !noalias !95
  store %struct.anon.15* %31, %struct.anon.15** %13, align 8, !noalias !95
  %45 = load %struct.anon.15*, %struct.anon.15** %13, align 8, !noalias !95
  %46 = load void (i8*, ...)*, void (i8*, ...)** %6, align 8, !noalias !95
  %47 = load i8*, i8** %5, align 8, !noalias !95
  %48 = bitcast void (i8*, ...)* %46 to void (i8*, double***, double***, double***, double***)*
  call void %48(i8* %47, double*** %14, double*** %15, double*** %16, double*** %17)
  %49 = load double**, double*** %14, align 8, !noalias !95
  %50 = load double**, double*** %15, align 8, !noalias !95
  %51 = load double**, double*** %16, align 8, !noalias !95
  %52 = load double**, double*** %17, align 8, !noalias !95
  %53 = load double**, double*** %14, align 8, !noalias !95
  %54 = load double**, double*** %15, align 8, !noalias !95
  %55 = load double**, double*** %16, align 8, !noalias !95
  %56 = load double**, double*** %17, align 8, !noalias !95
  %57 = getelementptr inbounds %struct.anon.15, %struct.anon.15* %45, i32 0, i32 0
  %58 = load double*, double** %57, align 8
  %59 = load i8*, i8** %12, align 8, !noalias !95
  %60 = load i32, i32* %3, align 4, !noalias !95
  %61 = bitcast double* %58 to i8*
  %62 = call i8* @__kmpc_task_reduction_get_th_data(i32 %60, i8* %59, i8* %61)
  %63 = bitcast i8* %62 to double*
  %64 = load i32, i32* @_ZL7lastcol, align 4
  %65 = load i32, i32* @_ZL8firstcol, align 4
  %66 = sub nsw i32 %64, %65
  %67 = add nsw i32 %66, 1
  store i32 %67, i32* %18, align 4, !noalias !95
  %68 = load i32, i32* %18, align 4, !noalias !95
  %69 = sub nsw i32 %68, 1
  store i32 %69, i32* %19, align 4, !noalias !95
  store i32 0, i32* %20, align 4, !noalias !95
  %70 = load i32, i32* %18, align 4, !noalias !95
  %71 = icmp slt i32 0, %70
  br i1 %71, label %72, label %122

72:                                               ; preds = %2
  %73 = load i64, i64* %8, align 8, !noalias !95
  %74 = trunc i64 %73 to i32
  store i32 %74, i32* %22, align 4, !noalias !95
  br label %75

75:                                               ; preds = %80, %72
  %76 = load i32, i32* %22, align 4, !noalias !95
  %77 = sext i32 %76 to i64
  %78 = load i64, i64* %9, align 8, !noalias !95
  %79 = icmp ule i64 %77, %78
  br i1 %79, label %80, label %121

80:                                               ; preds = %75
  %81 = load i32, i32* %22, align 4, !noalias !95
  store i32 %81, i32* %21, align 4, !noalias !95
  %82 = load double, double* @_ZL5alpha, align 8
  %83 = load double*, double** %50, align 8
  %84 = load i32, i32* %21, align 4, !noalias !95
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double* %83, i64 %85
  %87 = load double, double* %86, align 8
  %88 = load double*, double** %49, align 8
  %89 = load i32, i32* %21, align 4, !noalias !95
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds double, double* %88, i64 %90
  %92 = load double, double* %91, align 8
  %93 = call double @llvm.fmuladd.f64(double %82, double %87, double %92)
  store double %93, double* %91, align 8
  %94 = load double, double* @_ZL5alpha, align 8
  %95 = load double*, double** %52, align 8
  %96 = load i32, i32* %21, align 4, !noalias !95
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds double, double* %95, i64 %97
  %99 = load double, double* %98, align 8
  %100 = load double*, double** %51, align 8
  %101 = load i32, i32* %21, align 4, !noalias !95
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds double, double* %100, i64 %102
  %104 = load double, double* %103, align 8
  %105 = fneg double %94
  %106 = call double @llvm.fmuladd.f64(double %105, double %99, double %104)
  store double %106, double* %103, align 8
  %107 = load double*, double** %51, align 8
  %108 = load i32, i32* %21, align 4, !noalias !95
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double* %107, i64 %109
  %111 = load double, double* %110, align 8
  %112 = load double*, double** %51, align 8
  %113 = load i32, i32* %21, align 4, !noalias !95
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double* %112, i64 %114
  %116 = load double, double* %115, align 8
  %117 = load double, double* %63, align 8
  %118 = call double @llvm.fmuladd.f64(double %111, double %116, double %117)
  store double %118, double* %63, align 8
  %119 = load i32, i32* %22, align 4, !noalias !95
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %22, align 4, !noalias !95
  br label %75

121:                                              ; preds = %75
  br label %122

122:                                              ; preds = %2, %121
  ret i32 0
}

; Function Attrs: noinline optnone uwtable
define internal void @__captured_stmt.77(%struct.anon.19* noalias noundef %0) #14 {
  %2 = alloca %struct.anon.19*, align 8
  %3 = alloca %struct.anon.20, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store %struct.anon.19* %0, %struct.anon.19** %2, align 8
  %8 = load %struct.anon.19*, %struct.anon.19** %2, align 8
  %9 = load i32, i32* @numThreads, align 4
  call void @__kmpc_taskgroup(%struct.ident_t* @2, i32 %7)
  %10 = load i32, i32* @_ZL7lastcol, align 4
  %11 = load i32, i32* @_ZL8firstcol, align 4
  %12 = sub nsw i32 %10, %11
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %5, align 4
  %14 = load i32, i32* %5, align 4
  %15 = sub nsw i32 %14, 0
  %16 = sdiv i32 %15, 1
  %17 = sub nsw i32 %16, 1
  store i32 %17, i32* %6, align 4
  %18 = call i8* @__kmpc_omp_task_alloc(%struct.ident_t* @2, i32 %7, i32 1, i64 96, i64 1, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates.21*)* @.omp_task_entry.80 to i32 (i32, i8*)*))
  call void @__kmpc_set_task_static_id(i32 %7, i8* %18)
  %19 = bitcast i8* %18 to %struct.kmp_task_t_with_privates.21*
  %20 = getelementptr inbounds %struct.kmp_task_t_with_privates.21, %struct.kmp_task_t_with_privates.21* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.kmp_task_t_with_privates.21, %struct.kmp_task_t_with_privates.21* %19, i32 0, i32 1
  %22 = getelementptr inbounds %struct..kmp_privates.t.22, %struct..kmp_privates.t.22* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.anon.19, %struct.anon.19* %8, i32 0, i32 0
  %24 = load double**, double*** %23, align 8
  %25 = load double*, double** %24, align 8
  store double* %25, double** %22, align 8
  %26 = getelementptr inbounds %struct..kmp_privates.t.22, %struct..kmp_privates.t.22* %21, i32 0, i32 1
  %27 = getelementptr inbounds %struct.anon.19, %struct.anon.19* %8, i32 0, i32 1
  %28 = load double**, double*** %27, align 8
  %29 = load double*, double** %28, align 8
  store double* %29, double** %26, align 8
  %30 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 5
  store i64 0, i64* %30, align 8
  %31 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 6
  %32 = load i32, i32* %6, align 4
  %33 = sext i32 %32 to i64
  store i64 %33, i64* %31, align 8
  %34 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 7
  store i64 1, i64* %34, align 8
  %35 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 9
  %36 = bitcast i8** %35 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %36, i8 0, i64 8, i1 false)
  %37 = load i64, i64* %34, align 8
  %38 = zext i32 %9 to i64
  call void @__kmpc_taskloop(%struct.ident_t* @2, i32 %7, i8* %18, i32 1, i64* %30, i64* %31, i64 %37, i32 1, i32 2, i64 %38, i8* null)
  call void @__kmpc_end_taskgroup(%struct.ident_t* @2, i32 %7)
  ret void
}

; Function Attrs: noinline uwtable
define internal void @.omp_task_privates_map..79(%struct..kmp_privates.t.22* noalias noundef %0, double*** noalias noundef %1, double*** noalias noundef %2) #0 {
  %4 = alloca %struct..kmp_privates.t.22*, align 8
  %5 = alloca double***, align 8
  %6 = alloca double***, align 8
  store %struct..kmp_privates.t.22* %0, %struct..kmp_privates.t.22** %4, align 8
  store double*** %1, double**** %5, align 8
  store double*** %2, double**** %6, align 8
  %7 = load %struct..kmp_privates.t.22*, %struct..kmp_privates.t.22** %4, align 8
  %8 = getelementptr inbounds %struct..kmp_privates.t.22, %struct..kmp_privates.t.22* %7, i32 0, i32 0
  %9 = load double***, double**** %5, align 8
  store double** %8, double*** %9, align 8
  %10 = getelementptr inbounds %struct..kmp_privates.t.22, %struct..kmp_privates.t.22* %7, i32 0, i32 1
  %11 = load double***, double**** %6, align 8
  store double** %10, double*** %11, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal noundef i32 @.omp_task_entry.80(i32 noundef %0, %struct.kmp_task_t_with_privates.21* noalias noundef %1) #10 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void (i8*, ...)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.anon.20*, align 8
  %14 = alloca double**, align 8
  %15 = alloca double**, align 8
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca %struct.kmp_task_t_with_privates.21*, align 8
  store i32 %0, i32* %21, align 4
  store %struct.kmp_task_t_with_privates.21* %1, %struct.kmp_task_t_with_privates.21** %22, align 8
  %23 = load i32, i32* %21, align 4
  %24 = load %struct.kmp_task_t_with_privates.21*, %struct.kmp_task_t_with_privates.21** %22, align 8
  %25 = getelementptr inbounds %struct.kmp_task_t_with_privates.21, %struct.kmp_task_t_with_privates.21* %24, i32 0, i32 0
  %26 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 2
  %27 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 0
  %28 = load i8*, i8** %27, align 8
  %29 = bitcast i8* %28 to %struct.anon.20*
  %30 = getelementptr inbounds %struct.kmp_task_t_with_privates.21, %struct.kmp_task_t_with_privates.21* %24, i32 0, i32 1
  %31 = bitcast %struct..kmp_privates.t.22* %30 to i8*
  %32 = bitcast %struct.kmp_task_t_with_privates.21* %24 to i8*
  %33 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 5
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 6
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 7
  %38 = load i64, i64* %37, align 8
  %39 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 8
  %40 = load i32, i32* %39, align 8
  %41 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %25, i32 0, i32 9
  %42 = load i8*, i8** %41, align 8
  call void @llvm.experimental.noalias.scope.decl(metadata !96)
  call void @llvm.experimental.noalias.scope.decl(metadata !99)
  call void @llvm.experimental.noalias.scope.decl(metadata !101)
  call void @llvm.experimental.noalias.scope.decl(metadata !103)
  call void @llvm.experimental.noalias.scope.decl(metadata !105)
  store i32 %23, i32* %3, align 4, !noalias !107
  store i32* %26, i32** %4, align 8, !noalias !107
  store i8* %31, i8** %5, align 8, !noalias !107
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t.22*, double***, double***)* @.omp_task_privates_map..79 to void (i8*, ...)*), void (i8*, ...)** %6, align 8, !noalias !107
  store i8* %32, i8** %7, align 8, !noalias !107
  store i64 %34, i64* %8, align 8, !noalias !107
  store i64 %36, i64* %9, align 8, !noalias !107
  store i64 %38, i64* %10, align 8, !noalias !107
  store i32 %40, i32* %11, align 4, !noalias !107
  store i8* %42, i8** %12, align 8, !noalias !107
  store %struct.anon.20* %29, %struct.anon.20** %13, align 8, !noalias !107
  %43 = load %struct.anon.20*, %struct.anon.20** %13, align 8, !noalias !107
  %44 = load void (i8*, ...)*, void (i8*, ...)** %6, align 8, !noalias !107
  %45 = load i8*, i8** %5, align 8, !noalias !107
  %46 = bitcast void (i8*, ...)* %44 to void (i8*, double***, double***)*
  call void %46(i8* %45, double*** %14, double*** %15)
  %47 = load double**, double*** %14, align 8, !noalias !107
  %48 = load double**, double*** %15, align 8, !noalias !107
  %49 = load i32, i32* @_ZL7lastcol, align 4
  %50 = load i32, i32* @_ZL8firstcol, align 4
  %51 = sub nsw i32 %49, %50
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %16, align 4, !noalias !107
  %53 = load i32, i32* %16, align 4, !noalias !107
  %54 = sub nsw i32 %53, 1
  store i32 %54, i32* %17, align 4, !noalias !107
  store i32 0, i32* %18, align 4, !noalias !107
  %55 = load i32, i32* %16, align 4, !noalias !107
  %56 = icmp slt i32 0, %55
  br i1 %56, label %57, label %86

57:                                               ; preds = %2
  %58 = load i64, i64* %8, align 8, !noalias !107
  %59 = trunc i64 %58 to i32
  store i32 %59, i32* %20, align 4, !noalias !107
  br label %60

60:                                               ; preds = %65, %57
  %61 = load i32, i32* %20, align 4, !noalias !107
  %62 = sext i32 %61 to i64
  %63 = load i64, i64* %9, align 8, !noalias !107
  %64 = icmp ule i64 %62, %63
  br i1 %64, label %65, label %85

65:                                               ; preds = %60
  %66 = load i32, i32* %20, align 4, !noalias !107
  store i32 %66, i32* %19, align 4, !noalias !107
  %67 = load double*, double** %48, align 8
  %68 = load i32, i32* %19, align 4, !noalias !107
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double* %67, i64 %69
  %71 = load double, double* %70, align 8
  %72 = load double, double* @_ZL4beta, align 8
  %73 = load double*, double** %47, align 8
  %74 = load i32, i32* %19, align 4, !noalias !107
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds double, double* %73, i64 %75
  %77 = load double, double* %76, align 8
  %78 = call double @llvm.fmuladd.f64(double %72, double %77, double %71)
  %79 = load double*, double** %47, align 8
  %80 = load i32, i32* %19, align 4, !noalias !107
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds double, double* %79, i64 %81
  store double %78, double* %82, align 8
  %83 = load i32, i32* %20, align 4, !noalias !107
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %20, align 4, !noalias !107
  br label %60

85:                                               ; preds = %60
  br label %86

86:                                               ; preds = %2, %85
  ret i32 0
}

; Function Attrs: noinline optnone uwtable
define internal void @__captured_stmt.81(%struct.anon.23* noalias noundef %0) #14 {
  %2 = alloca %struct.anon.23*, align 8
  %3 = alloca %struct.anon.24, align 1
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store %struct.anon.23* %0, %struct.anon.23** %2, align 8
  %8 = load %struct.anon.23*, %struct.anon.23** %2, align 8
  %9 = load i32, i32* @numThreads, align 4
  call void @__kmpc_taskgroup(%struct.ident_t* @2, i32 %7)
  %10 = load i32, i32* @_ZL7lastrow, align 4
  %11 = load i32, i32* @_ZL8firstrow, align 4
  %12 = sub nsw i32 %10, %11
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %5, align 4
  %14 = load i32, i32* %5, align 4
  %15 = sub nsw i32 %14, 0
  %16 = sdiv i32 %15, 1
  %17 = sub nsw i32 %16, 1
  store i32 %17, i32* %6, align 4
  %18 = call i8* @__kmpc_omp_task_alloc(%struct.ident_t* @2, i32 %7, i32 1, i64 136, i64 1, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates.25*)* @.omp_task_entry.84 to i32 (i32, i8*)*))
  call void @__kmpc_set_task_static_id(i32 %7, i8* %18)
  %19 = bitcast i8* %18 to %struct.kmp_task_t_with_privates.25*
  %20 = getelementptr inbounds %struct.kmp_task_t_with_privates.25, %struct.kmp_task_t_with_privates.25* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.kmp_task_t_with_privates.25, %struct.kmp_task_t_with_privates.25* %19, i32 0, i32 1
  %22 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %21, i32 0, i32 1
  %23 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %8, i32 0, i32 0
  %24 = load i32**, i32*** %23, align 8
  %25 = load i32*, i32** %24, align 8
  store i32* %25, i32** %22, align 8
  %26 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %21, i32 0, i32 2
  %27 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %8, i32 0, i32 1
  %28 = load double**, double*** %27, align 8
  %29 = load double*, double** %28, align 8
  store double* %29, double** %26, align 8
  %30 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %21, i32 0, i32 3
  %31 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %8, i32 0, i32 2
  %32 = load double**, double*** %31, align 8
  %33 = load double*, double** %32, align 8
  store double* %33, double** %30, align 8
  %34 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %21, i32 0, i32 4
  %35 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %8, i32 0, i32 3
  %36 = load i32**, i32*** %35, align 8
  %37 = load i32*, i32** %36, align 8
  store i32* %37, i32** %34, align 8
  %38 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %21, i32 0, i32 5
  %39 = getelementptr inbounds %struct.anon.23, %struct.anon.23* %8, i32 0, i32 4
  %40 = load double**, double*** %39, align 8
  %41 = load double*, double** %40, align 8
  store double* %41, double** %38, align 8
  %42 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 5
  store i64 0, i64* %42, align 8
  %43 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 6
  %44 = load i32, i32* %6, align 4
  %45 = sext i32 %44 to i64
  store i64 %45, i64* %43, align 8
  %46 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 7
  store i64 1, i64* %46, align 8
  %47 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %20, i32 0, i32 9
  %48 = bitcast i8** %47 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %48, i8 0, i64 8, i1 false)
  %49 = load i64, i64* %46, align 8
  %50 = zext i32 %9 to i64
  call void @__kmpc_taskloop(%struct.ident_t* @2, i32 %7, i8* %18, i32 1, i64* %42, i64* %43, i64 %49, i32 1, i32 2, i64 %50, i8* null)
  call void @__kmpc_end_taskgroup(%struct.ident_t* @2, i32 %7)
  ret void
}

; Function Attrs: noinline uwtable
define internal void @.omp_task_privates_map..83(%struct..kmp_privates.t.26* noalias noundef %0, double** noalias noundef %1, i32** noalias noundef %2, i32*** noalias noundef %3, double*** noalias noundef %4, double*** noalias noundef %5, i32*** noalias noundef %6, double*** noalias noundef %7) #0 {
  %9 = alloca %struct..kmp_privates.t.26*, align 8
  %10 = alloca double**, align 8
  %11 = alloca i32**, align 8
  %12 = alloca i32***, align 8
  %13 = alloca double***, align 8
  %14 = alloca double***, align 8
  %15 = alloca i32***, align 8
  %16 = alloca double***, align 8
  store %struct..kmp_privates.t.26* %0, %struct..kmp_privates.t.26** %9, align 8
  store double** %1, double*** %10, align 8
  store i32** %2, i32*** %11, align 8
  store i32*** %3, i32**** %12, align 8
  store double*** %4, double**** %13, align 8
  store double*** %5, double**** %14, align 8
  store i32*** %6, i32**** %15, align 8
  store double*** %7, double**** %16, align 8
  %17 = load %struct..kmp_privates.t.26*, %struct..kmp_privates.t.26** %9, align 8
  %18 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %17, i32 0, i32 0
  %19 = load double**, double*** %10, align 8
  store double* %18, double** %19, align 8
  %20 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %17, i32 0, i32 1
  %21 = load i32***, i32**** %12, align 8
  store i32** %20, i32*** %21, align 8
  %22 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %17, i32 0, i32 2
  %23 = load double***, double**** %13, align 8
  store double** %22, double*** %23, align 8
  %24 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %17, i32 0, i32 3
  %25 = load double***, double**** %14, align 8
  store double** %24, double*** %25, align 8
  %26 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %17, i32 0, i32 4
  %27 = load i32***, i32**** %15, align 8
  store i32** %26, i32*** %27, align 8
  %28 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %17, i32 0, i32 5
  %29 = load double***, double**** %16, align 8
  store double** %28, double*** %29, align 8
  %30 = getelementptr inbounds %struct..kmp_privates.t.26, %struct..kmp_privates.t.26* %17, i32 0, i32 6
  %31 = load i32**, i32*** %11, align 8
  store i32* %30, i32** %31, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal noundef i32 @.omp_task_entry.84(i32 noundef %0, %struct.kmp_task_t_with_privates.25* noalias noundef %1) #10 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void (i8*, ...)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.anon.24*, align 8
  %14 = alloca double*, align 8
  %15 = alloca i32*, align 8
  %16 = alloca i32**, align 8
  %17 = alloca double**, align 8
  %18 = alloca double**, align 8
  %19 = alloca i32**, align 8
  %20 = alloca double**, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca %struct.kmp_task_t_with_privates.25*, align 8
  store i32 %0, i32* %26, align 4
  store %struct.kmp_task_t_with_privates.25* %1, %struct.kmp_task_t_with_privates.25** %27, align 8
  %28 = load i32, i32* %26, align 4
  %29 = load %struct.kmp_task_t_with_privates.25*, %struct.kmp_task_t_with_privates.25** %27, align 8
  %30 = getelementptr inbounds %struct.kmp_task_t_with_privates.25, %struct.kmp_task_t_with_privates.25* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 2
  %32 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 0
  %33 = load i8*, i8** %32, align 8
  %34 = bitcast i8* %33 to %struct.anon.24*
  %35 = getelementptr inbounds %struct.kmp_task_t_with_privates.25, %struct.kmp_task_t_with_privates.25* %29, i32 0, i32 1
  %36 = bitcast %struct..kmp_privates.t.26* %35 to i8*
  %37 = bitcast %struct.kmp_task_t_with_privates.25* %29 to i8*
  %38 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 5
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 6
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 7
  %43 = load i64, i64* %42, align 8
  %44 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 8
  %45 = load i32, i32* %44, align 8
  %46 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %30, i32 0, i32 9
  %47 = load i8*, i8** %46, align 8
  call void @llvm.experimental.noalias.scope.decl(metadata !108)
  call void @llvm.experimental.noalias.scope.decl(metadata !111)
  call void @llvm.experimental.noalias.scope.decl(metadata !113)
  call void @llvm.experimental.noalias.scope.decl(metadata !115)
  call void @llvm.experimental.noalias.scope.decl(metadata !117)
  store i32 %28, i32* %3, align 4, !noalias !119
  store i32* %31, i32** %4, align 8, !noalias !119
  store i8* %36, i8** %5, align 8, !noalias !119
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t.26*, double**, i32**, i32***, double***, double***, i32***, double***)* @.omp_task_privates_map..83 to void (i8*, ...)*), void (i8*, ...)** %6, align 8, !noalias !119
  store i8* %37, i8** %7, align 8, !noalias !119
  store i64 %39, i64* %8, align 8, !noalias !119
  store i64 %41, i64* %9, align 8, !noalias !119
  store i64 %43, i64* %10, align 8, !noalias !119
  store i32 %45, i32* %11, align 4, !noalias !119
  store i8* %47, i8** %12, align 8, !noalias !119
  store %struct.anon.24* %34, %struct.anon.24** %13, align 8, !noalias !119
  %48 = load %struct.anon.24*, %struct.anon.24** %13, align 8, !noalias !119
  %49 = load void (i8*, ...)*, void (i8*, ...)** %6, align 8, !noalias !119
  %50 = load i8*, i8** %5, align 8, !noalias !119
  %51 = bitcast void (i8*, ...)* %49 to void (i8*, double**, i32**, i32***, double***, double***, i32***, double***)*
  call void %51(i8* %50, double** %14, i32** %15, i32*** %16, double*** %17, double*** %18, i32*** %19, double*** %20)
  %52 = load double*, double** %14, align 8, !noalias !119
  %53 = load i32*, i32** %15, align 8, !noalias !119
  %54 = load i32**, i32*** %16, align 8, !noalias !119
  %55 = load double**, double*** %17, align 8, !noalias !119
  %56 = load double**, double*** %18, align 8, !noalias !119
  %57 = load i32**, i32*** %19, align 8, !noalias !119
  %58 = load double**, double*** %20, align 8, !noalias !119
  %59 = load i32, i32* @_ZL7lastrow, align 4
  %60 = load i32, i32* @_ZL8firstrow, align 4
  %61 = sub nsw i32 %59, %60
  %62 = add nsw i32 %61, 1
  store i32 %62, i32* %21, align 4, !noalias !119
  %63 = load i32, i32* %21, align 4, !noalias !119
  %64 = sub nsw i32 %63, 1
  store i32 %64, i32* %22, align 4, !noalias !119
  store i32 0, i32* %23, align 4, !noalias !119
  %65 = load i32, i32* %21, align 4, !noalias !119
  %66 = icmp slt i32 0, %65
  br i1 %66, label %67, label %119

67:                                               ; preds = %2
  %68 = load i64, i64* %8, align 8, !noalias !119
  %69 = trunc i64 %68 to i32
  store i32 %69, i32* %25, align 4, !noalias !119
  br label %70

70:                                               ; preds = %110, %67
  %71 = load i32, i32* %25, align 4, !noalias !119
  %72 = sext i32 %71 to i64
  %73 = load i64, i64* %9, align 8, !noalias !119
  %74 = icmp ule i64 %72, %73
  br i1 %74, label %75, label %118

75:                                               ; preds = %70
  %76 = load i32, i32* %25, align 4, !noalias !119
  store i32 %76, i32* %24, align 4, !noalias !119
  store double 0.000000e+00, double* %52, align 8
  %77 = load i32*, i32** %54, align 8
  %78 = load i32, i32* %24, align 4, !noalias !119
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32* %77, i64 %79
  %81 = load i32, i32* %80, align 4
  store i32 %81, i32* %53, align 4
  br label %82

82:                                               ; preds = %91, %75
  %83 = load i32, i32* %53, align 4
  %84 = load i32*, i32** %54, align 8
  %85 = load i32, i32* %24, align 4, !noalias !119
  %86 = add nsw i32 %85, 1
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds i32, i32* %84, i64 %87
  %89 = load i32, i32* %88, align 4
  %90 = icmp slt i32 %83, %89
  br i1 %90, label %91, label %110

91:                                               ; preds = %82
  %92 = load double*, double** %55, align 8
  %93 = load i32, i32* %53, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double, double* %92, i64 %94
  %96 = load double, double* %95, align 8
  %97 = load double*, double** %56, align 8
  %98 = load i32*, i32** %57, align 8
  %99 = load i32, i32* %53, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32* %98, i64 %100
  %102 = load i32, i32* %101, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds double, double* %97, i64 %103
  %105 = load double, double* %104, align 8
  %106 = load double, double* %52, align 8
  %107 = call double @llvm.fmuladd.f64(double %96, double %105, double %106)
  store double %107, double* %52, align 8
  %108 = load i32, i32* %53, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %53, align 4
  br label %82, !llvm.loop !120

110:                                              ; preds = %82
  %111 = load double, double* %52, align 8
  %112 = load double*, double** %58, align 8
  %113 = load i32, i32* %24, align 4, !noalias !119
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double* %112, i64 %114
  store double %111, double* %115, align 8
  %116 = load i32, i32* %25, align 4, !noalias !119
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %25, align 4, !noalias !119
  br label %70

118:                                              ; preds = %70
  br label %119

119:                                              ; preds = %2, %118
  ret i32 0
}

; Function Attrs: noinline optnone uwtable
define internal void @__captured_stmt.85(%struct.anon.27* noalias noundef %0) #14 {
  %2 = alloca %struct.anon.27*, align 8
  %3 = alloca %struct.anon.28, align 8
  %4 = alloca [1 x %struct.kmp_taskred_input_t.29], align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = call i32 @__kmpc_global_thread_num(%struct.ident_t* @2)
  store %struct.anon.27* %0, %struct.anon.27** %2, align 8
  %9 = load %struct.anon.27*, %struct.anon.27** %2, align 8
  %10 = getelementptr inbounds %struct.anon.28, %struct.anon.28* %3, i32 0, i32 0
  store double* @_ZL3sum, double** %10, align 8
  %11 = load i32, i32* @numThreads, align 4
  call void @__kmpc_taskgroup(%struct.ident_t* @2, i32 %8)
  %12 = getelementptr inbounds [1 x %struct.kmp_taskred_input_t.29], [1 x %struct.kmp_taskred_input_t.29]* %4, i64 0, i64 0
  %13 = getelementptr inbounds %struct.kmp_taskred_input_t.29, %struct.kmp_taskred_input_t.29* %12, i32 0, i32 0
  store i8* bitcast (double* @_ZL3sum to i8*), i8** %13, align 8
  %14 = getelementptr inbounds %struct.kmp_taskred_input_t.29, %struct.kmp_taskred_input_t.29* %12, i32 0, i32 1
  store i8* bitcast (double* @_ZL3sum to i8*), i8** %14, align 8
  %15 = getelementptr inbounds %struct.kmp_taskred_input_t.29, %struct.kmp_taskred_input_t.29* %12, i32 0, i32 2
  store i64 8, i64* %15, align 8
  %16 = getelementptr inbounds %struct.kmp_taskred_input_t.29, %struct.kmp_taskred_input_t.29* %12, i32 0, i32 3
  store i8* bitcast (void (i8*, i8*)* @.red_init..86 to i8*), i8** %16, align 8
  %17 = getelementptr inbounds %struct.kmp_taskred_input_t.29, %struct.kmp_taskred_input_t.29* %12, i32 0, i32 4
  store i8* null, i8** %17, align 8
  %18 = getelementptr inbounds %struct.kmp_taskred_input_t.29, %struct.kmp_taskred_input_t.29* %12, i32 0, i32 5
  store i8* bitcast (void (i8*, i8*)* @.red_comb..87 to i8*), i8** %18, align 8
  %19 = getelementptr inbounds %struct.kmp_taskred_input_t.29, %struct.kmp_taskred_input_t.29* %12, i32 0, i32 6
  %20 = bitcast i32* %19 to i8*
  call void @llvm.memset.p0i8.i64(i8* align 8 %20, i8 0, i64 4, i1 false)
  %21 = bitcast [1 x %struct.kmp_taskred_input_t.29]* %4 to i8*
  %22 = call i8* @__kmpc_taskred_init(i32 %8, i32 1, i8* %21)
  %23 = load i32, i32* @_ZL7lastcol, align 4
  %24 = load i32, i32* @_ZL8firstcol, align 4
  %25 = sub nsw i32 %23, %24
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %6, align 4
  %27 = load i32, i32* %6, align 4
  %28 = sub nsw i32 %27, 0
  %29 = sdiv i32 %28, 1
  %30 = sub nsw i32 %29, 1
  store i32 %30, i32* %7, align 4
  %31 = call i8* @__kmpc_omp_task_alloc(%struct.ident_t* @2, i32 %8, i32 1, i64 104, i64 8, i32 (i32, i8*)* bitcast (i32 (i32, %struct.kmp_task_t_with_privates.30*)* @.omp_task_entry.90 to i32 (i32, i8*)*))
  call void @__kmpc_set_task_static_id(i32 %8, i8* %31)
  %32 = bitcast i8* %31 to %struct.kmp_task_t_with_privates.30*
  %33 = getelementptr inbounds %struct.kmp_task_t_with_privates.30, %struct.kmp_task_t_with_privates.30* %32, i32 0, i32 0
  %34 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 0
  %35 = load i8*, i8** %34, align 8
  %36 = bitcast %struct.anon.28* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 8 %35, i8* align 8 %36, i64 8, i1 false)
  %37 = getelementptr inbounds %struct.kmp_task_t_with_privates.30, %struct.kmp_task_t_with_privates.30* %32, i32 0, i32 1
  %38 = getelementptr inbounds %struct..kmp_privates.t.31, %struct..kmp_privates.t.31* %37, i32 0, i32 1
  %39 = getelementptr inbounds %struct.anon.27, %struct.anon.27* %9, i32 0, i32 0
  %40 = load double**, double*** %39, align 8
  %41 = load double*, double** %40, align 8
  store double* %41, double** %38, align 8
  %42 = getelementptr inbounds %struct..kmp_privates.t.31, %struct..kmp_privates.t.31* %37, i32 0, i32 2
  %43 = getelementptr inbounds %struct.anon.27, %struct.anon.27* %9, i32 0, i32 1
  %44 = load double**, double*** %43, align 8
  %45 = load double*, double** %44, align 8
  store double* %45, double** %42, align 8
  %46 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 5
  store i64 0, i64* %46, align 8
  %47 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 6
  %48 = load i32, i32* %7, align 4
  %49 = sext i32 %48 to i64
  store i64 %49, i64* %47, align 8
  %50 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 7
  store i64 1, i64* %50, align 8
  %51 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %33, i32 0, i32 9
  store i8* %22, i8** %51, align 8
  %52 = load i64, i64* %50, align 8
  %53 = zext i32 %11 to i64
  call void @__kmpc_taskloop(%struct.ident_t* @2, i32 %8, i8* %31, i32 1, i64* %46, i64* %47, i64 %52, i32 1, i32 2, i64 %53, i8* null)
  call void @__kmpc_end_taskgroup(%struct.ident_t* @2, i32 %8)
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal void @.red_init..86(i8* noalias noundef %0, i8* noalias noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to double*
  store double 0.000000e+00, double* %6, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal void @.red_comb..87(i8* noundef %0, i8* noundef %1) #10 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %5 = load i8*, i8** %3, align 8
  %6 = bitcast i8* %5 to double*
  %7 = load i8*, i8** %4, align 8
  %8 = bitcast i8* %7 to double*
  %9 = load double, double* %6, align 8
  %10 = load double, double* %8, align 8
  %11 = fadd double %9, %10
  store double %11, double* %6, align 8
  ret void
}

; Function Attrs: noinline uwtable
define internal void @.omp_task_privates_map..89(%struct..kmp_privates.t.31* noalias noundef %0, double** noalias noundef %1, double*** noalias noundef %2, double*** noalias noundef %3) #0 {
  %5 = alloca %struct..kmp_privates.t.31*, align 8
  %6 = alloca double**, align 8
  %7 = alloca double***, align 8
  %8 = alloca double***, align 8
  store %struct..kmp_privates.t.31* %0, %struct..kmp_privates.t.31** %5, align 8
  store double** %1, double*** %6, align 8
  store double*** %2, double**** %7, align 8
  store double*** %3, double**** %8, align 8
  %9 = load %struct..kmp_privates.t.31*, %struct..kmp_privates.t.31** %5, align 8
  %10 = getelementptr inbounds %struct..kmp_privates.t.31, %struct..kmp_privates.t.31* %9, i32 0, i32 0
  %11 = load double**, double*** %6, align 8
  store double* %10, double** %11, align 8
  %12 = getelementptr inbounds %struct..kmp_privates.t.31, %struct..kmp_privates.t.31* %9, i32 0, i32 1
  %13 = load double***, double**** %7, align 8
  store double** %12, double*** %13, align 8
  %14 = getelementptr inbounds %struct..kmp_privates.t.31, %struct..kmp_privates.t.31* %9, i32 0, i32 2
  %15 = load double***, double**** %8, align 8
  store double** %14, double*** %15, align 8
  ret void
}

; Function Attrs: noinline norecurse uwtable
define internal noundef i32 @.omp_task_entry.90(i32 noundef %0, %struct.kmp_task_t_with_privates.30* noalias noundef %1) #10 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca void (i8*, ...)*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca %struct.anon.28*, align 8
  %14 = alloca double*, align 8
  %15 = alloca double**, align 8
  %16 = alloca double**, align 8
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca %struct.kmp_task_t_with_privates.30*, align 8
  store i32 %0, i32* %22, align 4
  store %struct.kmp_task_t_with_privates.30* %1, %struct.kmp_task_t_with_privates.30** %23, align 8
  %24 = load i32, i32* %22, align 4
  %25 = load %struct.kmp_task_t_with_privates.30*, %struct.kmp_task_t_with_privates.30** %23, align 8
  %26 = getelementptr inbounds %struct.kmp_task_t_with_privates.30, %struct.kmp_task_t_with_privates.30* %25, i32 0, i32 0
  %27 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %26, i32 0, i32 2
  %28 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %26, i32 0, i32 0
  %29 = load i8*, i8** %28, align 8
  %30 = bitcast i8* %29 to %struct.anon.28*
  %31 = getelementptr inbounds %struct.kmp_task_t_with_privates.30, %struct.kmp_task_t_with_privates.30* %25, i32 0, i32 1
  %32 = bitcast %struct..kmp_privates.t.31* %31 to i8*
  %33 = bitcast %struct.kmp_task_t_with_privates.30* %25 to i8*
  %34 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %26, i32 0, i32 5
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %26, i32 0, i32 6
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %26, i32 0, i32 7
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %26, i32 0, i32 8
  %41 = load i32, i32* %40, align 8
  %42 = getelementptr inbounds %struct.kmp_task_t, %struct.kmp_task_t* %26, i32 0, i32 9
  %43 = load i8*, i8** %42, align 8
  call void @llvm.experimental.noalias.scope.decl(metadata !121)
  call void @llvm.experimental.noalias.scope.decl(metadata !124)
  call void @llvm.experimental.noalias.scope.decl(metadata !126)
  call void @llvm.experimental.noalias.scope.decl(metadata !128)
  call void @llvm.experimental.noalias.scope.decl(metadata !130)
  store i32 %24, i32* %3, align 4, !noalias !132
  store i32* %27, i32** %4, align 8, !noalias !132
  store i8* %32, i8** %5, align 8, !noalias !132
  store void (i8*, ...)* bitcast (void (%struct..kmp_privates.t.31*, double**, double***, double***)* @.omp_task_privates_map..89 to void (i8*, ...)*), void (i8*, ...)** %6, align 8, !noalias !132
  store i8* %33, i8** %7, align 8, !noalias !132
  store i64 %35, i64* %8, align 8, !noalias !132
  store i64 %37, i64* %9, align 8, !noalias !132
  store i64 %39, i64* %10, align 8, !noalias !132
  store i32 %41, i32* %11, align 4, !noalias !132
  store i8* %43, i8** %12, align 8, !noalias !132
  store %struct.anon.28* %30, %struct.anon.28** %13, align 8, !noalias !132
  %44 = load %struct.anon.28*, %struct.anon.28** %13, align 8, !noalias !132
  %45 = load void (i8*, ...)*, void (i8*, ...)** %6, align 8, !noalias !132
  %46 = load i8*, i8** %5, align 8, !noalias !132
  %47 = bitcast void (i8*, ...)* %45 to void (i8*, double**, double***, double***)*
  call void %47(i8* %46, double** %14, double*** %15, double*** %16)
  %48 = load double*, double** %14, align 8, !noalias !132
  %49 = load double**, double*** %15, align 8, !noalias !132
  %50 = load double**, double*** %16, align 8, !noalias !132
  %51 = load double**, double*** %15, align 8, !noalias !132
  %52 = load double**, double*** %16, align 8, !noalias !132
  %53 = getelementptr inbounds %struct.anon.28, %struct.anon.28* %44, i32 0, i32 0
  %54 = load double*, double** %53, align 8
  %55 = load i8*, i8** %12, align 8, !noalias !132
  %56 = load i32, i32* %3, align 4, !noalias !132
  %57 = bitcast double* %54 to i8*
  %58 = call i8* @__kmpc_task_reduction_get_th_data(i32 %56, i8* %55, i8* %57)
  %59 = bitcast i8* %58 to double*
  %60 = load i32, i32* @_ZL7lastcol, align 4
  %61 = load i32, i32* @_ZL8firstcol, align 4
  %62 = sub nsw i32 %60, %61
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %17, align 4, !noalias !132
  %64 = load i32, i32* %17, align 4, !noalias !132
  %65 = sub nsw i32 %64, 1
  store i32 %65, i32* %18, align 4, !noalias !132
  store i32 0, i32* %19, align 4, !noalias !132
  %66 = load i32, i32* %17, align 4, !noalias !132
  %67 = icmp slt i32 0, %66
  br i1 %67, label %68, label %96

68:                                               ; preds = %2
  %69 = load i64, i64* %8, align 8, !noalias !132
  %70 = trunc i64 %69 to i32
  store i32 %70, i32* %21, align 4, !noalias !132
  br label %71

71:                                               ; preds = %76, %68
  %72 = load i32, i32* %21, align 4, !noalias !132
  %73 = sext i32 %72 to i64
  %74 = load i64, i64* %9, align 8, !noalias !132
  %75 = icmp ule i64 %73, %74
  br i1 %75, label %76, label %95

76:                                               ; preds = %71
  %77 = load i32, i32* %21, align 4, !noalias !132
  store i32 %77, i32* %20, align 4, !noalias !132
  %78 = load double*, double** %49, align 8
  %79 = load i32, i32* %20, align 4, !noalias !132
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds double, double* %78, i64 %80
  %82 = load double, double* %81, align 8
  %83 = load double*, double** %50, align 8
  %84 = load i32, i32* %20, align 4, !noalias !132
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds double, double* %83, i64 %85
  %87 = load double, double* %86, align 8
  %88 = fsub double %82, %87
  store double %88, double* %48, align 8
  %89 = load double, double* %48, align 8
  %90 = load double, double* %48, align 8
  %91 = load double, double* %59, align 8
  %92 = call double @llvm.fmuladd.f64(double %89, double %90, double %91)
  store double %92, double* %59, align 8
  %93 = load i32, i32* %21, align 4, !noalias !132
  %94 = add nsw i32 %93, 1
  store i32 %94, i32* %21, align 4, !noalias !132
  br label %71

95:                                               ; preds = %71
  br label %96

96:                                               ; preds = %2, %95
  ret i32 0
}

; Function Attrs: noinline uwtable
define internal void @_GLOBAL__sub_I_cg_taskloop.cpp() #0 section ".text.startup" {
  call void @__cxx_global_var_init()
  call void @__cxx_global_var_init.1()
  call void @__cxx_global_var_init.2()
  call void @__cxx_global_var_init.3()
  call void @__cxx_global_var_init.4()
  call void @__cxx_global_var_init.5()
  call void @__cxx_global_var_init.6()
  call void @__cxx_global_var_init.7()
  call void @__cxx_global_var_init.8()
  call void @__cxx_global_var_init.9()
  call void @__cxx_global_var_init.10()
  call void @__cxx_global_var_init.11()
  call void @__cxx_global_var_init.12()
  ret void
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.experimental.noalias.scope.decl(metadata) #17

attributes #0 = { noinline uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress noinline norecurse optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { noinline norecurse nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { convergent nounwind }
attributes #8 = { noinline noreturn nounwind }
attributes #9 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #10 = { noinline norecurse uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { argmemonly nofree nounwind willreturn writeonly }
attributes #16 = { argmemonly nofree nounwind willreturn }
attributes #17 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #18 = { nounwind allocsize(0) }
attributes #19 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"openmp", i32 50}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 2}
!4 = !{!"clang version 15.0.0 (git@gitlab-internal.bsc.es:ppc/software/llvm-ompss.git c35ef504be90621f46b6a5a8df5a61d426edf148)"}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !6}
!10 = distinct !{!10, !6}
!11 = distinct !{!11, !6}
!12 = distinct !{!12, !6}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = !{!16}
!16 = !{i64 2, i64 -1, i64 -1, i1 true}
!17 = distinct !{!17, !6}
!18 = distinct !{!18, !6}
!19 = distinct !{!19, !6}
!20 = distinct !{!20, !6}
!21 = distinct !{!21, !6}
!22 = distinct !{!22, !6}
!23 = distinct !{!23, !6}
!24 = distinct !{!24, !6}
!25 = distinct !{!25, !6}
!26 = distinct !{!26, !6}
!27 = distinct !{!27, !6}
!28 = distinct !{!28, !6}
!29 = distinct !{!29, !6}
!30 = distinct !{!30, !6}
!31 = distinct !{!31, !6}
!32 = distinct !{!32, !6}
!33 = distinct !{!33, !6}
!34 = distinct !{!34, !6}
!35 = !{!36}
!36 = distinct !{!36, !37, !".omp_outlined..56: argument 0"}
!37 = distinct !{!37, !".omp_outlined..56"}
!38 = !{!39}
!39 = distinct !{!39, !37, !".omp_outlined..56: argument 1"}
!40 = !{!41}
!41 = distinct !{!41, !37, !".omp_outlined..56: argument 2"}
!42 = !{!43}
!43 = distinct !{!43, !37, !".omp_outlined..56: argument 3"}
!44 = !{!45}
!45 = distinct !{!45, !37, !".omp_outlined..56: argument 4"}
!46 = !{!36, !39, !41, !43, !45}
!47 = !{!48}
!48 = distinct !{!48, !49, !".omp_outlined..58: argument 0"}
!49 = distinct !{!49, !".omp_outlined..58"}
!50 = !{!51}
!51 = distinct !{!51, !49, !".omp_outlined..58: argument 1"}
!52 = !{!53}
!53 = distinct !{!53, !49, !".omp_outlined..58: argument 2"}
!54 = !{!55}
!55 = distinct !{!55, !49, !".omp_outlined..58: argument 3"}
!56 = !{!57}
!57 = distinct !{!57, !49, !".omp_outlined..58: argument 4"}
!58 = !{!48, !51, !53, !55, !57}
!59 = !{!60}
!60 = distinct !{!60, !61, !".omp_outlined..62: argument 0"}
!61 = distinct !{!61, !".omp_outlined..62"}
!62 = !{!63}
!63 = distinct !{!63, !61, !".omp_outlined..62: argument 1"}
!64 = !{!65}
!65 = distinct !{!65, !61, !".omp_outlined..62: argument 2"}
!66 = !{!67}
!67 = distinct !{!67, !61, !".omp_outlined..62: argument 3"}
!68 = !{!69}
!69 = distinct !{!69, !61, !".omp_outlined..62: argument 4"}
!70 = !{!60, !63, !65, !67, !69}
!71 = distinct !{!71, !6}
!72 = !{!73}
!73 = distinct !{!73, !74, !".omp_outlined..68: argument 0"}
!74 = distinct !{!74, !".omp_outlined..68"}
!75 = !{!76}
!76 = distinct !{!76, !74, !".omp_outlined..68: argument 1"}
!77 = !{!78}
!78 = distinct !{!78, !74, !".omp_outlined..68: argument 2"}
!79 = !{!80}
!80 = distinct !{!80, !74, !".omp_outlined..68: argument 3"}
!81 = !{!82}
!82 = distinct !{!82, !74, !".omp_outlined..68: argument 4"}
!83 = !{!73, !76, !78, !80, !82}
!84 = !{!85}
!85 = distinct !{!85, !86, !".omp_outlined..74: argument 0"}
!86 = distinct !{!86, !".omp_outlined..74"}
!87 = !{!88}
!88 = distinct !{!88, !86, !".omp_outlined..74: argument 1"}
!89 = !{!90}
!90 = distinct !{!90, !86, !".omp_outlined..74: argument 2"}
!91 = !{!92}
!92 = distinct !{!92, !86, !".omp_outlined..74: argument 3"}
!93 = !{!94}
!94 = distinct !{!94, !86, !".omp_outlined..74: argument 4"}
!95 = !{!85, !88, !90, !92, !94}
!96 = !{!97}
!97 = distinct !{!97, !98, !".omp_outlined..78: argument 0"}
!98 = distinct !{!98, !".omp_outlined..78"}
!99 = !{!100}
!100 = distinct !{!100, !98, !".omp_outlined..78: argument 1"}
!101 = !{!102}
!102 = distinct !{!102, !98, !".omp_outlined..78: argument 2"}
!103 = !{!104}
!104 = distinct !{!104, !98, !".omp_outlined..78: argument 3"}
!105 = !{!106}
!106 = distinct !{!106, !98, !".omp_outlined..78: argument 4"}
!107 = !{!97, !100, !102, !104, !106}
!108 = !{!109}
!109 = distinct !{!109, !110, !".omp_outlined..82: argument 0"}
!110 = distinct !{!110, !".omp_outlined..82"}
!111 = !{!112}
!112 = distinct !{!112, !110, !".omp_outlined..82: argument 1"}
!113 = !{!114}
!114 = distinct !{!114, !110, !".omp_outlined..82: argument 2"}
!115 = !{!116}
!116 = distinct !{!116, !110, !".omp_outlined..82: argument 3"}
!117 = !{!118}
!118 = distinct !{!118, !110, !".omp_outlined..82: argument 4"}
!119 = !{!109, !112, !114, !116, !118}
!120 = distinct !{!120, !6}
!121 = !{!122}
!122 = distinct !{!122, !123, !".omp_outlined..88: argument 0"}
!123 = distinct !{!123, !".omp_outlined..88"}
!124 = !{!125}
!125 = distinct !{!125, !123, !".omp_outlined..88: argument 1"}
!126 = !{!127}
!127 = distinct !{!127, !123, !".omp_outlined..88: argument 2"}
!128 = !{!129}
!129 = distinct !{!129, !123, !".omp_outlined..88: argument 3"}
!130 = !{!131}
!131 = distinct !{!131, !123, !".omp_outlined..88: argument 4"}
!132 = !{!122, !125, !127, !129, !131}
