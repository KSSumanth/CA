#include<stdio.h>
#include<omp.h>
int a,b,tid;
float x;
#pragma omp threadprivate(a,x)
int main(){
    omp_set_dynamic(0);
    printf("first parallele region\n");
    #pragma omp parallel private(b,tid)
    {
        tid=omp_get_thread_num();
        a=tid;
        b=tid;
        x=1.1*tid+1.0;
        printf("Thread %d: a,b,x: %d %d %f\n",tid,a,b,x);
    }
    printf("master theread doing sequential work\n");
    #pragma omp parallel private(tid)
    {
        tid=omp_get_thread_num();
        printf("Thread %d: a,b,x: %d %d %f\n",tid,a,b,x);
    }
    return 0;
}
