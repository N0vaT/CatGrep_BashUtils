#include "s21_cat_lib.h"

int main(int argc, char *argv[]) {
  if (argc < 2) {
    printf("NO ARGS ERROR\n");
    return 1;
  }
  opt Options = {0};
  // Проверка на последний символ флаг
  if (argv[argc - 1][0] == '-') {
    readFile(argv, argc, Options.cnt, &Options);
    return 0;
  } else if (checkArg(argv, argc, &Options) != 1) {
    printf("usage: cat [-benstuv] [file ...]\n");
  } else if (Options.status == 1) {
    // with flags mod
    countedOptions(argv, argc, &Options);
    readFile(argv, argc, Options.cnt, &Options);
  } else {
    // without flags mod
    readFile(argv, argc, Options.cnt, &Options);
  }
  return 0;
}
