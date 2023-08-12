#include <getopt.h>
#include <regex.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct options {
  int status;
  char f_template[1024];
  int e;
  int i;
  int v;
  int c;
  int l;
  int n;
  int h;
  int s;
  int f;
  int o;
} opt;

int checkArg(char *argv[], int argc, opt *Options);
int readFile(char *fileName, char *template, opt *Options);
int readTemplate(char *fileName, opt *Options);
void read_o(char *str, regex_t *compiled);