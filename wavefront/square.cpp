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

#define NUM_ITER 4
#define BS (DIM / N)

unsigned long int square[N][N][BS][BS];
#define SIZE (sizeof(square) / sizeof(long long))

long vanilla_result = 0;

void init_matrix() {
  int i, j, x, y;
  for (i = 0; i < N; ++i) {
    for (j = 0; j < N; ++j) {
      for (x = 0; x < BS; x++) {
        for (y = 0; y < BS; y++) {
          square[i][j][x][y] = 2;
        }
      }
    }
  }
}

void sequential(int i, int j) {
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

long wavefront(void) {
  int i, j;
  for (int i = 0; i < N; ++i) {
    for (int j = 0; j < N; ++j) {
      if (j == 0 && i == 0) {
        #pragma omp task depend(inout : square[i][j])
        { sequential(i, j); }
      } else if (i == 0) {
        #pragma omp task depend(in : square[i][j - 1]) depend(inout : square[i][j])
        { sequential(i, j); }
      } else if (j == 0) {
        #pragma omp task depend(in : square[i - 1][j]) depend(inout : square[i][j])
        { sequential(i, j); }
      } else {
        #pragma omp task depend(in : square[i - 1][j])       \
                          depend(in : square[i][j - 1])      \
                          depend(in : square[i - 1][j - 1])  \
                          depend(inout : square[i][j])
        { sequential(i, j); }
      } // final else
    }   // j
  }     // i
  return square[N - 1][N - 1][BS - 1][BS - 1];
}

TEST(WAVEFRONT, DYNAMIC_TDG) {
  long res=0, res_tdg=0;
  #pragma omp parallel
  #pragma omp single
  {
    init_matrix();

    for (int iter = 0; iter < NUM_ITER; iter++) {
      res += wavefront();
      #pragma omp taskwait
    }
    
    if (vanilla_result == 0)
      vanilla_result = res;

    init_matrix();

    for (int iter = 0; iter < NUM_ITER; iter++) {
      #pragma omp taskgraph tdg_type(dynamic)
      res_tdg += wavefront();
    }

    EXPECT_EQ(vanilla_result, res_tdg) << "Dynamic TDG result is diffrent from vanilla result";
  } // single
}

TEST(WAVEFRONT, STATIC_TDG) {

  EXPECT_NE(vanilla_result, 0) << "vanilla result is 0 but it should have been correctly set previously";
  long res_tdg=0;
  #pragma omp parallel
  #pragma omp single
  {
    init_matrix();

    for (int iter = 0; iter < NUM_ITER; iter++) {
      #pragma omp taskgraph tdg_type(static)
      wavefront();
    }

    EXPECT_EQ(vanilla_result, res_tdg) << "Static TDG result is diffrent from vanilla result";
  } // single
}

int main(int argc, char **argv) {
  testing::InitGoogleTest(&argc, argv);
  return RUN_ALL_TESTS();
}