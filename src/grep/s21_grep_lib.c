#include "s21_grep_lib.h"

int checkArg(char *argv[], int argc, opt *Options) {
  int flag = 1;
  int rez = 0;
  const char *short_options = "eivclnhsf:o";
  while ((rez = getopt(argc, argv, short_options)) != -1) {
    switch (rez) {
      case 'e':
        Options->e = 1;
        break;
      case 'i':
        Options->i = 1;
        break;
      case 'v':
        Options->v = 1;
        break;
      case 'c':
        Options->c = 1;
        break;
      case 'l':
        Options->l = 1;
        break;
      case 'n':
        Options->n = 1;
        break;
      case 'h':
        Options->h = 1;
        break;
      case 's':
        Options->s = 1;
        break;
      case 'f':
        Options->f = 1;
        readTemplate(optarg, Options);
        break;
      case 'o':
        Options->o = 1;
        break;
      case '?':
      default:
        flag = rez;
        break;
    }
  }
  //Грабли для флага Ф =(
  int n = Options->f == 1 ? 1 : 2;
  if (optind + n < argc) {
    Options->status = 1;
  }
  return flag;
}

int readFile(char *fileName, char *template, opt *Options) {
  int result = 0, str_cnt = 0, str_cnt_found = 0;
  char str[1024];
  regex_t compiled;
  regcomp(&compiled, Options->f == 1 ? Options->f_template : template,
          Options->i == 1 ? REG_ICASE : REG_EXTENDED);
  FILE *file;
  if ((file = fopen(fileName, "r")) != NULL) {
    int found_for_l = 0;
    while ((fgets(str, 1024, file)) != NULL) {
      str_cnt++;
      result = regexec(&compiled, str, 0, NULL, 0);
      if (Options->v == 1) result = !result;
      if (result == 0) {
        found_for_l = 1;
        if (Options->c == 1 || Options->l == 1) {
          str_cnt_found++;
          continue;
        } else if (Options->status == 1 && Options->n == 1 && Options->h != 1) {
          if (Options->o == 1) {
            printf("%s:%d:", fileName, str_cnt);
            read_o(str, &compiled);
          } else {
            printf("%s:%d:%s", fileName, str_cnt, str);
          }
        } else if (Options->status == 1 && Options->n != 1 && Options->h != 1) {
          if (Options->o == 1) {
            printf("%s:", fileName);
            read_o(str, &compiled);
          } else {
            printf("%s:%s", fileName, str);
          }
        } else if (Options->n == 1) {
          if (Options->o == 1) {
            printf("%d:", str_cnt);
            read_o(str, &compiled);
          } else {
            printf("%d:%s", str_cnt, str);
          }
        } else {
          if (Options->o == 1) {
            read_o(str, &compiled);
          } else {
            printf("%s", str);
          }
        }
        if (str[strlen(str) - 1] != '\n' && Options->o != 1) {
          printf("\n");
        }
      }
    }
    if (Options->c == 1 && Options->status == 1)
      printf("%s:%d\n", fileName, str_cnt_found);
    else if (Options->l == 1 && Options->status != 1)
      printf("%s\n", fileName);
    else if (Options->c == 1 && Options->status != 1)
      printf("%d\n", str_cnt_found);
    if (Options->l == 1 && found_for_l == 1 && Options->status == 1)
      printf("%s\n", fileName);
    fclose(file);
  } else {
    if (Options->s != 1) {
      // printf("grep: %s: No such file or directory\n", fileName);
    }
    result = 1;
  }
  regfree(&compiled);
  return result;
}

int readTemplate(char *fileName, opt *Options) {
  int result = 0, cnt = 0;
  char tmp[1024];
  char ch = 0;
  FILE *file;
  if ((file = fopen(fileName, "r")) != NULL) {
    while ((ch = fgetc(file)) != EOF) {
      tmp[cnt] = ch;
      cnt++;
    }
    tmp[cnt] = '\0';
    strcat(Options->f_template, tmp);
    fclose(file);
  } else {
    printf("grep: %s: No such file or directory", *fileName);
    result = 1;
  }
  return result;
}

void read_o(char *str, regex_t *compiled) {
  regmatch_t pmatch[1];
  int eflag = 0;
  while (regexec(compiled, str, 1, pmatch, eflag) == 0) {
    for (int j = pmatch[0].rm_so; j < pmatch[0].rm_eo; j++) {
      putchar(str[j]);
    }
    str += pmatch[0].rm_eo;
    eflag = REG_NOTBOL;
    putchar('\n');
  }
}