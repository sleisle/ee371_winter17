#include <stdio.h>
#include <stdlib.h>

int main()
{
    // Integers defined
    int A = 22;
    int B = 17;
    int C = 6;
    int D = 4;
    int E = 9;

    // Pointers to each integer
    int *aPtr = &A;
    int *bPtr = &B;
    int *cPtr = &C;
    int *dPtr = &D;
    int *ePtr = &E;

    // Compute results and print to see if equal
    int result = ((*aPtr - *bPtr) * (*cPtr + *dPtr)) / *ePtr;
    int resultCheck = ((A - B) * (C + D)) / E;
    printf("pointer result: %d, integer result: %d\n", result, resultCheck);

    return 0;
}
