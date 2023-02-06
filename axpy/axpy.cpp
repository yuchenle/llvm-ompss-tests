// Part of the CG (Conjugate gradient) method
// Complete source in BAR/Apps/CG from https://pm.bsc.es/svn/BAR

// Part of Taskgraph directive tests. Verifying the correct
// behaviors of Taskgraph in different scenarios, as defined in RESULT.txt
//
// Using *axpy* benchmark, without task dependencies


#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <omp.h>
#include "gtest/gtest.h"

#if defined(_OPENMP)
    #include <omp.h>
#endif

#ifndef N
    #define N 16777216
    //#define N 268435456
#endif
#ifndef BS1
    #define BS1 (N/1024)
#endif
#ifndef BS2
    #define BS2 (BS1/32)
#endif
#define a   1.0

#define NUM_ITER 10
#define REPLICAS 3

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

int isEqual(int *original, int *replica){
  //printf("Ey %d %d \n", *original, *replica); 
  bool equal = false;
  if(*original == *replica)
    equal= true;
  else
    printf("Numbers %d %d \n", *original, *replica); 

  EXPECT_EQ(true, equal);

  return 1;
}


TEST(AXPY, TASK_VANILLA_AND_TASKGRAPH)
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
      for (int i=0; i<NUM_ITER/2; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)
      #endif
      {
        saxpy(x, y);
      }
      for (int i=NUM_ITER/2; i<NUM_ITER; i++){
        saxpy(x, y);
      }
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*NUM_ITER+1,y[i]);

    free(x);
    free(y);
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
      #pragma omp taskgraph tdg_type(dynamic)
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

TEST(AXPY, DYNAMIC_TDG_1_THREAD)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel num_threads(1) shared(x,y)
    #pragma omp single
    {
      for (int i=0; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)
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
      #pragma omp taskgraph tdg_type(static)
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

TEST(AXPY, STATIC_TDG_1_THREAD)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    #pragma omp parallel num_threads(1) shared(x,y)
    #pragma omp single
    {
      for (int i=0; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)
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
      #pragma omp taskgraph tdg_type(dynamic)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)
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
      #pragma omp taskgraph tdg_type(static)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)
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
      #pragma omp taskgraph tdg_type(static)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)
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
      #pragma omp taskgraph tdg_type(static)
      #endif
      {
        saxpy(x, y);
      }

      for (int i=2; i< 5; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)
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
      #pragma omp taskgraph tdg_type(dynamic)
      #endif
      {
        saxpy(x, y);
      }

      for (int i=2; i< 5; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)
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
      #pragma omp taskgraph tdg_type(dynamic)
      #endif
      {
        saxpy(x, y);
      }

      for (int i=2; i< 5; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic)
      #endif
      {
        saxpy(x, y);
      }

      for (int i= 5; i< 8; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)
      #endif
      {
        saxpy(x, y);
      }
      for (int i= 8; i< NUM_ITER; i++)
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static)
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

TEST(AXPY, PARALLEL_CREATION_ONE_STATIC_ONE_DYNAMIC)
{
    double *x, *y, *y1, *y2;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);
    y1 = (double*)malloc(sizeof(double) * N);
    y2 = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = y1[i] = y2[i] = 1;
    }

    bool parallelCreation = false;
    bool volatile firstExecuting = false;
    bool volatile secondExecuting = false;
    #pragma omp parallel shared(x,y,parallelCreation,firstExecuting, secondExecuting)
    {
      int thid = omp_get_thread_num();
      if (thid == 0) {
        for (int i = 0; i < NUM_ITER / 2; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(static) nowait
        #endif
        {
          #pragma omp critical
          {
            firstExecuting = true;
            if(secondExecuting)
              parallelCreation = true;
          }
          //Sleep to force concurrency
          sleep(1);

          saxpy(x, y1);

          firstExecuting = false;
        }
      } else if (thid == 1) {
        for (int i = NUM_ITER / 2; i < NUM_ITER; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic) nowait
        #endif
        {
          #pragma omp critical
          {
            secondExecuting = true;

            if(firstExecuting)
              parallelCreation = true;
          }
          //Sleep to force concurrency
          sleep(1);

          saxpy(x, y2);

          secondExecuting = false;
        }
      }
    }

    for(int i = 0; i < N; ++i){
        y[i] = y1[i]+y2[i];
    }

    EXPECT_EQ(true, parallelCreation);
    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+2,y[i]);

    free(x);
    free(y);
    free(y1);
    free(y2);
}

