
#include "gtest/gtest.h"
#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#include <unistd.h>

int a_global = 3;
double b_global = 3.2;
void *c_global = &a_global;
int d_global[2] = {2,2};
double e_global[4][4];
int f_global[2][2][2];
struct g_global_type {
    int g_1;
    double g_2;
    void *g_3;
    int g_4[2];
};

struct g_global_type g_global = {.g_1 = a_global, .g_2 = b_global, .g_3 = c_global, .g_4 = {2,2}};

#define NUM_ITER 2


TEST(PREALLOC, FIRSTPRIVATE_GLOBAL) {

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_global[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_global[j][z][y] = 2;

#pragma omp parallel
#pragma omp single
    {
        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
#pragma omp task firstprivate(a_global, b_global, c_global, d_global,          \
                                  e_global, f_global, g_global)
         {
            int local;
            a_global++;
            b_global = 5.2;
            c_global = &local;

            for (int j = 0; j < 2; j++)
              d_global[j] = 3;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_global[j][z] = 6.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y] = 7;

            g_global = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_global, 4);
            EXPECT_EQ(b_global, 5.2);
            EXPECT_EQ(c_global, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_global[j], 3);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_global[j][z], 6.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 7);

            EXPECT_EQ(g_global.g_1, 9);
            EXPECT_EQ(g_global.g_2, 3.6);
            EXPECT_EQ(g_global.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_global.g_4[j], 11);
         }

#pragma omp task firstprivate(a_global, b_global, c_global, d_global,          \
                                  e_global, f_global, g_global)
         {
            int local;
            a_global++;
            b_global = 5.3;
            c_global = &local;

            for (int j = 0; j < 2; j++)
              d_global[j] = 4;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_global[j][z] = 7.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y] = 8;


            g_global = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_global, 4);
            EXPECT_EQ(b_global, 5.3);
            EXPECT_EQ(c_global, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_global[j], 4);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_global[j][z], 7.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 8);

            EXPECT_EQ(g_global.g_1, 9);
            EXPECT_EQ(g_global.g_2, 3.6);
            EXPECT_EQ(g_global.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_global.g_4[j], 11);
         }
        }

        EXPECT_EQ(a_global, 3);
        EXPECT_EQ(b_global, 3.2);
        EXPECT_EQ(c_global, &a_global);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(d_global[j], 2);

        for (int j = 0; j < 4; j++)
         for (int z = 0; z < 4; z++)
            EXPECT_EQ(e_global[j][z], 4.1);

        for (int j = 0; j < 2; j++)
         for (int z = 0; z < 2; z++)
            for (int y = 0; y < 2; y++)
              EXPECT_EQ(f_global[j][z][y], 2);

        EXPECT_EQ(g_global.g_1, a_global);
        EXPECT_EQ(g_global.g_2, b_global);
        EXPECT_EQ(g_global.g_3, c_global);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(g_global.g_4[j], 2);
    }
}


TEST(PREALLOC, FIRSTPRIVATE_LOCAL) {

    int a_local = 3;
    double b_local = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};
    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_local[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_local[j][z][y] = 2;

#pragma omp parallel
#pragma omp single
    {
        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
#pragma omp task firstprivate(a_local, b_local, c_local, d_local,          \
                                  e_local, f_local, g_local)
         {
            int local;
            a_local++;
            b_local = 5.2;
            c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j] = 3;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z] = 6.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_local[j][z][y] = 7;

            g_local = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_local, 4);
            EXPECT_EQ(b_local, 5.2);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 3);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 6.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_local[j][z][y], 7);

            EXPECT_EQ(g_local.g_1, 9);
            EXPECT_EQ(g_local.g_2, 3.6);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 11);
         }

