#include <stdio.h>
int factorial(int n){
    int temp =1;
    for(int i=1;i<=n;i++){
        temp*=i;
    }
    return temp;
}
int main() {
    int n = 7;
    int answer = factorial(n);
    printf("Factorial of %d is %d",n,answer);
    return 0;
}
