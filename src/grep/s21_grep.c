#include "s21_grep_lib.h"

int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("NO ARGS ERROR\n");
    return 1;
  }
  opt Options = {0};
  if (checkArg(argv, argc, &Options) != 1) {
    printf("usage: grep [-eivclnhsfo] template [file ...]\n");
  } else {
    char *template = argv[optind];
    optind++;
    if (Options.f == 1 || Options.e == 1) {
      optind--;
    }
    while (argc > optind) {
      readFile(argv[optind], template, &Options);
      optind++;
    }
  }
  return 0;
}
