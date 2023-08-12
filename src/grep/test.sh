#/bin/bash
DIFF_RES=""
COUNT=0
SUCCESS_COUNT=0
FAIL_COUNT=0
isS()
{   (( COUNT++ ))
    if [ "$DIFF_RES" == "Files 1 and 2 are identical" ]
    then 
    (( SUCCESS_COUNT++ ))
    echo "\033[32mSUCCESS\033[0m"
    else
    (( FAIL_COUNT++ ))
    echo "\033[31mFAIL\033[0m"
    
    fi
}
gcc s21_grep.c -o s21_grep 
echo "-------Тесты на один флаг и один или два файла-------"
echo "[0-9] test1.txt"
./s21_grep '[0-9]' test1.txt > 1 
grep '[0-9]' test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "[0-9] test1.txt test2.txt"
./s21_grep '[0-9]' test1.txt test2.txt> 1 
grep '[0-9]' test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-e [0-9] test1.txt"
./s21_grep -e '[0-9]' test1.txt > 1 
grep -e '[0-9]' test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-e [0-9] test1.txt test2.txt"
./s21_grep -e '[0-9]' test1.txt test2.txt> 1 
grep -e '[0-9]' test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-i [0-9] test1.txt"
./s21_grep -i '[0-9]' test1.txt > 1
grep -i '[0-9]' test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-i [0-9] test1.txt test2.txt"
./s21_grep -i '[0-9]' test1.txt test2.txt > 1
grep -i '[0-9]' test1.txt test2.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-s [0-9] notfile"
./s21_grep -s '[0-9]' notfile> 1
grep -s '[0-9]' notfile> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-s [0-9] test1.txt notfile"
./s21_grep -s '[0-9]' test1.txt notfile> 1
grep -s '[0-9]' test1.txt notfile> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-s [0-9] test1.txt test2.txt notfile"
./s21_grep -s '[0-9]' test1.txt test2.txt notfile> 1
grep -s '[0-9]' test1.txt test2.txt notfile> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-h [0-9] test1.txt"
./s21_grep -h '[0-9]' test1.txt > 1
grep -h '[0-9]' test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-h [0-9] test1.txt test2.txt"
./s21_grep -h '[0-9]' test1.txt test2.txt > 1
grep -h '[0-9]' test1.txt test2.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-c [0-9] test1.txt"
./s21_grep -c '[0-9]' test1.txt > 1
grep -c '[0-9]' test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-c [0-9] test1.txt test2.txt"
./s21_grep -c '[0-9]' test1.txt test2.txt> 1
grep -c '[0-9]' test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-l [0-9] test1.txt"
./s21_grep -l '[0-9]' test1.txt> 1
grep -l '[0-9]' test1.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-l [0-9] test1.txt test2.txt"
./s21_grep -l '[0-9]' test1.txt test2.txt> 1
grep -l '[0-9]' test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-v [0-9] test1.txt"
./s21_grep -v '[0-9]' test1.txt> 1
grep -v '[0-9]' test1.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-v [0-9] test1.txt test2.txt"
./s21_grep -v '[0-9]' test1.txt test2.txt> 1
grep -v '[0-9]' test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-n [0-9] test1.txt"
./s21_grep -n '[0-9]' test1.txt> 1
grep -n '[0-9]' test1.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-n [0-9] test1.txt est2.txt"
./s21_grep -n '[0-9]' test1.txt test2.txt> 1
grep -n '[0-9]' test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-f test3.txt test1.txt"
./s21_grep -f test3.txt test1.txt> 1
grep -f test3.txt test1.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-f test3.txt test1.txt test2.txt"
./s21_grep -f test3.txt test1.txt test2.txt> 1
grep -f test3.txt test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-o '[0-9]' test1.txt"
./s21_grep -o '[0-9]' test1.txt > 1
grep -o '[0-9]' test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-o '[0-9]' test1.txt test2.txt"
./s21_grep -o '[0-9]' test1.txt test2.txt > 1
grep -o '[0-9]' test1.txt test2.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-in [0-9] test1.txt"
./s21_grep -in '[0-9]' test1.txt> 1
grep -in '[0-9]' test1.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-in [0-9] test1.txt test2.txt"
./s21_grep -in '[0-9]' test1.txt test2.txt> 1
grep -in '[0-9]' test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "

echo "-iv [0-9] test1.txt"
./s21_grep -iv '[0-9]' test1.txt> 1
grep -iv '[0-9]' test1.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-iv [0-9] test1.txt test2.txt"
./s21_grep -iv '[0-9]' test1.txt test2.txt> 1
grep -iv '[0-9]' test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo " "


echo "Тесты на один флаг и три файла"
echo "'[0-9]' test1.txt test2.txt test3.txt"
./s21_grep '[0-9]' test1.txt test2.txt test3.txt > 1
grep '[0-9]' test1.txt test2.txt test3.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-i '[0-9]' test1.txt test2.txt test3.txt"
./s21_grep -i '[0-9]' test1.txt test2.txt test3.txt > 1
grep -i '[0-9]' test1.txt test2.txt test3.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-v '[0-9]' test1.txt test2.txt test3.txt"
./s21_grep -v '[0-9]' test1.txt test2.txt test3.txt> 1
grep -v '[0-9]' test1.txt test2.txt test3.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-c '[0-9]' test1.txt test2.txt test3.txt"
./s21_grep -c '[0-9]' test1.txt test2.txt test3.txt > 1
grep -c '[0-9]' test1.txt test2.txt test3.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-l '[0-9]' test1.txt test2.txt test3.txt"
./s21_grep -l '[0-9]' test1.txt test2.txt test3.txt > 1
grep -l '[0-9]' test1.txt test2.txt test3.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-h '[0-9]' test1.txt test2.txt test3.txt"
./s21_grep -h '[0-9]' test1.txt test2.txt test3.txt > 1
grep -h '[0-9]' test1.txt test2.txt test3.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-s '[0-9]' test1.txt test2.txt test3.txt"
./s21_grep -s '[0-9]' test1.txt test2.txt test3.txt > 1
grep -s '[0-9]' test1.txt test2.txt test3.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-hs '[0-9]' test1.txt test2.txt test3.txt"
./s21_grep -hs '[0-9]' test1.txt test2.txt test3.txt > 1
grep -hs "[0-9]" test1.txt test2.txt test3.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""



echo "Тесты на -vcn флаги и один-два файла "
echo ""
echo "-vcn '[0-9]' test1.txt"
./s21_grep -vcn "[0-9]" test1.txt > 1
grep -vcn "[0-9]" test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-vcn '[0-9]' test1.txt test2.txt"
./s21_grep -vcn "[0-9]" test1.txt test2.txt> 1
grep -vcn "[0-9]" test1.txt test2.txt> 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-vc '[0-9]' test1.txt"
./s21_grep -vc "[0-9]" test1.txt > 1
grep -vc "[0-9]" test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-vc '[0-9]' test1.txt test2.txt"
./s21_grep -vc "[0-9]" test1.txt test2.txt > 1
grep -vc "[0-9]" test1.txt test2.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-vn [0-9] test1.txt"
./s21_grep -vn "[0-9]" test1.txt > 1
grep -vn "[0-9]" test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-vn [0-9] test1.txt test2.txt"
./s21_grep -vn "[0-9]" test1.txt test2.txt > 1
grep -vn "[0-9]" test1.txt test2.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-nc '[0-9]' test1.txt"
./s21_grep -nc "[0-9]" test1.txt > 1
grep -nc "[0-9]" test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo "-nc '[0-9]' test1.txt test2.txt"
./s21_grep -nc "[0-9]" test1.txt test2.txt > 1
grep -nc "[0-9]" test1.txt test2.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "Тесты на -vcnl"
echo ""

echo "-vnl '[0-9]' test1.txt"
./s21_grep -vnl "[0-9]" test1.txt > 1
grep -vnl "[0-9]" test1.txt > 2
DIFF_RES="$(diff -s 1 2)"
isS
echo ""

echo "-------------------"
echo "-------------------"
echo "Total: $COUNT"
echo "SUCCESS: $SUCCESS_COUNT"
echo "FAIL: $FAIL_COUNT"
rm -rf 1
rm -rf 2