TEST(AXPY, PARALLEL_CREATION_MULTIPLE_STATIC_ONE_DYNAMIC)
{
    double *x, *y, *y1, *y2, *y3;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);
    y1 = (double*)malloc(sizeof(double) * N);
    y2 = (double*)malloc(sizeof(double) * N);
    y3 = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = y1[i] = y2[i] = y3[i] = 1;
    }

    bool parallelCreation = false;
    bool volatile firstExecuting = false;
    bool volatile secondExecuting = false;
    bool volatile thirdExecuting = false;
    #pragma omp parallel shared(x,y,parallelCreation,firstExecuting, secondExecuting)
    {
      int thid = omp_get_thread_num();
      if (thid == 0) {
        for (int i = 0; i < 3; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(static) nowait
        #endif
        {
          #pragma omp critical
          {
            firstExecuting = true;
            if (secondExecuting && thirdExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y1);

          firstExecuting = false;
        }
      } else if (thid == 1) {
        for (int i = 3; i < 8; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(static) nowait
        #endif
        {
          #pragma omp critical
          {
            secondExecuting = true;

            if (firstExecuting && thirdExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y2);

          secondExecuting = false;
        }
      } else if (thid == 2) {
        for (int i = 8; i < NUM_ITER; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic) nowait
        #endif
        {
          #pragma omp critical
          {
            thirdExecuting = true;

            if (secondExecuting && firstExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y3);

          thirdExecuting = false;
        }
      }
    }

    for(int i = 0; i < N; ++i){
        y[i] = y1[i]+y2[i]+y3[i];
    }

    EXPECT_EQ(true, parallelCreation);
    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+3,y[i]);

    free(x);
    free(y);
    free(y1);
    free(y2);
    free(y3);
}

TEST(AXPY, PARALLEL_CREATION_ONE_STATIC_MULTIPLE_DYNAMIC)
{
    double *x, *y, *y1, *y2, *y3;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);
    y1 = (double*)malloc(sizeof(double) * N);
    y2 = (double*)malloc(sizeof(double) * N);
    y3 = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = y1[i] = y2[i] = y3[i] = 1;
    }

    bool parallelCreation = false;
    bool volatile firstExecuting = false;
    bool volatile secondExecuting = false;
    bool volatile thirdExecuting = false;
    #pragma omp parallel shared(x,y,parallelCreation,firstExecuting, secondExecuting)
    {
      int thid = omp_get_thread_num();
      if (thid == 0) {
        for (int i = 0; i < 3; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(static) nowait
        #endif
        {
          #pragma omp critical
          {
            firstExecuting = true;
            if (secondExecuting && thirdExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y1);

          firstExecuting = false;
        }
      } else if (thid == 1) {
        for (int i = 3; i < 8; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic) nowait
        #endif
        {
          #pragma omp critical
          {
            secondExecuting = true;

            if (firstExecuting && thirdExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y2);

          secondExecuting = false;
        }
      } else if (thid == 2) {
        for (int i = 8; i < NUM_ITER; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic) nowait
        #endif
        {
          #pragma omp critical
          {
            thirdExecuting = true;

            if (secondExecuting && firstExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y3);

          thirdExecuting = false;
        }
      }
    }

    for(int i = 0; i < N; ++i){
        y[i] = y1[i]+y2[i]+y3[i];
    }

    EXPECT_EQ(true, parallelCreation);
    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+3,y[i]);

    free(x);
    free(y);
    free(y1);
    free(y2);
    free(y3);
}

TEST(AXPY, PARALLEL_CREATION_MULTIPLE_STATIC_MULTIPLE_DYNAMIC)
{
    double *x, *y, *y1, *y2, *y3, *y4;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);
    y1 = (double*)malloc(sizeof(double) * N);
    y2 = (double*)malloc(sizeof(double) * N);
    y3 = (double*)malloc(sizeof(double) * N);
    y4 = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = y1[i] = y2[i] = y3[i] = y4[i] = 1;
    }

    bool parallelCreation = false;
    bool volatile firstExecuting = false;
    bool volatile secondExecuting = false;
    bool volatile thirdExecuting = false;
    bool volatile fourthExecuting = false;
    #pragma omp parallel shared(x,y,parallelCreation,firstExecuting, secondExecuting)
    {
      int thid = omp_get_thread_num();
      if (thid == 0) {
        for (int i = 0; i < 2; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(static) nowait
        #endif
        {
          #pragma omp critical
          {
            firstExecuting = true;
            if (secondExecuting && thirdExecuting && fourthExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y1);

          firstExecuting = false;
        }
      } else if (thid == 1) {
        for (int i = 2; i < 5; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic) nowait
        #endif
        {
          #pragma omp critical
          {
            secondExecuting = true;

            if (firstExecuting && thirdExecuting && fourthExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y2);

          secondExecuting = false;
        }
      } else if (thid == 2) {
        for (int i = 5; i < 8; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic) nowait
        #endif
        {
          #pragma omp critical
          {
            thirdExecuting = true;

            if (secondExecuting && firstExecuting && fourthExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y3);

          thirdExecuting = false;
        }
      } else if (thid == 4) {
        for (int i = 8; i < NUM_ITER; i++)
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic) nowait
        #endif
        {
          #pragma omp critical
          {
            fourthExecuting = true;

            if (secondExecuting && firstExecuting && thirdExecuting)
              parallelCreation = true;
          }
          // Sleep to force concurrency
          sleep(1);

          saxpy(x, y4);

          fourthExecuting = false;
        }
      }
    }

    for(int i = 0; i < N; ++i){
        y[i] = y1[i]+y2[i]+y3[i]+y4[i];
    }

    EXPECT_EQ(true, parallelCreation);
    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+4,y[i]);

    free(x);
    free(y);
    free(y1);
    free(y2);
    free(y3);
    free(y4);
}

TEST(AXPY, PARALLEL_EXECUTION_ONE_STATIC_ONE_DYNAMIC)
{
        double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    bool volatile firstFinished = false;
    bool parallelExecution = true;
    #pragma omp parallel shared(x,y,parallelExecution)
    #pragma omp single
    {
      for (int j= 0; j < 2 ; j++) {
      firstFinished = false;
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) nowait
      #endif
      {
        for (int i=0; i<NUM_ITER / 2; i++)
          saxpy(x, y);

        #pragma omp task
        {
          sleep(1);
          firstFinished = true;
        }
      }
            
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) 
      #endif
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }
    }
    }

    //The parallel execution works because main thread starts executing tasks from the tail instead the head once it finishes the creation, and the task from the second taskgraph is the tail of the queue
    EXPECT_EQ(true, parallelExecution);

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, PARALLEL_EXECUTION_MULTIPLE_STATIC_ONE_DYNAMIC)
{
        double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    bool volatile firstFinished = false;
    bool parallelExecution = true;
    #pragma omp parallel shared(x,y,parallelExecution)
    #pragma omp single
    {
      for (int j= 0; j < 2 ; j++) {
      firstFinished = false;
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) nowait
      #endif
      {
        for (int i=0; i<NUM_ITER / 2; i++)
          saxpy(x, y);

        #pragma omp task
        {
          sleep(1);
          firstFinished = true;
        }
      }
            
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) 
      #endif
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }

      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) 
      #endif
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }
    }
    }

    //The parallel execution works because main thread starts executing tasks from the tail instead the head once it finishes the creation, and the task from the second taskgraph is the tail of the queue
    EXPECT_EQ(true, parallelExecution);

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, PARALLEL_EXECUTION_ONE_STATIC_MULTIPLE_DYNAMIC)
{
        double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    bool volatile firstFinished = false;
    bool parallelExecution = true;
    #pragma omp parallel shared(x,y,parallelExecution)
    #pragma omp single
    {
      for (int j= 0; j < 2 ; j++) {
      firstFinished = false;
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) nowait
      #endif
      {
        for (int i=0; i<NUM_ITER / 2; i++)
          saxpy(x, y);

        #pragma omp task
        {
          sleep(1);
          firstFinished = true;
        }
      }
            
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) 
      #endif
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }

      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) 
      #endif
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }
    }
    }

    //The parallel execution works because main thread starts executing tasks from the tail instead the head once it finishes the creation, and the task from the second taskgraph is the tail of the queue
    EXPECT_EQ(true, parallelExecution);

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}


