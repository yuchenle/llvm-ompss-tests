// Part of the CG (Conjugate gradient) method
// Complete source in BAR/Apps/CG from https://pm.bsc.es/svn/BAR

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include "gtest/gtest.h"

#if defined(_OPENMP)
    #include <omp.h>
#endif

#ifndef N
    //#define N 16777216
    #define N 268435456
#endif
#ifndef BS1
    #define BS1 (N/1024)
#endif
#ifndef BS2
    #define BS2 (BS1/32)
#endif
#define a   1.0

#define NUM_ITER 10

struct timeval t1, t2;

void saxpy(double *x, double *y)
{
    for (int i = 0; i < N; i+=BS1)
    {
#ifdef PREALLOC
        #pragma omp task dep_check(dynamic)
#else
        #pragma omp task //shared(x,y)
#endif  
        { 
            for(int j = 0; j < BS1; j++)
            {
                y[i+j] += a * x[i+j];
            }
        }
    }
    #pragma omp taskwait
}

TEST(AXPY, DYNAMIC_TDG)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel shared(x,y)
    #pragma omp single
    {
      for (int i=0; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, STATIC_TDG)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel shared(x,y)
    #pragma omp single
    {
      for (int i=0; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, RERECORDING)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    int tasks_added = 0;
    #pragma omp parallel shared(x,y,tasks_added)
    #pragma omp single
    {
      for (int i=0; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) if(i==5)
      #endif
      {
        if(i>2)
        {
            #pragma omp task shared(tasks_added)
            {
                tasks_added++;
            }
        }
        saxpy(x, y);
      }
    }

    EXPECT_EQ(tasks_added, 5);

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, MULTIPLE_DYNAMIC)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel shared(x,y)
    #pragma omp single
    {
      for (int i=0; i<NUM_ITER / 2; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, MULTIPLE_STATIC)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel shared(x,y)
    #pragma omp single
    {
      for (int i=0; i<NUM_ITER / 2; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, ONE_STATIC_ONE_DYNAMIC)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel shared(x,y)
    #pragma omp single
    {
      for (int i=0; i<NUM_ITER / 2; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, MULTIPLE_STATIC_ONE_DYNAMIC)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel shared(x,y)
    #pragma omp single
    {
      for (int i=0; i< 2; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i=2; i< 5; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, ONE_STATIC_MULTIPLE_DYNAMIC)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel shared(x,y)
    #pragma omp single
    {
      for (int i=0; i< 2; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i=2; i< 5; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, MULTIPLE_STATIC_MULTIPLE_DYNAMIC)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel shared(x,y)
    #pragma omp single
    {
      for (int i=0; i< 2; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i=2; i< 5; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= 5; i< 8; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
      for (int i= 8; i< NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)// num_preallocs(2)
      #endif
      {
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

int main (int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}