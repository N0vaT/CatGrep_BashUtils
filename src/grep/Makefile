CC=gcc
FLAGS=-Wall -Werror -Wextra
all: s21_grep clean

s21_grep: s21_grep.o s21_grep_lib.o
		$(CC) $(FLAGS) s21_grep.o s21_grep_lib.o -o s21_grep

s21_grep.o: s21_grep.c
		$(CC) $(FLAGS) -c s21_grep.c

s21_cat_lib.o: s21_grep_lib.c
		$(CC) $(FLAGS) -c s21_grep_lib.c

clean:
		rm -rf *.o

cleanAll:
		rm -rf *.o
		rm -rf s21_grep