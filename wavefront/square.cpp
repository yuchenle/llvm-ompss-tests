// Part of Taskgraph directive tests. Verifying the correct
// behaviors of Taskgraph in different scenarios, as defined in RESULT.txt
//
// Using *wavefront* benchmark, with task dependencies

#include "timer.h"
#include "gtest/gtest.h"
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>

#ifndef DIM
#define DIM 2048
#endif

#ifndef N
#define N 8
#endif

#define NUM_ITER 8
#define BS (DIM / N)

unsigned long int square[N][N][BS][BS];
unsigned long int square1[N][N][BS][BS];
unsigned long int square2[N][N][BS][BS];
unsigned long int square3[N][N][BS][BS];

#define SIZE (sizeof(square) / sizeof(long long))

unsigned long vanilla_result_1 = 0;     // vanilla_result after 2 iterations
unsigned long vanilla_result_2 = 0;     // vanilla_result after 2 iterations
unsigned long vanilla_result_4 = 0;     // vanilla_result after 4 iterations
unsigned long vanilla_result_8 = 0;     // vanilla_result after 8 iterations

void init_matrix() {
  int i, j, x, y;
  for (i = 0; i < N; ++i) {
    for (j = 0; j < N; ++j) {
      for (x = 0; x < BS; x++) {
        for (y = 0; y < BS; y++) {
          square[i][j][x][y] = 2;
          square1[i][j][x][y] = 2;
          square2[i][j][x][y] = 2;
          square3[i][j][x][y] = 2;

        }
      }
    }
  }
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

void sequential(int i, int j, unsigned long square[N][N][BS][BS]) {
  int x, y;

  /*
   * Leftmost upper item. All the neighbors are in different blocks
   */
  if (i > 0 && j > 0) {                       // _________
    square[i][j][0][0] +=                     // | | # | |
        square[i][j - 1][0][BS - 1] +         // ----#----
        square[i - 1][j][BS - 1][0] +         // | |3#2| |
        square[i - 1][j - 1][BS - 1][BS - 1]; // ____#____
  }                                           // | |1#o| |
                                              // ----#----
                                              // | | # | |
                                              // ____#____
  /*
   * First column of items. Left neighbors are in the left block
   */
  if (j > 0) {                             // _________
    for (y = 1; y < BS; y++) {             // | | # | |
      square[i][j][y][0] +=                // ----#-----
          square[i][j - 1][y][BS - 1] +    // | | # | |
          square[i][j][y - 1][0] +         // ____#____
          square[i][j - 1][y - 1][BS - 1]; // | |3#2| |
    }                                      // ----#----
  }                                        // | |1#o| |
                                           // ____#____
  /*
   * First row of items. Upper neighbors are in the upper block
   */
  if (i > 0) {
    for (x = 1; x < BS; x++) {             // _________
      square[i][j][0][x] +=                // | | # | |
          square[i][j][0][x - 1] +         // ----#----
          square[i - 1][j][BS - 1][x] +    // | | #3|2|
          square[i - 1][j][BS - 1][x - 1]; // ____#____
    }                                      // | | #1|o|
  }                                        // ----#----
                                           // | | # | |
                                           // ____#_____
  /*
   * Remaining items. All the neighbors are in the same block
   */
  for (x = 1; x < BS; x++) {          // _________
    for (y = 1; y < BS; y++) {        // |3|1# | |
      square[i][j][y][x] +=           // ----#----
          square[i][j][y][x - 1] +    // |2|o# | |
          square[i][j][y - 1][x] +    // ____#____
          square[i][j][y - 1][x - 1]; // | | # | |
    }                                 // ----#----
  }                                   // | | # | |
}

void wavefront(unsigned long square[N][N][BS][BS])  {
  int i, j;
  for (int i = 0; i < N; ++i) {
    for (int j = 0; j < N; ++j) {
      if (j == 0 && i == 0) {
        #pragma omp task depend(inout : square[i][j])
        { sequential(i, j, square); }
      } else if (i == 0) {
        #pragma omp task depend(in : square[i][j - 1]) depend(inout : square[i][j])
        { sequential(i, j, square); }
      } else if (j == 0) {
        #pragma omp task depend(in : square[i - 1][j]) depend(inout : square[i][j])
        { sequential(i, j, square); }
      } else {
        #pragma omp task depend(in : square[i - 1][j])       \
                          depend(in : square[i][j - 1])      \
                          depend(in : square[i - 1][j - 1])  \
                          depend(inout : square[i][j])
        { sequential(i, j, square); }
      } // final else
    }   // j
  }     // i
}

void vanilla_result_computation() {
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {

    for (int iter = 0; iter < NUM_ITER; iter++) {
      wavefront(square);
      #pragma omp taskwait
      if (iter == 0 && vanilla_result_1 == 0)
        vanilla_result_1 = square[N - 1][N - 1][BS - 1][BS - 1];
      if (iter == 1 && vanilla_result_2 == 0)
        vanilla_result_2 = square[N - 1][N - 1][BS - 1][BS - 1];
      if (iter == 3 && vanilla_result_4 == 0)
        vanilla_result_4 = square[N - 1][N - 1][BS - 1][BS - 1];
    }
  }
  if (vanilla_result_8 == 0)
    vanilla_result_8 = square[N - 1][N - 1][BS - 1][BS - 1]; 
}

TEST(WAVEFRONT, DYNAMIC_TDG){
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int iter = 0; iter < NUM_ITER; iter++) {
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }
  }
  
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]) << "Dynamic TDG result is diffrent from vanilla result";
}


