#include<stdio.h>
#include<omp.h>
int main(){
    int N=1000;
    float a[N],b[N],sum=0;
    for(int i=0;i<N;i++){
        a[i]=b[i]=i*1.0;
    }
    #pragma omp parallel for reduction(+:sum)
        for(int i=0;i<N;i++){
            sum=sum+(a[i]*b[i]);
        }
        printf("Sum = %f\n",sum);
        return 0;
}