#pragma omp task firstprivate(a_local, b_local, c_local, d_local,          \
                                  e_local, f_local, g_local)
         {
            int local;
            a_local++;
            b_local = 5.3;
            c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j] = 4;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z] = 7.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_local[j][z][y] = 8;


            g_local = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_local, 4);
            EXPECT_EQ(b_local, 5.3);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 4);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 7.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_local[j][z][y], 8);

            EXPECT_EQ(g_local.g_1, 9);
            EXPECT_EQ(g_local.g_2, 3.6);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 11);
         }
        }

        EXPECT_EQ(a_local, 3);
        EXPECT_EQ(b_local, 3.2);
        EXPECT_EQ(c_local, &a_local);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(d_local[j], 2);

        for (int j = 0; j < 4; j++)
         for (int z = 0; z < 4; z++)
            EXPECT_EQ(e_local[j][z], 4.1);

        for (int j = 0; j < 2; j++)
         for (int z = 0; z < 2; z++)
            for (int y = 0; y < 2; y++)
              EXPECT_EQ(f_local[j][z][y], 2);

        EXPECT_EQ(g_local.g_1, a_local);
        EXPECT_EQ(g_local.g_2, b_local);
        EXPECT_EQ(g_local.g_3, c_local);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(g_local.g_4[j], 2);
    }
}


TEST(PREALLOC, FIRSTPRIVATE_MIX) {

    int a_local = 3;
    double b_local = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};
    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_local[j][z] = 4.1;

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_global[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_local[j][z][y] = 2;

#pragma omp parallel
#pragma omp single
    {
        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
#pragma omp task firstprivate(a_local, b_global, c_local, d_local,          \
                                  e_global, f_local, g_global)
         {
            int local;
            a_local++;
            b_global = 5.2;
            c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j] = 3;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_global[j][z] = 6.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_local[j][z][y] = 7;

            g_global = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_local, 4);
            EXPECT_EQ(b_global, 5.2);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 3);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_global[j][z], 6.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_local[j][z][y], 7);

            EXPECT_EQ(g_global.g_1, 9);
            EXPECT_EQ(g_global.g_2, 3.6);
            EXPECT_EQ(g_global.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_global.g_4[j], 11);
         }
        }

        EXPECT_EQ(a_local, 3);
        EXPECT_EQ(b_global, 3.2);
        EXPECT_EQ(c_local, &a_local);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(d_local[j], 2);

        for (int j = 0; j < 4; j++)
         for (int z = 0; z < 4; z++)
            EXPECT_EQ(e_global[j][z], 4.1);

        for (int j = 0; j < 2; j++)
         for (int z = 0; z < 2; z++)
            for (int y = 0; y < 2; y++)
              EXPECT_EQ(f_local[j][z][y], 2);

        EXPECT_EQ(g_global.g_1, a_local);
        EXPECT_EQ(g_global.g_2, b_local);
        EXPECT_EQ(g_global.g_3, c_global);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(g_global.g_4[j], 2);
    }
}


TEST(PREALLOC, PRIVATE_GLOBAL) {

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_global[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_global[j][z][y] = 2;

#pragma omp parallel
#pragma omp single
    {
        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
#pragma omp task private(a_global, b_global, c_global, d_global,          \
                                  e_global, f_global, g_global)
         {
            EXPECT_EQ(a_global, -2);
            EXPECT_EQ(b_global, -2);
            EXPECT_EQ(c_global, (void *) -2);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_global[j], -2);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_global[j][z], -2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], -2);

            EXPECT_EQ(g_global.g_1, -2);
            EXPECT_EQ(g_global.g_2, -2);
            EXPECT_EQ(g_global.g_3, (void *)-2);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_global.g_4[j], -2);
 

            int local;
            a_global++;
            b_global = 5.2;
            c_global = &local;

            for (int j = 0; j < 2; j++)
              d_global[j] = 3;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_global[j][z] = 6.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y] = 7;

            g_global = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_global, -1);
            EXPECT_EQ(b_global, 5.2);
            EXPECT_EQ(c_global, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_global[j], 3);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_global[j][z], 6.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 7);

            EXPECT_EQ(g_global.g_1, 9);
            EXPECT_EQ(g_global.g_2, 3.6);
            EXPECT_EQ(g_global.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_global.g_4[j], 11);
         }