TEST(WAVEFRONT, STATIC_TDG) {
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int iter = 0; iter < NUM_ITER; iter++) {
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }
  }
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]) << "Static TDG result is diffrent from vanilla result";
}


TEST(WAVEFRONT, MULTIPLE_DYNAMIC_TDG){
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int iter = 0; iter < NUM_ITER/2; iter++) {
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }

    for (int iter = NUM_ITER/2; iter < NUM_ITER; iter++) {
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }
  } // single
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, RERECORDING){
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int iter = 0; iter < NUM_ITER; iter++) {
      #pragma omp taskgraph tdg_type(dynamic) if(iter == NUM_ITER/2)
      {
        if (iter == NUM_ITER/2) {
          // not to record
          init_matrix();
        }
        wavefront(square);
      }
    }
  } // single

  EXPECT_EQ(vanilla_result_4, square[N - 1][N - 1][BS - 1][BS - 1]);
}


TEST(WAVEFRONT, MULTIPLE_STATIC_TDG) {
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int iter = 0; iter < NUM_ITER/2; iter++) {
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }

    for (int iter = NUM_ITER/2; iter < NUM_ITER; iter++) {
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }
  } // single
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}


TEST(WAVEFRONT, ONE_STATIC_ONE_DYNAMIC) {
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int iter = 0; iter < NUM_ITER/2; iter++) {
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }

    for (int iter = NUM_ITER/2; iter < NUM_ITER; iter++) {
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }
  } // single
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, MULTIPLE_STATIC_ONE_DYNAMIC) {
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int i = 0; i < NUM_ITER / 4; i++) {
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }

    for (int i = NUM_ITER / 4; i < NUM_ITER / 2; i++){
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }

    for (int i = NUM_ITER / 2; i < NUM_ITER; i++) {
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }
  }

  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}


