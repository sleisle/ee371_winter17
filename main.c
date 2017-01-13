#include <stdio.h>
#include <stdlib.h>

// Takes a pointer to the current exchange rate, and prompts the user for
// a new exchange rate and modifies the one passed in
void changeExchange(float *rate);

// Prompts the user for a dollar value, and converts to foreign currency
// with the passed in float value representing the exchange rate
void dollarToForeign(float rate);

// Prompts the user for a foreign currency value, and converts to dollar value
// with the passed in float value representing the exchange rate
void foreignToDollar(float rate);

// Prints out the options the user has to choose from, and the current exchange
// rate represented by the passed in float value
void showMenu(float rate);

int main() {
    float currentRate = 0.0;
    int running = 1;
    changeExchange(&currentRate);
    while (running) {
        showMenu(currentRate);
        int choice = 0;
        scanf("%d", &choice);
        switch (choice) {
            case 1: changeExchange(&currentRate); break;
            case 2: dollarToForeign(currentRate); break;
            case 3: foreignToDollar(currentRate); break;
            case 4: running = 0; break;
            default: running = 0; break;
        }
    }
    return 0;
}

void changeExchange(float *rate) {
    printf("Please enter the dollar to foreign currency exchange rate: ");
    float newRate = 0.0;
    if (scanf("%f", &newRate) == 1) {
        *rate = newRate;
    }
}

void dollarToForeign(float rate) {
    printf("Please enter dollar amount to convert: ");
    float money = 0.0;
    if (scanf("%f", &money) == 1) {
        printf("Foreign amount is: %.2f\n", money * rate);
    }
}

void foreignToDollar(float rate) {
    printf("Please enter foreign amount to convert: ");
    float money = 0.0;
    if (scanf("%f", &money) == 1) {
        printf("Dollar amount is: %.2f\n", money / rate);
    }
}

void showMenu(float rate) {
    printf("Current exchange rate is %.3f. What would you like to do?\n\n", rate);
    printf("1) Change exchange rate\n");
    printf("2) Convert dollars to foreign currency\n");
    printf("3) Convert foreign currency to dollars\n");
    printf("4) Exit\n\n");
    printf("Please choose an option by typing the number 1, 2, 3, or 4: ");
}