#pragma omp task private(a_global, b_global, c_global, d_global,          \
                                  e_global, f_global, g_global)
         {
            EXPECT_EQ(a_global, -2);
            EXPECT_EQ(b_global, -2);
            EXPECT_EQ(c_global, (void *) -2);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_global[j], -2);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_global[j][z], -2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], -2);

            EXPECT_EQ(g_global.g_1, -2);
            EXPECT_EQ(g_global.g_2, -2);
            EXPECT_EQ(g_global.g_3, (void *)-2);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_global.g_4[j], -2);

            int local;
            a_global++;
            b_global = 5.3;
            c_global = &local;

            for (int j = 0; j < 2; j++)
              d_global[j] = 4;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_global[j][z] = 7.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y] = 8;


            g_global = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_global, -1);
            EXPECT_EQ(b_global, 5.3);
            EXPECT_EQ(c_global, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_global[j], 4);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_global[j][z], 7.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 8);

            EXPECT_EQ(g_global.g_1, 9);
            EXPECT_EQ(g_global.g_2, 3.6);
            EXPECT_EQ(g_global.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_global.g_4[j], 11);
         }
        }

        EXPECT_EQ(a_global, 3);
        EXPECT_EQ(b_global, 3.2);
        EXPECT_EQ(c_global, &a_global);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(d_global[j], 2);

        for (int j = 0; j < 4; j++)
         for (int z = 0; z < 4; z++)
            EXPECT_EQ(e_global[j][z], 4.1);

        for (int j = 0; j < 2; j++)
         for (int z = 0; z < 2; z++)
            for (int y = 0; y < 2; y++)
              EXPECT_EQ(f_global[j][z][y], 2);

        EXPECT_EQ(g_global.g_1, a_global);
        EXPECT_EQ(g_global.g_2, b_global);
        EXPECT_EQ(g_global.g_3, c_global);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(g_global.g_4[j], 2);
    }
}


TEST(PREALLOC, PRIVATE_LOCAL) {

    int a_local = 3;
    double b_local = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};
    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_local[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_local[j][z][y] = 2;

#pragma omp parallel
#pragma omp single
    {
        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
#pragma omp task private(a_local, b_local, c_local, d_local,          \
                                  e_local, f_local, g_local)
         {
            EXPECT_EQ(a_local, -2);
            EXPECT_EQ(b_local, -2);
            EXPECT_EQ(c_local, (void *) -2);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], -2);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], -2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_local[j][z][y], -2);

            EXPECT_EQ(g_local.g_1, -2);
            EXPECT_EQ(g_local.g_2, -2);
            EXPECT_EQ(g_local.g_3, (void *)-2);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], -2);

            int local;
            a_local++;
            b_local = 5.2;
            c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j] = 3;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z] = 6.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_local[j][z][y] = 7;

            g_local = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_local, -1);
            EXPECT_EQ(b_local, 5.2);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 3);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 6.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_local[j][z][y], 7);

            EXPECT_EQ(g_local.g_1, 9);
            EXPECT_EQ(g_local.g_2, 3.6);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 11);
         }