TEST(AXPY, PARALLEL_EXECUTION_MULTIPLE_STATIC_MULTIPLE_DYNAMIC)
{
        double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    bool volatile firstFinished = false;
    bool parallelExecution = true;
    #pragma omp parallel shared(x,y,parallelExecution)
    #pragma omp single
    {
      for (int j= 0; j < 2 ; j++) {
      firstFinished = false;
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) nowait
      #endif
      {
        for (int i=0; i<NUM_ITER / 2; i++)
          saxpy(x, y);

        #pragma omp task
        {
          sleep(1);
          firstFinished = true;
        }
      }
            
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) 
      #endif
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }

      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) 
      #endif
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }

      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) 
      #endif
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }
    }
    }

    //The parallel execution works because main thread starts executing tasks from the tail instead the head once it finishes the creation, and the task from the second taskgraph is the tail of the queue
    EXPECT_EQ(true, parallelExecution);

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, ASYNCHRONOUS_TDGS_NOWAIT)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    bool volatile firstFinished = false;
    bool parallelCreation = true;
    #pragma omp parallel shared(x,y, parallelCreation)
    #pragma omp single
    {
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) nowait
      #endif
      {
        for (int i=0; i<NUM_ITER / 2; i++)
          saxpy(x, y);

        #pragma omp task
        {
          sleep(2);
          firstFinished = true;
        }
      }

      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) nowait
      #endif
      {
        if(firstFinished)
            parallelCreation = false;

        for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
          saxpy(x, y);
      }
    }

    EXPECT_EQ(true, parallelCreation);
    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, SYNCHRONOUS_TDGS_DEFAULT)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    bool volatile firstFinished = false;
    bool parallelCreation = true;
    #pragma omp parallel shared(x,y, parallelCreation)
    #pragma omp single
    {
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) 
      #endif
      {
        for (int i=0; i<NUM_ITER / 2; i++)
          saxpy(x, y);

        #pragma omp task
        {
          sleep(1);
          firstFinished = true;
        }
      }

      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) 
      #endif
      {
        if(firstFinished)
            parallelCreation = false;

        for (int i= NUM_ITER / 2; i<NUM_ITER; i++)
          saxpy(x, y);
      }
    }

    EXPECT_EQ(false, parallelCreation);
    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, SYNCHRONOUS_DYNAMIC_TDG_CREATION)
{
    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    bool volatile firstFinished = false;
    bool parallelCreation = true;
    bool parallelExecution = true;
    #pragma omp parallel shared(x,y, parallelCreation, parallelExecution)
    #pragma omp single
    {
      for (int j= 0; j < 2 ; j++) {
      firstFinished = false;
      #ifdef TDG
      #pragma omp taskgraph tdg_type(dynamic) nowait
      #endif
      {
        for (int i=0; i<NUM_ITER / 2; i++)
          saxpy(x, y);

        #pragma omp task
        {
          sleep(1);
          firstFinished = true;
        }
      }
            
      #ifdef TDG
      #pragma omp taskgraph tdg_type(static) 
      #endif
      {
        if( j== 0 && firstFinished)
            parallelCreation = false;

        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }
    }
    }

    EXPECT_EQ(false, parallelCreation);
    //The parallel execution works because main thread starts executing tasks from the tail instead the head once it finishes the creation, and the task from the second taskgraph is the tail of the queue
    EXPECT_EQ(true, parallelExecution);
    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*(NUM_ITER)+1,y[i]);

    free(x);
    free(y);
}


