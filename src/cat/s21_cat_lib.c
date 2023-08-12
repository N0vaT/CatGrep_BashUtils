#include "s21_cat_lib.h"

int checkArg(char *argv[], int argc, opt *Options) {
  int flag = 1;
  int rez = 0;
  const char *short_options = "beEnstTv";
  int option_index;
  const struct option long_options[] = {{"number-nonblank", 0, NULL, 'b'},
                                        {"number", 0, NULL, 'n'},
                                        {"squeeze-blank", 0, NULL, 's'},
                                        {NULL, 0, NULL, 0}};

  while ((rez = getopt_long(argc, argv, short_options, long_options,
                            &option_index)) != -1) {
    switch (rez) {
      case 'b':
        Options->b = 1;
        Options->status = 1;
        break;
      case 'e':
        Options->e = 1;
        Options->v = 1;
        Options->status = 1;
        break;
      case 'E':
        Options->E = 1;
        Options->status = 1;
        break;
      case 'n':
        Options->n = 1;
        Options->status = 1;
        break;
      case 's':
        Options->s = 1;
        Options->status = 1;
        break;
      case 't':
        Options->t = 1;
        Options->v = 1;
        Options->status = 1;
        break;
      case 'T':
        Options->T = 1;
        Options->status = 1;
        break;
      case 'v':
        Options->v = 1;
        Options->status = 1;
        break;
      case '?':
      default:
        flag = rez;
        break;
    }
  }
  return flag;
}

int readFile(char *argv[], int argc, int value, opt *Options) {
  int result = 0;
  FILE *file;
  for (int i = 1 + value; i < argc; i++) {
    if (argv[i][0] == '-') continue;
    char ch = 0, ch2 = '\n', ch3 = 0;
    int cnt_str = 1;
    int cnt_str_no_line = 1;
    if ((file = fopen(argv[i], "r")) != NULL) {
      while ((ch = fgetc(file)) != EOF) {
        if (Options->s == 1 && ch == '\n' && ch2 == '\n' && ch3 == '\n')
          continue;
        if (Options->n == 1 && ch2 == '\n' && Options->b != 1) {
          printf("%6d\t", cnt_str);
          cnt_str++;
        }
        if (Options->b == 1 && ch != '\n' && ch2 == '\n') {
          printf("%6d\t", cnt_str_no_line);
          cnt_str_no_line++;
        }
        if ((Options->e == 1 || Options->E == 1) && ch == '\n') {
          printf("%c", '$');
        }
        if ((Options->t == 1 || Options->T == 1) && ch == 9) {
          printf("^");
          ch = 'I';
        }
        if (Options->v == 1 && !(ch >= 32 && ch < 127) && ch != '\n' &&
            ch != '\t') {
          if (ch == 127) {
            ch -= 64;
            printf("^");
          } else if (ch < 32 && ch >= 0) {
            ch += 64;
            printf("^");
          }
        }
        printf("%c", ch);
        ch3 = ch2;
        ch2 = ch;
      }
      fclose(file);
    } else {
      // printf("cat: %s: No such file or directory\n", argv[i]);
      result = -1;
    }
  }
  return result;
}

void countedOptions(char *argv[], int argc, opt *Options) {
  int count = 0;
  for (int i = 0; i < argc; i++) {
    if (argv[i][0] == '-') count++;
  }
  Options->cnt = count;
}