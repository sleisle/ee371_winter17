/*
 * "Checkers testing".
 */

#define sendData (volatile char *) 0x0041120
#define newData (volatile char *) 0x0041100

#define row7 (volatile unsigned char *) 0x00410e0
#define row6 (volatile unsigned char *) 0x00410c0
#define row5 (volatile unsigned char *) 0x00410a0
#define row4 (volatile unsigned char *) 0x0041080
#define row3 (volatile unsigned char *) 0x0041060
#define row2 (volatile unsigned char *) 0x0041040
#define row1 (volatile unsigned char *) 0x0041020
#define row0 (volatile unsigned char *) 0x0041000

/*
 * "Checkers testing".
 */
#include <stdio.h>

// Set to 1 to put on board
#define ON_BOARD 1

#if ON_BOARD == 0
#define RED     "\x1b[31m"
#define GREEN   "\x1b[32m"
#define RESET   "\x1b[0m"
#else
#define RED     ""
#define GREEN   ""
#define RESET   ""
#include "sys/alt_stdio.h"
#include "sys/unistd.h"
#endif

#define BOARD_SIZE 8
#define DEBUG 0

#define DIR_TL 0
#define DIR_TR 1
#define DIR_BL 2
#define DIR_BR 3

// Red is 1, Green is 0
// Team Red goes first

typedef unsigned char Board[BOARD_SIZE][BOARD_SIZE / 2];

typedef struct point {
  unsigned char x;
  unsigned char y;
}Point;

typedef struct stack {
  Point points[6];
  int index;
}Stack;

void pushStack(Stack *s, unsigned char x, unsigned char y);

Point popStack(Stack *s);

void printBoard(Board b);

char getSpot(Board b, int x, int y);

void setSpot(Board b, int x, int y, char c);

void initializeBoard(Board b);

int movePiece(Board b, int x, int y, int nx, int ny);

int checkMove(Board b, int x, int y, int nx, int ny);

int jump(Board b, char piece, int x, int y, int nx, int ny, int dir);

void boardToBuffer(Board b);

static Stack stack;

int main(int argc, char **argv) {
  Board board;
  initializeBoard(board);
  /*setSpot(board, 4, 4, 'r');
  setSpot(board, 5, 5, 'G');
  setSpot(board, 6, 4, 'r');
  setSpot(board, 5, 1, 'O');*/
  printBoard(board);
  int x = -1;
  int y = -1;
  int nx = -1;
  int ny = -1;
  boardToBuffer(board);
  while (1) {
    int res = 0;
    while (!res) {
      printf("Start X: ");
      scanf("%d", &x);
      getchar();
      printf("Start Y: ");
      scanf("%d", &y);
      getchar();
      printf("Final X: ");
      scanf("%d", &nx);
      getchar();
      printf("Final Y: ");
      scanf("%d", &ny);
      getchar();
      res = movePiece(board, x, y, nx, ny);
    }
    printBoard(board);
  }
  return 0;
}

void boardToBuffer(Board b) {
	int x;
	for (x = 0; x < BOARD_SIZE / 2; x++) {
		*(row0 + x) = b[7][x];
		*(row1 + x) = b[6][x];
		*(row2 + x) = b[5][x];
		*(row3 + x) = b[4][x];
		*(row4 + x) = b[3][x];
		*(row5 + x) = b[2][x];
		*(row6 + x) = b[1][x];
		*(row7 + x) = b[0][x];
	}
	printf("%x \n", *(int*)row7);
	printf("%x \n", *(int*)row6);
	printf("%x \n", *(int*)row5);
	printf("%x \n", *(int*)row4);
	printf("%x \n", *(int*)row3);
	printf("%x \n", *(int*)row2);
	printf("%x \n", *(int*)row1);
	printf("%x \n", *(int*)row0);
	*sendData = 1;
	*sendData = 0;
}

void printBoard(Board b) {
  printf("  ");
  int x, y;
  for (x = 0; x < BOARD_SIZE; x++) {
    printf("%d ", x);
  }
  printf("\n");
  for (y = 0; y < BOARD_SIZE; y++) {
    printf("%d ", y);
    for (x = 0; x < BOARD_SIZE; x++) {
      char piece = getSpot(b, x, y);
      if (piece == 'r' || piece == 'R') {
	printf(RED "%c " RESET, piece);
      } else if (piece == 'g' || piece == 'G') {
	printf(GREEN "%c " RESET, piece);
      } else {
	printf("%c ", piece);
      }
    }
    printf("\n");
  }
}

char getSpot(Board b, int x, int y) {
  if (x % 2 == 0) {
    switch (b[y][x / 2] >> 4) {
    case 0: return 'O'; break;
    case 3: return 'r'; break;
    case 1: return 'g'; break;
    case 7: return 'R'; break;
    case 5: return 'G'; break;
    default: return 'O'; break;
    }
  } else {
    switch (b[y][x / 2] & 0x0F) {
    case 0: return 'O'; break;
    case 3: return 'r'; break;
    case 1: return 'g'; break;
    case 7: return 'R'; break;
    case 5: return 'G'; break;
    default: return 'O'; break;
    }
  }
}