TEST(AXPY, TASK_REPLICATION_VANILLA)
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
      int nreplicas_detected = 0;
      int dummy = 2;

      for (int i=0; i<NUM_ITER; i++) {
        {
          #pragma omp task shared(dummy, nreplicas_detected) replicated(3, dummy, isEqual)
          {
              dummy++;
              #pragma omp atomic
              nreplicas_detected++;
          }
          saxpy(x, y);
        }
      }
      EXPECT_EQ(2+NUM_ITER, dummy);
      EXPECT_EQ(NUM_ITER*4, nreplicas_detected);
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*NUM_ITER+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, TASK_REPLICATION_TDG)
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
      int nreplicas_detected = 0;
      int dummy = 2;

      for (int i=0; i<NUM_ITER; i++) {
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic)
        #endif
        {
          #pragma omp task shared(dummy, nreplicas_detected) replicated(3, dummy, isEqual)
          {
              dummy++;
              #pragma omp atomic
              nreplicas_detected++;
          }
          saxpy(x, y);
        }
      }
      EXPECT_EQ(2+NUM_ITER, dummy);
      EXPECT_EQ(NUM_ITER*4, nreplicas_detected);
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*NUM_ITER+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, TASK_REPLICATION_SPATIAL)
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
      int nreplicas_detected = 0;
      int dummy = 2;

      for (int i=0; i<NUM_ITER; i++) {
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic)
        #endif
        {
          #pragma omp task shared(dummy, nreplicas_detected) replicated(3, dummy, isEqual, spatial)
          {
              dummy++;
              #pragma omp atomic
              nreplicas_detected++;
          }
          saxpy(x, y);
        }
      }
      EXPECT_EQ(2+NUM_ITER, dummy);
      EXPECT_EQ(NUM_ITER*4, nreplicas_detected);
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*NUM_ITER+1,y[i]);

    free(x);
    free(y);
}

TEST(AXPY, TASK_REPLICATION_TEMPORAL)
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
      int nreplicas_detected = 0;
      int dummy = 2;

      for (int i=0; i<NUM_ITER; i++) {
        #ifdef TDG
        #pragma omp taskgraph tdg_type(dynamic)
        #endif
        {
          #pragma omp task shared(dummy, nreplicas_detected) replicated(3, dummy, isEqual, temporal)
          {
              dummy++;
              nreplicas_detected++;
          }
          saxpy(x, y);
        }
      }
      EXPECT_EQ(2+NUM_ITER, dummy);
      EXPECT_EQ(NUM_ITER*4, nreplicas_detected);
    }

    for (int i=0; i<NUM_ITER; i++)
        EXPECT_EQ(x[i]*NUM_ITER+1,y[i]);

    free(x);
    free(y);
}

int main (int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}