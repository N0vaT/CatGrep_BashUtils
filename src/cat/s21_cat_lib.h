#include <getopt.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct options {
  int cnt;
  int status;
  int b;
  int e;
  int E;
  int n;
  int s;
  int t;
  int T;
  int v;
} opt;

int checkArg(char *argv[], int argc, opt *Options);
int readFile(char *argv[], int argc, int value, opt *Options);
void countedOptions(char *argv[], int argc, opt *Options);