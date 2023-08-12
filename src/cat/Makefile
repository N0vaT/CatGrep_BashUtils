CC=gcc
FLAGS=-Wall -Werror -Wextra
all: s21_cat clean

s21_cat: s21_cat.o s21_cat_lib.o
		$(CC) $(FLAGS) s21_cat.o s21_cat_lib.o -o s21_cat

s21_cat.o: s21_cat.c
		$(CC) $(FLAGS) -c s21_cat.c

s21_cat_lib.o: s21_cat_lib.c
		$(CC) $(FLAGS) -c s21_cat_lib.c

clean:
		rm -rf *.o

cleanAll:
		rm -rf *.o
		rm -rf s21_cat