void setSpot(Board b, int x, int y, char c) {
  unsigned char choice = 0;
  switch (c) {
  case 'r': choice = 3; break;
  case 'g': choice = 1; break;
  case 'R': choice = 7; break;
  case 'G': choice = 5; break;
  default: choice = 0; break;
  }
  if (x % 2 == 0) {
    choice <<= 4;
    b[y][x / 2] = (b[y][x / 2] & 0x0F) | choice;
  } else {
    b[y][x / 2] = (b[y][x / 2] & 0xF0) | choice;
  }
}

void initializeBoard(Board b) {
  int i, j;
  for (i = 0; i < BOARD_SIZE; i++) {
    for (j = 0; j < BOARD_SIZE; j++) {
      setSpot(b, i, j, 'O');
    }
  }
  for (i = 0; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 0, 'r');
  }
  for (i = 1; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 1, 'r');
  }
  for (i = 0; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 2, 'r');
  }
  for (i = 1; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 5, 'g');
  }
  for (i = 0; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 6, 'g');
  }
  for (i = 1; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 7, 'g');
  }
}

int movePiece(Board b, int x, int y, int nx, int ny) {
  if (!checkMove(b, x, y, nx, ny) && !DEBUG) {
    printf("Invalid move!\n");
    return 0;
  } else {
    setSpot(b, nx, ny, getSpot(b, x, y));
    setSpot(b, x, y, 'O');
    boardToBuffer(b);
    printf("Move successful!\n");
    return 1;
  }
}

int checkMove(Board b, int x, int y, int nx, int ny) {
  // Piece on board
  if (x < 0 || x > 7 || y < 0 || y > 7 ||
      nx < 0 || nx > 7 || ny < 0 || ny > 7) {
    return 0;
  }

  // Can't move to a spot that already has a piece
  if (getSpot(b, nx, ny) != 'O') {
    return 0;
  }

  // Make sure it's your piece, and if king or not
  char piece = getSpot(b, x, y);
  if (piece == 'g' && ny < y) {
    if (y - ny == 1 && (x - nx == 1 || nx - x == 1)) {
      return 1;
    }
    int ret = jump(b, piece, x, y, nx, ny, - 1);
    if (ret) {
      while (stack.index > 0) {
	Point p = popStack(&stack);
	setSpot(b, p.x, p.y, 'O');
      }
    }
    return ret;
  } else if (piece == 'G') {
    if ((y - ny == 1 || ny - y == 1) && (x - nx == 1 || nx - x == 1)) {
      return 1;
    }
    int ret =  jump(b, piece, x, y, nx, ny, - 1);
    if (ret) {
      while (stack.index > 0) {
	Point p = popStack(&stack);
	setSpot(b, p.x, p.y, 'O');
      }
    }
    return ret;
  } else {
    return 0;
  }
  return 1;
}

int jump(Board b, char piece, int x, int y, int nx, int ny, int dir) {
  if (x < 0 || x > 7 || y < 0 || y > 7 ||
      nx < 0 || nx > 7 || ny < 0 || ny > 7) {
    return 0;
  }
  if (x == nx && y == ny) {
    return 1;
  }
  printf("%d, %d\n", x, y);
  int tl = 0;
  int tr = 0;
  int bl = 0;
  int br = 0;
    if ((getSpot(b, x + 1, y - 1) == 'r' ||
	 getSpot(b, x + 1, y - 1) == 'R') &&
	 getSpot(b, x + 2, y - 2) == 'O' &&
	 dir != DIR_BL) {
      pushStack(&stack, x + 1, y - 1);
      tr = jump(b, piece, x + 2, y - 2, nx, ny, DIR_TR);
      if (!tr) {
	popStack(&stack);
      } else {
	return tr;
      }
    }
    if ((getSpot(b, x - 1, y - 1) == 'r' ||
	 getSpot(b, x - 1, y - 1) == 'R') &&
	 getSpot(b, x - 2, y - 2) == 'O' &&
	 dir != DIR_BR) {
      pushStack(&stack, x - 1, y - 1);
      tl = jump(b, piece, x - 2, y - 2, nx, ny, DIR_TL);
      if (!tl) {
	popStack(&stack);
      } else {
	return tl;
      }
    }
    if (piece == 'G') {
      if ((getSpot(b, x + 1, y + 1) == 'r' ||
	   getSpot(b, x + 1, y + 1) == 'R') &&
	   getSpot(b, x + 2, y + 2) == 'O' &&
	   dir != DIR_TL) {
	pushStack(&stack, x + 1, y + 1);
	br = jump(b, piece, x + 2, y + 2, nx, ny, DIR_BR);
	if (!br) {
	popStack(&stack);
	} else {
	  return br;
	}
      }
      if ((getSpot(b, x - 1, y + 1) == 'r' ||
	   getSpot(b, x - 1, y + 1) == 'R') &&
	   getSpot(b, x - 2, y + 2) == 'O' &&
	   dir != DIR_TR) {
	pushStack(&stack, x - 1, y + 1);
	bl = jump(b, piece, x - 2, y + 2, nx, ny, DIR_BL);
	if (!bl) {
	  popStack(&stack);
	} else {
	  return bl;
	}
      }
    }
  return tr || tl || br || bl;
}

void pushStack(Stack *s, unsigned char x, unsigned char y) {
  s->points[s->index].x = x;
  s->points[s->index].y = y;
  (s->index)++;
}

Point popStack(Stack *s) {
  (s->index)--;
  return s->points[s->index];
}