TEST(WAVEFRONT, ONE_STATIC_MULTIPLE_DYNAMIC)
{
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int i = 0; i < NUM_ITER / 4; i++) {
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }

    for (int i = NUM_ITER / 4; i < NUM_ITER / 2; i++){
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }

    for (int i = NUM_ITER / 2; i < NUM_ITER; i++) {
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }
  }

  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, MULTIPLE_STATIC_MULTIPLE_DYNAMIC)
{
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    for (int i = 0; i < NUM_ITER / 4; i++) {
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }

    for (int i = NUM_ITER / 4; i < NUM_ITER / 2; i++){
      #pragma omp taskgraph tdg_type(static)
      wavefront(square);
    }

    for (int i = NUM_ITER / 2; i <  3 * NUM_ITER / 4; i++) {
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }

    for (int i = 3 * NUM_ITER / 4; i < NUM_ITER; i++) {
      #pragma omp taskgraph tdg_type(dynamic)
      wavefront(square);
    }
  }

  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, PARALLEL_CREATION_ONE_STATIC_ONE_DYNAMIC)
{
  bool parallelCreation = false;
  bool volatile firstExecuting = false;
  bool volatile secondExecuting = false;

  init_matrix();

  #pragma omp parallel shared(parallelCreation,firstExecuting, secondExecuting)
  {
    int thid = omp_get_thread_num();
    if (thid == 0) {
      for (int i = 0; i < NUM_ITER / 2; i++) {
        #pragma omp taskgraph tdg_type(static) nowait
        {
          #pragma omp critical
          {
            firstExecuting = true;
            if(secondExecuting)
              parallelCreation = true;
          }
          //Sleep to force concurrency
          sleep(1);

          wavefront(square);

          firstExecuting = false;
        }
      }
    } else if (thid == 1) {
      for (int i = NUM_ITER / 2; i < NUM_ITER; i++) {
        #pragma omp taskgraph tdg_type(dynamic) nowait
        {
          #pragma omp critical
          {
            secondExecuting = true;

            if(firstExecuting)
              parallelCreation = true;
          }
          //Sleep to force concurrency
          sleep(1);

          wavefront(square1);

          secondExecuting = false;
        }
      }
    }
  }

  EXPECT_EQ(true, parallelCreation) << "Two Taskgraphs were not created in parallel";
  EXPECT_EQ(vanilla_result_4, square[N - 1][N - 1][BS - 1][BS - 1]) << "Value of square is different from vanilla OpenMP";
  EXPECT_EQ(vanilla_result_4, square1[N - 1][N - 1][BS - 1][BS - 1]) << "Value of square1 is different from vanilla OpenMP";

}

