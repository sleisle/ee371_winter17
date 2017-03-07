#include <stdio.h>

#define BOARD_SIZE 8
#define DEBUG 0

#define RED     "\x1b[31m"
#define GREEN   "\x1b[32m"
#define RESET   "\x1b[0m"

// Red is 1, Green is 0
// Team Red goes first

typedef unsigned char Board[BOARD_SIZE][BOARD_SIZE / 2];

void printBoard(Board b);

char getSpot(Board b, int x, int y);

void setSpot(Board b, int x, int y, char c);

void initializeBoard(Board b);

int movePiece(Board b, int x, int y, int nx, int ny);

int checkMove(Board b, int x, int y, int nx, int ny);

int jump(Board b, char piece, int x, int y, int nx, int ny);

int main(int argc, char **argv) {
  Board board;
  initializeBoard(board);
  setSpot(board, 4, 4, 'r');
  setSpot(board, 5, 1, 'O');
  printBoard(board);
  int x = -1;
  int y = -1;
  int nx = -1;
  int ny = -1;
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

void printBoard(Board b) {
  printf("  ");
  for (int x = 0; x < BOARD_SIZE; x++) {
    printf("%d ", x);
  }
  printf("\n");
  for (int y = 0; y < BOARD_SIZE; y++) {
    printf("%d ", y);
    for (int x = 0; x < BOARD_SIZE; x++) {
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
  for (int i = 0; i < BOARD_SIZE; i++) {
    for (int j = 0; j < BOARD_SIZE; j++) {
      setSpot(b, i, j, 'O');
    }
  }
  for (int i = 0; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 0, 'r');
  }
  for (int i = 1; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 1, 'r');
  }
  for (int i = 0; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 2, 'r');
  }
  for (int i = 1; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 5, 'g');
  }
  for (int i = 0; i < BOARD_SIZE; i += 2) {
    setSpot(b, i, 6, 'g');
  }
  for (int i = 1; i < BOARD_SIZE; i += 2) {
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
    return jump(b, piece, x, y, nx, ny);
  } else if (piece == 'G') {
    if ((y - ny == 1 || ny - y == 1) && (x - nx == 1 || nx - x == 1)) {
      return 1;
    }
    return jump(b, piece, x, y, nx, ny);
  } else {
    return 0;
  }
  return 1;
}

int jump(Board b, char piece, int x, int y, int nx, int ny) {
  if (x == nx && y == ny) {
    return 1;
  }
  int tl = 0;
  int tr = 0;
  int bl = 0;
  int br = 0;
  if (x < BOARD_SIZE - 2 && x > 1 && y > 1) {
    if ((getSpot(b, x + 1, y - 1) == 'r' ||
	 getSpot(b, x + 1, y - 1) == 'R') &&
	getSpot(b, x + 2, y - 2) == 'O') {
      tr = jump(b, piece, x + 2, y - 2, nx, ny);
    }
    if ((getSpot(b, x - 1, y - 1) == 'r' ||
	 getSpot(b, x - 1, y - 1) == 'R') &&
	getSpot(b, x - 2, y - 2) == 'O') {
      tl = jump(b, piece, x - 2, y - 2, nx, ny);
    }
    if (piece == 'G' && y < BOARD_SIZE - 1) {
      if ((getSpot(b, x + 1, y + 1) == 'r' ||
	 getSpot(b, x + 1, y + 1) == 'R') &&
	getSpot(b, x + 2, y + 2) == 'O') {
	br = jump(b, piece, x + 2, y + 2, nx, ny);
      }
      if ((getSpot(b, x - 1, y + 1) == 'r' ||
	   getSpot(b, x - 1, y + 1) == 'R') &&
	  getSpot(b, x - 2, y + 2) == 'O') {
	bl = jump(b, piece, x - 2, y + 2, nx, ny);
      }
    }
  }
  return tr || tl || br || bl;
}
