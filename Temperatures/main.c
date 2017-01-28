#include <stdio.h>
#include <stdlib.h>

// Shows the user a menu of numbered choices, which they select
// by inputing a number
void showMenu(int source, int dest);

// Changes the current scale of either source or destination
// scale
void changeScale(int *scale);

// Converts temperature from source to destination scale
void convertTemp(int source, int dest);

int main()
{
    // State if program is running
    int running = 1;

    // Scale inputed temperature is in
    int source = 0;

    // Scale output temperature is in
    int dest = 0;

    // Value of the input temperature
    float temp = 0.0;

    printf("Welcome to the temperature conversion program!\n");
    printf("What scale is are you trying to convert from? > ");
    changeScale(&source);
    printf("What scale is are you trying to convert to? > ");
    changeScale(&dest);

    while (running) {
        showMenu(source, dest);
        int choice = 0;
        if (scanf("%d", &choice) == 1) {
            switch (choice) {
                case 1: changeExchange(&currentRate); break;
                case 2: dollarToForeign(currentRate); break;
                case 3: foreignToDollar(currentRate); break;
                case 4: running = 0; break;
                default: running = 0; break;
            }
        }
        getchar();
        printf("What value temperature are you trying to convert? > ");
        if (scanf("%f", &temp) == 1) {
            printf("What scale is that value in? > ");
            if (fgets(source, 20, stdin) != NULL) {
                printf("What scale would you like to convert to? >")
                if (fgets(dest, 20, stdin) != NULL) {

                }
            }
        } else {
            getchar();
            printf("Please enter a float!\n");
        }
    }

    return 0;
}

void changeScale(int *scale) {
    printf("What is the new scale? Please enter 1, 2, or 3.\n");
    printf("1) Fahrenheit\n");
    printf("2) Celsius\n");
    printf("3) Kelvin\n> ");
    int newScale = 0;
    if (scanf("%d", &newSource) == 1) {
        *scale = newScale;
    }
    getchar();
}

void showMenu(int source, int dest) {
    char source_scale[20];
    char dest_scale[20];

    switch (source) {
        case 1: source_scale = "Fahrenheit"; break;
        case 2: source_scale = "Celsius"; break;
        case 3: source_scale = "Kelvin"; break;
        default: break;
    }
    switch (dest) {
        case 1: dest_scale = "Fahrenheit"; break;
        case 2: dest_scale = "Celsius"; break;
        case 3: dest_scale = "Kelvin"; break;
        default: break;
    }

    printf("Current conversion is %s to %s. What would you like to do?\n\n",
           source_scale, dest_scale);
    printf("1) Convert a temperature\n");
    printf("2) Change starting temperature scale\n");
    printf("3) Change temperature scale to convert to\n");
    printf("4) Exit\n\n");
    printf("Please choose an option by typing the number 1, 2, 3, or 4: ");
}
