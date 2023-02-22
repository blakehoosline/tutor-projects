#include <stdio.h>
#include <stdlib.h>

int strlength(char str[], int length, int *first, int *last) {
    int max_length = 0;
    int start = 0;
    int finish = 0;
    int distinct = 0;
    int char_count[256] = {0};

    for (int i = 0; i < length; i++) {
        char_count[str[i]]++;

        if (char_count[str[i]] == 1) {
            distinct++;
        }

        while (distinct > 2) {
            char_count[str[start]]--;
            if (char_count[str[start]] == 0) {
                distinct--;
            }
            start++;
        }

        int curr_length = i - start + 1;
        if (curr_length > max_length) {
            max_length = curr_length;
            finish = i;
        }
    }

    *first = finish - max_length + 1;
    *last = finish;
    return max_length;
}

int main(int argc, char *argv[]) {
    int first, last;
    char str1[30] = "pqrpqrpqrpqrtttrrttrrrttpqrpqr";
    int n = strlength(str1, 30, &first, &last);
    printf("String 1 = %s\n", str1);
    printf("Longest substring with at most 2 distinct characters: %.*s\n", n, &str1[first]);

    char str2[21] = "abcbbcabbabbabcbbcbca";
    n = strlength(str2, 21, &first, &last);
    printf("String 2 = %s\n", str2);
    printf("Longest substring with at most 2 distinct characters: %.*s\n", n, &str2[first]);

    return 0;
}