#pragma omp task private(a_local, b_local, c_local, d_local,          \
                                  e_local, f_local, g_local)
         {
            EXPECT_EQ(a_local, -2);
            EXPECT_EQ(b_local, -2);
            EXPECT_EQ(c_local, (void *) -2);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], -2);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], -2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_local[j][z][y], -2);

            EXPECT_EQ(g_local.g_1, -2);
            EXPECT_EQ(g_local.g_2, -2);
            EXPECT_EQ(g_local.g_3, (void *)-2);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], -2);

            int local;
            a_local++;
            b_local = 5.3;
            c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j] = 4;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z] = 7.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_local[j][z][y] = 8;


            g_local = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_local, -1);
            EXPECT_EQ(b_local, 5.3);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 4);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 7.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_local[j][z][y], 8);

            EXPECT_EQ(g_local.g_1, 9);
            EXPECT_EQ(g_local.g_2, 3.6);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 11);
         }
        }

        EXPECT_EQ(a_local, 3);
        EXPECT_EQ(b_local, 3.2);
        EXPECT_EQ(c_local, &a_local);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(d_local[j], 2);

        for (int j = 0; j < 4; j++)
         for (int z = 0; z < 4; z++)
            EXPECT_EQ(e_local[j][z], 4.1);

        for (int j = 0; j < 2; j++)
         for (int z = 0; z < 2; z++)
            for (int y = 0; y < 2; y++)
              EXPECT_EQ(f_local[j][z][y], 2);

        EXPECT_EQ(g_local.g_1, a_local);
        EXPECT_EQ(g_local.g_2, b_local);
        EXPECT_EQ(g_local.g_3, c_local);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(g_local.g_4[j], 2);
    }
}

TEST(PREALLOC, PRIVATE_MIX) {

    int a_local = 3;
    double b_local = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};
    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_local[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_local[j][z][y] = 2;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_global[j][z][y] = 2;

#pragma omp parallel
#pragma omp single
    {
        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
#pragma omp task private(a_global, b_local, c_global, d_local,          \
                                  e_local, f_global, g_local)
         {
            EXPECT_EQ(a_global, -2);
            EXPECT_EQ(b_local, -2);
            EXPECT_EQ(c_global, (void *) -2);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], -2);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], -2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], -2);

            EXPECT_EQ(g_local.g_1, -2);
            EXPECT_EQ(g_local.g_2, -2);
            EXPECT_EQ(g_local.g_3, (void *)-2);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], -2);

            int local;
            a_global++;
            b_local = 5.2;
            c_global = &local;

            for (int j = 0; j < 2; j++)
              d_local[j] = 3;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z] = 6.2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y] = 7;

            g_local = {.g_1 = 9, .g_2 = 3.6, .g_3 = &local, .g_4 = {11,11}};

            EXPECT_EQ(a_global, -1);
            EXPECT_EQ(b_local, 5.2);
            EXPECT_EQ(c_global, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 3);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 6.2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 7);

            EXPECT_EQ(g_local.g_1, 9);
            EXPECT_EQ(g_local.g_2, 3.6);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 11);
         }
        }

        EXPECT_EQ(a_global, 3);
        EXPECT_EQ(b_local, 3.2);
        EXPECT_EQ(c_global, &a_global);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(d_local[j], 2);

        for (int j = 0; j < 4; j++)
         for (int z = 0; z < 4; z++)
            EXPECT_EQ(e_local[j][z], 4.1);

        for (int j = 0; j < 2; j++)
         for (int z = 0; z < 2; z++)
            for (int y = 0; y < 2; y++)
              EXPECT_EQ(f_global[j][z][y], 2);

        EXPECT_EQ(g_local.g_1, a_local);
        EXPECT_EQ(g_local.g_2, b_local);
        EXPECT_EQ(g_local.g_3, c_local);
        for (int j = 0; j < 2; j++)
         EXPECT_EQ(g_local.g_4[j], 2);
    }
}

TEST(PREALLOC, SHARED_GLOBAL) {

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_global[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_global[j][z][y] = 2;

#pragma omp parallel
#pragma omp single
    {
        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
#pragma omp task shared(a_global, b_global, c_global, d_global,          \
                                  e_global, f_global, g_global)
         {
            int local;
            a_global++;
            b_global++;
            c_global = &local;

            for (int j = 0; j < 2; j++)
              d_global[j]++;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_global[j][z]++;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y]++;

            g_global.g_1++;
            g_global.g_2++;
            g_global.g_3 = &local;
            g_global.g_4[0]++;
            g_global.g_4[1]++;

            EXPECT_EQ(a_global, 4 + i);
            EXPECT_EQ(b_global, 4.2 + i);
            EXPECT_EQ(c_global, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_global[j], 3+i);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_global[j][z], 5.1+i);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 3+i);

            EXPECT_EQ(g_global.g_1, 4+i);
            EXPECT_EQ(g_global.g_2, 4.2+i);
            EXPECT_EQ(g_global.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_global.g_4[j], 3+i);
         }

        }
    }
} 


