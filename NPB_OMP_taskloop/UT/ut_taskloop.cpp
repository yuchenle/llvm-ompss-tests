#include <gtest/gtest.h>

#define NUM_ITERS 4
#define N 16384
#define NUM_TASKS 200

int vec_x[N];
int vec_y[N];

void init() {
  #pragma omp parallel for
  for (int i = 0; i < N; ++i) {
    vec_x[i] = 2;
    vec_y[i] = 1;
  }
}

TEST(UT_TASKLOOP, DYNAMIC_TDG) {
  
  init();
  #pragma omp parallel
  #pragma omp single
  {
    for (int iter = 0; iter < NUM_ITERS; ++iter) {
      #pragma omp taskgraph tdg_type(dynamic)
      #pragma omp taskloop num_tasks(NUM_TASKS)
      for (int i = 0; i < N; ++i) {
        vec_y[i] += vec_x[i];
      }
    }
  }

  for (int i = 0; i < N; ++i) {
    EXPECT_EQ(vec_y[i], 1+NUM_ITERS*2);
  }
}

TEST(UT_TASKLOOP, REDUCTION) {
  init();
  int sum = 0;
  #pragma omp parallel
  #pragma omp single
  {
    for (int iter = 0; iter < NUM_ITERS; ++iter) {
      #pragma omp taskgraph tdg_type(dynamic)
      #pragma omp taskloop reduction(+:sum) num_tasks(NUM_TASKS)
      for (int i = 0; i < N; ++i) {
        vec_y[i] += vec_x[i];
        sum += vec_y[i];
      }
    }
  }

  for (int i = 0; i < N; ++i) {
    EXPECT_EQ(vec_y[i], 1+NUM_ITERS*2);
  }

  int expected_value = 0;
  for (int i = 0; i < NUM_ITERS; ++i)
    expected_value += (vec_y[0] - vec_x[0] * i) * N;

  EXPECT_EQ(sum, expected_value);
}

int main(int argc, char **argv) {
	testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}