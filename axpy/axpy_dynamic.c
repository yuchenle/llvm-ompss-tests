// Part of the CG (Conjugate gradient) method
// Complete source in BAR/Apps/CG from https://pm.bsc.es/svn/BAR

#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
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

inline __attribute__((always_inline)) void saxpy(double *x, double *y)
{
    for (int i = 0; i < N; i+=BS1)
    {
#ifdef PREALLOC
        #pragma omp task dep_check(dynamic)
#else
        #pragma omp task //shared(x,y)
#endif  
        { 
                      //  printf("Es %p y %p and %d \n", x,y,i);

            for(int j = 0; j < BS1; j++)
            {
                y[i+j] += a * x[i+j];
            }
           // printf("Es %p y %p and %d \n", x,y,i);
        }
    }
    #pragma omp taskwait
}

int main(int argc, char** argv)
{
    if (argc != 2)
    {
        printf("Usage: ./axpy_VERSION out_file\n");
        exit(-1);
    }
    FILE *fp;
    fp = fopen(argv[1], "a");

    double *x, *y;
    x = (double*)malloc(sizeof(double) * N);
    y = (double*)malloc(sizeof(double) * N);

    for(int i = 0; i < N; ++i){
        x[i] = y[i] = 1;
    }

    double elapsedTime;
    // NOTE: Initiate time inside the parallel region, so the preallocation of tasks is not taken into account
    gettimeofday(&t1, NULL);

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
      //#pragma omp taskwait
    }

    gettimeofday(&t2, NULL);
    elapsedTime = (t2.tv_sec - t1.tv_sec) * 1000000.0;      // sec to us // chenle
    // elapsedTime += (t2.tv_usec - t1.tv_usec) / 1000000.0;   // us to ms
    elapsedTime += (t2.tv_usec - t1.tv_usec);  				 // chenle
    

    for (int i = 0; i < N; ++i){
        if (y[i] != x[i]*(NUM_ITER)+1)
        {
            printf("Erroneous results %f \n", y[i]);
            //fprintf(fp, "%d::Error!\n", omp_get_max_threads());
            fclose(fp);
            exit(1);
        } 
    }
    printf("\033[32;1mAXPY dynamic test: correct \n");
    fclose(fp);

    return 1;
}
