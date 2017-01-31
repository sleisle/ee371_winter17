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

    printf("Welcome to the temperature conversion program!\n");
    printf("What scale is are you trying to convert from?\n");
    changeScale(&source);
    printf("What scale is are you trying to convert to?\n");
    changeScale(&dest);

    while (running) {
        showMenu(source, dest);
        int choice = 0;
        if (scanf("%d", &choice) == 1) {
            switch (choice) {
                case 1: convertTemp(source, dest); break;
                case 2: changeScale(&source); break;
                case 3: changeScale(&dest); break;
                case 4: running = 0; break;
                default: continue; break;
            }
        } else {
            getchar();
        }
    }
    return 0;
}

void convertTemp(int source, int dest) {
    float temp = 0.0;
    printf("What value temperature are you trying to convert? > ");
    if (scanf("%f", &temp) == 1) {
        if (source == dest) {
        } else if (source == 1 && dest == 2) {
            temp = (temp - 32) * 5.0 / 9;
        } else if (source == 1 && dest == 3) {
            temp = (temp + 459.67) * 5.0 / 9;
        } else if (source == 2 && dest == 1) {
            temp = temp * 9.0 / 5 + 32;
        } else if (source == 2 && dest == 3) {
            temp += 273.15;
        } else if (source == 3 && dest == 1) {
            temp = temp / 5.0 / 9 - 459.67;
        } else if (source == 3 && dest == 2) {
            temp -= 273.15;
        }
        printf("Your converted temperature is %f\n", temp);
    } else {
        getchar();
        printf("Please enter a float!\n");
    }
}

void changeScale(int *scale) {
    int newScale = 0;
    do {
        printf("What is the new scale? Please enter 1, 2, or 3.\n");
        printf("1) Fahrenheit\n");
        printf("2) Celsius\n");
        printf("3) Kelvin\n> ");
        if (scanf("%d", &newScale) == 1) {
            *scale = newScale;
        } else {
            getchar();
        }
    } while (newScale < 1 || newScale > 3);
}

void showMenu(int source, int dest) {
    char *source_scale;
    char *dest_scale;

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