TEST(PREALLOC, SHARED_LOCAL) {

    int a_local = 3;
    double b_local = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};
    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_local[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_local[j][z][y] = 2;

#pragma omp parallel
#pragma omp single
    {

        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
         #pragma omp task shared(a_local, b_local, c_local, d_local, e_local, f_local, g_local)
         {
             int local;
            a_local++;
            b_local++;
             c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j]++;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z]++;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_local[j][z][y]++;

             g_local.g_1++;
            g_local.g_2++;
            g_local.g_3 = &local;
            g_local.g_4[0]++;
            g_local.g_4[1]++;

            EXPECT_EQ(a_local, 4 + i);
            EXPECT_EQ(b_local, 4.2 + i);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 3+i);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 5.1+i);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_local[j][z][y], 3+i);

            EXPECT_EQ(g_local.g_1, 4+i);
            EXPECT_EQ(g_local.g_2, 4.2+i);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 3+i);
         }

        }
    }
} 


TEST(PREALLOC, SHARED_MIX) {

    int a_local = 3;
    a_global= 3;
    double b_local = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};
    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };  

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++)
        e_local[j][z] = 4.1;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_local[j][z][y] = 2;

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++)
            f_global[j][z][y] = 2;
            
#pragma omp parallel
#pragma omp single
    {

        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
         #pragma omp task shared(a_global, b_local, c_local, d_local, e_local, f_global, g_local)
         {
             int local;
            a_global++;
            b_local++;
             c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j]++;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z]++;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y]++;

             g_local.g_1++;
            g_local.g_2++;
            g_local.g_3 = &local;
            g_local.g_4[0]++;
            g_local.g_4[1]++;

            EXPECT_EQ(a_global, 4 + i);
            EXPECT_EQ(b_local, 4.2 + i);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 3+i);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 5.1+i);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 3+i);

            EXPECT_EQ(g_local.g_1, 4+i);
            EXPECT_EQ(g_local.g_2, 4.2+i);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 3+i);
         }

        }
    }
} 

TEST(PREALLOC, MIX_1) {

    int a_local = 3;
    a_global= 3;
    double b_local = 3.2;
    b_global = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};

    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };  

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};


    for (int j = 0; j < 2; j++){
        d_global[j] = 2;
    }

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++){
        e_local[j][z] = 4.1;
        e_global[j][z] = 4.1;
      }

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++){
            f_local[j][z][y] = 2;
            f_global[j][z][y] = 2;
         }

#pragma omp parallel
#pragma omp single
    {

        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
         #pragma omp task shared(a_global, b_local) private(c_local, d_local, e_local) firstprivate (f_global, g_local)
         {
            int local;
            a_global++;
            b_local++;

            EXPECT_EQ(c_local, (void *) -2);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], -2);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], -2);

            c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j]=2;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z]=2;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y]++;

            g_local.g_1++;
            g_local.g_2++;
            g_local.g_3 = &local;
            g_local.g_4[0]++;
            g_local.g_4[1]++;

            EXPECT_EQ(a_global, 4 + i);
            EXPECT_EQ(b_local, 4.2 + i);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 2);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 2);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 3);

            EXPECT_EQ(g_local.g_1, 4);
            EXPECT_EQ(g_local.g_2, 4.2);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 3);
         }
        }
    }
}


TEST(PREALLOC, MIX_2) {

    int a_local = 3;
    a_global= 3;
    double b_local = 3.2;
    b_global = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};

    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };  

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};


    for (int j = 0; j < 2; j++){
        d_global[j] = 2;
    }

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++){
        e_local[j][z] = 4.1;
        e_global[j][z] = 4.1;
      }

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++){
            f_local[j][z][y] = 2;
            f_global[j][z][y] = 2;
         }