TEST(WAVEFRONT, PARALLEL_CREATION_MULTIPLE_STATIC_ONE_DYNAMIC)
{
    bool parallelCreation = false;
    bool volatile firstExecuting = false;
    bool volatile secondExecuting = false;
    bool volatile thirdExecuting = false;

    init_matrix();

    #pragma omp parallel shared(parallelCreation,firstExecuting, secondExecuting)
    {
      int thid = omp_get_thread_num();
      if (thid == 0) {
        for (int i = 0; i < NUM_ITER/4; i++) {
          #pragma omp taskgraph tdg_type(static) nowait
          {
            #pragma omp critical
            {
              firstExecuting = true;
              if (secondExecuting && thirdExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square);

            firstExecuting = false;
          }
        }
      } else if (thid == 1) {
        for (int i = NUM_ITER/4; i < NUM_ITER/2; i++) {
          #pragma omp taskgraph tdg_type(static) nowait
          {
            #pragma omp critical
            {
              secondExecuting = true;

              if (firstExecuting && thirdExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square1);

            secondExecuting = false;
          }
        }
      } else if (thid == 2) {
        for (int i = NUM_ITER/2; i < NUM_ITER; i++) {
          #pragma omp taskgraph tdg_type(dynamic) nowait
          {
            #pragma omp critical
            {
              thirdExecuting = true;

              if (secondExecuting && firstExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square2);

            thirdExecuting = false;
          }
        }
      }
    }

    EXPECT_EQ(true, parallelCreation);
    EXPECT_EQ(vanilla_result_2, square[N - 1][N - 1][BS - 1][BS - 1]);
    EXPECT_EQ(vanilla_result_2, square1[N - 1][N - 1][BS - 1][BS - 1]);
    EXPECT_EQ(vanilla_result_4, square2[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, PARALLEL_CREATION_ONE_STATIC_MULTIPLE_DYNAMIC)
{
    bool parallelCreation = false;
    bool volatile firstExecuting = false;
    bool volatile secondExecuting = false;
    bool volatile thirdExecuting = false;

    init_matrix();

    #pragma omp parallel shared(parallelCreation,firstExecuting, secondExecuting)
    {
      int thid = omp_get_thread_num();
      if (thid == 0) {
        for (int i = 0; i < NUM_ITER/4; i++) {
          #pragma omp taskgraph tdg_type(static) nowait
          {
            #pragma omp critical
            {
              firstExecuting = true;
              if (secondExecuting && thirdExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square);

            firstExecuting = false;
          }
        }
      } else if (thid == 1) {
        for (int i = NUM_ITER/4; i < NUM_ITER/2; i++) {
          #pragma omp taskgraph tdg_type(dynamic) nowait
          {
            #pragma omp critical
            {
              secondExecuting = true;

              if (firstExecuting && thirdExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square1);

            secondExecuting = false;
          }
        }
      } else if (thid == 2) {
        for (int i = NUM_ITER/2; i < NUM_ITER; i++) {
          #pragma omp taskgraph tdg_type(dynamic) nowait
          {
            #pragma omp critical
            {
              thirdExecuting = true;

              if (secondExecuting && firstExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square2);

            thirdExecuting = false;
          }
        }
      }
    }

    EXPECT_EQ(true, parallelCreation);
    EXPECT_EQ(vanilla_result_2,square[N - 1][N - 1][BS - 1][BS - 1]);
    EXPECT_EQ(vanilla_result_2,square1[N - 1][N - 1][BS - 1][BS - 1]);
    EXPECT_EQ(vanilla_result_4,square2[N - 1][N - 1][BS - 1][BS - 1]);
}


TEST(WAVEFRONT, PARALLEL_CREATION_MULTIPLE_STATIC_MULTIPLE_DYNAMIC)
{
    bool parallelCreation = false;
    bool volatile firstExecuting = false;
    bool volatile secondExecuting = false;
    bool volatile thirdExecuting = false;
    bool volatile fourthExecuting = false;

    init_matrix();

    #pragma omp parallel shared(parallelCreation,firstExecuting, secondExecuting)
    {
      int thid = omp_get_thread_num();
      if (thid == 0) {
        for (int i = 0; i < NUM_ITER/4; i++) {
          #pragma omp taskgraph tdg_type(static) nowait
          {
            #pragma omp critical
            {
              firstExecuting = true;
              if (secondExecuting && thirdExecuting && fourthExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square);

            firstExecuting = false;
          }
        }
      } else if (thid == 1) {
        for (int i = NUM_ITER/4; i < NUM_ITER/2; i++) {
          #pragma omp taskgraph tdg_type(static) nowait
          {
            #pragma omp critical
            {
              secondExecuting = true;

              if (firstExecuting && thirdExecuting && fourthExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square1);

            secondExecuting = false;
          }
        }
      } else if (thid == 2) {
        for (int i = NUM_ITER/2; i < NUM_ITER/4 * 3; i++) {
          #pragma omp taskgraph tdg_type(dynamic) nowait
          {
            #pragma omp critical
            {
              thirdExecuting = true;

              if (secondExecuting && firstExecuting && fourthExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square2);

            thirdExecuting = false;
          }
        }
      } else if (thid == 4) {
        for (int i = 3 * NUM_ITER/4; i < NUM_ITER; i++) {
          #pragma omp taskgraph tdg_type(dynamic) nowait
          {
            #pragma omp critical
            {
              fourthExecuting = true;

              if (secondExecuting && firstExecuting && thirdExecuting)
                parallelCreation = true;
            }
            // Sleep to force concurrency
            sleep(1);

            wavefront(square3);

            fourthExecuting = false;
          }
        }
      }
    }

    EXPECT_EQ(true, parallelCreation);
    EXPECT_EQ(vanilla_result_2, square[N - 1][N - 1][BS - 1][BS - 1]);
    EXPECT_EQ(vanilla_result_2, square1[N - 1][N - 1][BS - 1][BS - 1]);
    EXPECT_EQ(vanilla_result_2, square2[N - 1][N - 1][BS - 1][BS - 1]);
    EXPECT_EQ(vanilla_result_2, square3[N - 1][N - 1][BS - 1][BS - 1]);
}


TEST(WAVEFRONT, PARALLEL_EXECUTION_ONE_STATIC_ONE_DYNAMIC)
{
    bool volatile firstFinished = false;
    bool parallelExecution = true;

    init_matrix();

    #pragma omp parallel shared(parallelExecution)
    #pragma omp single
    {
      for (int j= 0; j < 2 ; j++) {
        firstFinished = false;
        #pragma omp taskgraph tdg_type(dynamic) nowait
        {
          for (int i=0; i<NUM_ITER / 2; i++)
            wavefront(square);

          #pragma omp task
          {
            sleep(1);
            firstFinished = true;
          }
        }

        #pragma omp taskgraph tdg_type(static)
        {
          #pragma omp task
          {
            if(j == 1 && firstFinished)
              parallelExecution = false;
          }
        }
      }
    }

    //The parallel execution works because main thread starts executing tasks from the tail instead the head once it finishes the creation, and the task from the second taskgraph is the tail of the queue
    EXPECT_EQ(true, parallelExecution);
    EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, PARALLEL_EXECUTION_MULTIPLE_STATIC_ONE_DYNAMIC)
{
    bool volatile firstFinished = false;
    bool parallelExecution = true;

    init_matrix();

    #pragma omp parallel shared(parallelExecution)
    #pragma omp single
    {
      for (int j= 0; j < 2 ; j++) {
        firstFinished = false;
        #pragma omp taskgraph tdg_type(dynamic) nowait
        {
          for (int i=0; i<NUM_ITER / 2; i++)
            wavefront(square);
          
          #pragma omp task
          {
            sleep(1);
            firstFinished = true;
          }
        }
        #pragma omp taskgraph tdg_type(static)
        {
          #pragma omp task
          {
            if( j== 1 && firstFinished)
              parallelExecution = false;
          }
        }
        #pragma omp taskgraph tdg_type(static)
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
    EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, PARALLEL_EXECUTION_ONE_STATIC_MULTIPLE_DYNAMIC)
{
    bool volatile firstFinished = false;
    bool parallelExecution = true;

    init_matrix();

    #pragma omp parallel shared(parallelExecution)
    #pragma omp single
    {
      for (int j= 0; j < 8; j++) {
        firstFinished = false;
        #pragma omp taskgraph tdg_type(static) nowait
        {
          // #pragma omp task
          // {
          //   printf("starting, num_iterations = %d, %d, %d\n", NUM_ITER, N, BS);
          // }
          for (int i = 0; i < NUM_ITER / 8; i++)
            wavefront(square);

          #pragma omp task
          {
            sleep(1);
            firstFinished = true;
            // printf("ending\n");
          }
        }
        #pragma omp taskgraph tdg_type(dynamic)
        {
          #pragma omp task
          {
            if( j== 1 && firstFinished)
              parallelExecution = false;
          }
        }
        #pragma omp taskgraph tdg_type(dynamic)
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
    EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}


TEST(WAVEFRONT, PARALLEL_EXECUTION_MULTIPLE_STATIC_MULTIPLE_DYNAMIC)
{
  bool volatile firstFinished = false;
  bool parallelExecution = true;
  init_matrix();
  #pragma omp parallel shared(parallelExecution)
  #pragma omp single
  {
    for (int j= 0; j < 8 ; j++) {
      firstFinished = false;
      #pragma omp taskgraph tdg_type(static) nowait
      {
        for (int i=0; i<NUM_ITER / 8; i++)
          wavefront(square);

        #pragma omp task
        {
          sleep(1);
          firstFinished = true;
        }
      }
      #pragma omp taskgraph tdg_type(dynamic)
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }
      #pragma omp taskgraph tdg_type(dynamic)
      {
        #pragma omp task
        {
          if( j== 1 && firstFinished)
            parallelExecution = false;
        }
      }
      #pragma omp taskgraph tdg_type(static)
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
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}


TEST(WAVEFRONT, ASYNCHRONOUS_TDGS_NOWAIT)
{
  bool volatile firstFinished = false;
  bool parallelCreation = true;

  init_matrix();

  #pragma omp parallel shared(parallelCreation)
  #pragma omp single
  {
    #pragma omp taskgraph tdg_type(static) nowait
    {
      for (int i = 0; i < NUM_ITER / 2; i++)
        wavefront(square);

      #pragma omp task
      {
        sleep(2);
        firstFinished = true;
      }
    }

    #pragma omp taskgraph tdg_type(dynamic) nowait
    {
      if(firstFinished)
          parallelCreation = false;

      for (int i = NUM_ITER / 2; i < NUM_ITER; i++)
        wavefront(square);
    }
  }
  EXPECT_EQ(true, parallelCreation);
}

TEST(WAVEFRONT, SYNCHRONOUS_TDGS_DEFAULT)
{
  bool volatile firstFinished = false;
  bool parallelCreation = true;

  init_matrix();

  #pragma omp parallel shared(parallelCreation)
  #pragma omp single
  {
    #pragma omp taskgraph tdg_type(static)
    {
      for (int i = 0; i < NUM_ITER / 2; i++)
        wavefront(square);

      #pragma omp task
      {
        sleep(1);
        firstFinished = true;
      }
    }

    #pragma omp taskgraph tdg_type(dynamic)
    {
      if(firstFinished)
          parallelCreation = false;

      for (int i = NUM_ITER / 2; i < NUM_ITER; i++)
        wavefront(square);
    }
  }
  EXPECT_EQ(false, parallelCreation);
}


TEST(WAVEFRONT, SYNCHRONOUS_DYNAMIC_TDG_CREATION)
{
  bool volatile firstFinished = false;
  bool parallelCreation = true;
  bool parallelExecution = true;

  init_matrix();

  #pragma omp parallel shared(parallelCreation, parallelExecution)
  #pragma omp single
  {
    for (int j= 0; j < NUM_ITER ; j++) {
      firstFinished = false;
      #pragma omp taskgraph tdg_type(dynamic) nowait
      {
        wavefront(square);

        #pragma omp task
        {
          sleep(1);
          firstFinished = true;
        }
      }

      #pragma omp taskgraph tdg_type(static)
      {
        if( j== 0 && firstFinished)
            parallelCreation = false;

        #pragma omp task
        {
          if( j >= 1 && firstFinished)
            parallelExecution = false;
        }
      }
    }
  }

  EXPECT_EQ(false, parallelCreation);
  //The parallel execution works because main thread starts executing tasks from the tail instead the head once it finishes the creation, and the task from the second taskgraph is the tail of the queue
  EXPECT_EQ(true, parallelExecution);
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, TASK_REPLICATION_VANILLA)
{
  init_matrix();
  
  int one = 1;
  #pragma omp parallel
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
        wavefront(square);
      }
    }
    EXPECT_EQ(2+NUM_ITER, dummy);
    EXPECT_EQ(NUM_ITER*4, nreplicas_detected);
  }

  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}



TEST(WAVEFRONT, TASK_REPLICATION_TDG)
{
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    int nreplicas_detected = 0;
    int dummy = 2;

    for (int i=0; i<NUM_ITER; i++) {
      #pragma omp taskgraph tdg_type(dynamic)
      {
        wavefront(square);
        #pragma omp task shared(dummy, nreplicas_detected) replicated(3, dummy, isEqual)
        {
          dummy++;
          #pragma omp atomic
          nreplicas_detected++;
        }
      }
    }
    EXPECT_EQ(2+NUM_ITER, dummy);
    EXPECT_EQ(NUM_ITER*4, nreplicas_detected);
  }
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, TASK_REPLICATION_SPATIAL)
{
  init_matrix();
  #pragma omp parallel
  #pragma omp single
  {
    int nreplicas_detected = 0;
    int dummy = 2;

    for (int i=0; i<NUM_ITER; i++) {
      #pragma omp taskgraph tdg_type(dynamic)
      {
        #pragma omp task shared(dummy, nreplicas_detected) replicated(3, dummy, isEqual, spatial)
        {
            dummy++;
            #pragma omp atomic
            nreplicas_detected++;
        }
        wavefront(square);
      }
    }
    EXPECT_EQ(2+NUM_ITER, dummy);
    EXPECT_EQ(NUM_ITER*4, nreplicas_detected);
  }
  EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

TEST(WAVEFRONT, TASK_REPLICATION_TEMPORAL)
{
    init_matrix();

    #pragma omp parallel
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
          wavefront(square);
        }
      }
      EXPECT_EQ(2+NUM_ITER, dummy);
      EXPECT_EQ(NUM_ITER*4, nreplicas_detected);
    }
    EXPECT_EQ(vanilla_result_8, square[N - 1][N - 1][BS - 1][BS - 1]);
}

int main(int argc, char **argv) {
  vanilla_result_computation();
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}