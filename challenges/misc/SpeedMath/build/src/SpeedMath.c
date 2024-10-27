#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <unistd.h>
#include <sys/time.h>

#define NUM_QUESTIONS 100
#define TIME_LIMIT 2

void generate_question(int *num1, int *num2, char *op) {
    *num1 = rand() % 9000 + 1000; // 生成四位数
    *num2 = rand() % 9000 + 1000; // 生成四位数
    int operation = rand() % 3;
    switch (operation) {
        case 0:
            *op = '+';
            break;
        case 1:
            *op = '-';
            break;
        case 2:
            *op = '*';
            break;
    }
}

int get_correct_answer(int num1, int num2, char op) {
    switch (op) {
        case '+':
            return num1 + num2;
        case '-':
            return num1 - num2;
        case '*':
            return num1 * num2;
        default:
            return 0;
    }
}

int main() {
    srand(time(NULL));
    int correct_answers = 0;

    for (int i = 0; i < NUM_QUESTIONS; i++) {
        int num1, num2, user_answer, correct_answer;
        char op;
        generate_question(&num1, &num2, &op);
        correct_answer = get_correct_answer(num1, num2, op);

        printf("Question %d: %d %c %d = ", i + 1, num1, op, num2);
        fflush(stdout);

        struct timeval start, end;
        gettimeofday(&start, NULL);

        fd_set set;
        struct timeval timeout;
        FD_ZERO(&set);
        FD_SET(STDIN_FILENO, &set);
        timeout.tv_sec = TIME_LIMIT;
        timeout.tv_usec = 0;

        int rv = select(1, &set, NULL, NULL, &timeout);
        if(rv == -1) {
            perror("select");
            return 1;
        } else if(rv == 0) {
            printf("\nTime exceeded! You took too long to answer.\n");
            break;
        } else {
            if (scanf("%d", &user_answer) != 1) {
                printf("Invalid input. Exiting.\n");
                return 1;
            }
        }

        gettimeofday(&end, NULL);
        double time_taken = (end.tv_sec - start.tv_sec) + (end.tv_usec - start.tv_usec) / 1000000.0;

        if (user_answer == correct_answer) {
            correct_answers++;
        } else {
            printf("Wrong answer. The correct answer was %d.\n", correct_answer);
            break;
        }
    }

    if (correct_answers == NUM_QUESTIONS) {
        printf("Congratulations! You answered all questions correctly.\n");
        // 输出flag，假设flag保存在当前目录的flag文件中
        FILE *flag_file = fopen("flag", "r");
        if (flag_file) {
            char flag[100];
            if (fgets(flag, sizeof(flag), flag_file) != NULL) {
                printf("Your flag is: %s\n", flag);
            } else {
                printf("Failed to read the flag.\n");
            }
            fclose(flag_file);
        } else {
            printf("Flag file not found.\n");
        }
    } else {
        printf("You answered %d questions correctly. Better luck next time!\n", correct_answers);
    }

    return 0;
}