#pragma omp parallel
#pragma omp single
    {

        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
         #pragma omp task firstprivate(a_global, b_local) shared(c_local, d_local, e_local) private(f_global, g_local)
         {
            int local;
            a_global++;
            b_local++;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], -2);

            EXPECT_EQ(g_local.g_1, -2);
            EXPECT_EQ(g_local.g_2, -2);
            EXPECT_EQ(g_local.g_3, (void *)-2);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], -2);


            c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j]++;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z]++;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y]++;

            g_local.g_1++;
            g_local.g_2++;
            g_local.g_3 = &local;
            g_local.g_4[0]++;
            g_local.g_4[1]++;

            EXPECT_EQ(a_global, 4 );
            EXPECT_EQ(b_local, 4.2);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 3+i);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 5.1+i);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], -1);

            EXPECT_EQ(g_local.g_1, -1);
            EXPECT_EQ(g_local.g_2, -1);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], -1);
         }
        }
    }
}


TEST(PREALLOC, MIX_3) {

    int a_local = 3;
    a_global= 3;
    double b_local = 3.2;
    b_global = 3.2;
    void *c_local = &a_local;
    int d_local[2] = {2,2};

    double e_local[4][4];
    int f_local[2][2][2];
    struct g_local_type {
        int g_1;
        double g_2;
        void *g_3;
        int g_4[2];
    };  

    struct g_local_type g_local = {.g_1 = a_local, .g_2 = b_local, .g_3 = c_local, .g_4 = {2,2}};


    for (int j = 0; j < 2; j++){
        d_global[j] = 2;
    }

    for (int j = 0; j < 4; j++)
      for (int z = 0; z < 4; z++){
        e_local[j][z] = 4.1;
        e_global[j][z] = 4.1;
      }

    for (int j = 0; j < 2; j++)
      for (int z = 0; z < 2; z++)
         for (int y = 0; y < 2; y++){
            f_local[j][z][y] = 2;
            f_global[j][z][y] = 2;
         }

#pragma omp parallel
#pragma omp single
    {

        for (int i=0 ; i < NUM_ITER; i++)
        #pragma omp taskgraph tdg_type(static)
        {
         #pragma omp task private(a_global, b_local) firstprivate(c_local, d_local, e_local) shared(f_global, g_local)
         {
            int local;

            EXPECT_EQ(a_global, -2);
            EXPECT_EQ(b_local, -2);

            a_global++;
            b_local++;
            c_local = &local;

            for (int j = 0; j < 2; j++)
              d_local[j]++;

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                e_local[j][z]++;

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  f_global[j][z][y]++;

            g_local.g_1++;
            g_local.g_2++;
            g_local.g_3 = &local;
            g_local.g_4[0]++;
            g_local.g_4[1]++;

            EXPECT_EQ(a_global, -1 );
            EXPECT_EQ(b_local, -1);
            EXPECT_EQ(c_local, &local);
            for (int j = 0; j < 2; j++)
              EXPECT_EQ(d_local[j], 3);

            for (int j = 0; j < 4; j++)
              for (int z = 0; z < 4; z++)
                EXPECT_EQ(e_local[j][z], 5.1);

            for (int j = 0; j < 2; j++)
              for (int z = 0; z < 2; z++)
                for (int y = 0; y < 2; y++)
                  EXPECT_EQ(f_global[j][z][y], 3+i);

            EXPECT_EQ(g_local.g_1, 4+i);
            EXPECT_EQ(g_local.g_2, 4.2+i);
            EXPECT_EQ(g_local.g_3, &local);
            for (int j = 0; j < 2; j++)
                EXPECT_EQ(g_local.g_4[j], 3+i);
         }
        }
    }
}

int main (int argc, char **argv) {
    testing::InitGoogleTest(&argc, argv);
    return RUN_ALL_TESTS();
}