#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    int running = 1;
    do {
        // Prompt for amount of logic devices
        printf("How many logic devices are on the path? > ");
        int gates = 0;
        if (scanf("%d", &gates) == 1 && gates >= 0) {
            // Do time calculation
            double time = 0.0;
            time += gates * 5;
            time += (gates - 1) * .18;

            // Print time in nanoseconds
            printf("Total delay: %f nanoseconds\n", time);
            char answer = 'x';
            getchar();
            do {
                // Ask if user wants to continue
                printf("Do you want to do another calculation? (Y/n) > ");
                scanf("%c", &answer);
                getchar();
            } while (answer != 'Y' && answer != 'n');

            // Exit if no
            if (answer == 'n') {
                running = 0;
            }
        } else {
            getchar();
        }
    } while (running);
    return 0;
}
