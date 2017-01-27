#include <stdio.h>
#include <stdlib.h>

int main()
{
    // Part 1
    printf("Part 1\n");
    // Two variables of each type
    int int1 = 1;
    int int2 = 2;
    float f1 = 1.0;
    float f2 = 2.0;
    char c1 = 'a';
    char c2 = 'b';

    // One pointer of each type, print it dereferenced
    int *ip = &int1;
    float *fp = &f1;
    char *cp = &c1;
    printf("%d, %f, %c\n", *ip, *fp, *cp);
    
    // Switch pointer values, print dereferenced again
    ip = &int2;
    fp = &f2;
    cp = &c2;
    printf("%d, %f, %c\n", *ip, *fp, *cp);

    // Part 2
    printf("Part 2\n");
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
