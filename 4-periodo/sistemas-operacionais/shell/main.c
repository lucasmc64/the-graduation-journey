#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <dirent.h>
#include <limits.h>
#include <time.h>

void clear_screen() {
    /*
        That's an ANSI escape code.
        "\e" is the escape character.
        The "\e[1;1H" part moves the cursor to position (1,1),and the "\e[2J" part clears the screen.

        Also GCC accepts "\x1b[" as escape sequence so "\x1b[2J" is equivalent to "\e[2J".
    */

    printf("\e[1;1H\e[2J");
    return;
}

void list_directory(char *dir_name) {
    DIR *d;
    d = opendir(dir_name);
    if(d == NULL) {
        printf("Falha na abertura do diretorio, tente novamente.");
        return;
    }

    while(1){
        struct dirent *entry;
        entry = readdir(d);
        if(entry == NULL) {
            break;
        }

        char *d_name = entry->d_name;

        if (entry->d_type & DT_DIR) {
            if(strcmp(d_name, ".") != 0 && strcmp(d_name, "..") != 0) {
                int path_length;
                char path[PATH_MAX];
                path_length = snprintf(path, PATH_MAX, "%s%s/", dir_name, d_name);
                if (path_length >= PATH_MAX) {
                    printf ("Caminho de diretorios grande demais.\n");
                    break;
                }
                printf("%s\n", path);
                list_directory(path);
            }
        } else {
            printf("%s%s\n", dir_name, d_name);
        }
    }

    closedir(d);
}

void current_date() {
    time_t tm = time(NULL);
    struct tm current_tm = *localtime(&tm);
    printf("%d/%d/%d\n",
           current_tm.tm_mday, current_tm.tm_mon + 1, current_tm.tm_year + 1900);
    return;
}

void current_hour() {
    time_t tm = time(NULL);
    struct tm current_tm = *localtime(&tm);
    printf("%d:%d:%d\n",
           current_tm.tm_hour, current_tm.tm_min, current_tm.tm_sec);
    return;
}

int main() {
    char command[5];

    while(1) {
        printf("Interface > ");
        scanf("%s", &command);

        if (strcmp(command, "cls")  == 0 || strcmp(command, "CLS")  == 0) {
            clear_screen();
        } else if (strcmp(command, "dir")  == 0 || strcmp(command, "DIR")  == 0) {
            list_directory("./"); // Pode melhorar
        } else if (strcmp(command, "date")  == 0 || strcmp(command, "DATE")  == 0) {
            current_date();
        } else if (strcmp(command, "time")  == 0 || strcmp(command, "TIME")  == 0) {
            current_hour();
        } else {
            printf("Comando nao reconhecido, tente novamente.\n");
        }
    }

    return 0;
}
