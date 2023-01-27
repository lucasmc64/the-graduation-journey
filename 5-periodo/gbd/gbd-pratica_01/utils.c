#include "utils.h"
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define LINE_MAX_LENGTH 128
#if defined(WIN32) || defined(__WIN32) || defined(__WIN32__) || defined(__NT__)
#include <windows.h>
#elif defined(__unix__)
#include <sys/sysinfo.h>
#endif

/*
** Trabalho R02-R04 GBD
** Integrantes:
** Mateus Carmo (11911BCC026)
** Lucas Marçal (11911BCC012)
** Lucas Mattos (11911BCC015)
** Eduardo Ribeiro (11911BCC057)
** Guilherme Henrique (11911BCC058)
**
** Instruções de Compilação: simplesmente compilar e linkar os 3 arquivos .c
*/

char* read_line()
{
    int position = 0; // Indice da entrada
    char* buffer = malloc(sizeof(char) * LINE_MAX_LENGTH); // Aloca-se tamanho máximo para comando
    char c;

    if(!buffer)
    {
        printf("Erro de alocação!\n");
        return NULL;
    }

    while(1)
    {
        c = getchar();
        if (c == EOF) // stdin foi fechado
        {
            free(buffer);
            return NULL;
        }

        // Adiciona caractere de stdin no buffer. Se c for \n, finalizamos a string com \0 e retornamos o ponteiro.
        if(c == '\n')
        {
            buffer[position] = '\0';
            return buffer;
        }
        else
        {
            buffer[position++] = c;
        }

        // Corta entradas que excedam CMD_MAX_SIZE
        if(position + 1 >= LINE_MAX_LENGTH)
        {
            int ch;
            while((ch = getchar()) != '\n' && ch != EOF); // Remove todos os caracteres depois de LINE_MAX_SIZE do buffer stdin
            buffer[position] = '\0';
            return buffer;
        }
    }
}

int file_exists(const char* path) {
    FILE* file_test;
    if ((file_test = fopen(path, "r")))
    {
        fclose(file_test);
        return 1;
    }
    return 0;
}

unsigned long long get_total_sys_memory()
{
#if defined(WIN32) || defined(__WIN32) || defined(__WIN32__) || defined(__NT__)
    MEMORYSTATUSEX status;
    status.dwLength = sizeof(status);
    GlobalMemoryStatusEx(&status);
    return status.ullTotalPhys;
#elif defined(__unix__)
    struct sysinfo info;
    sysinfo(&info);
    return info.totalram;
#endif
}

// pego em: http://www.guyrutenberg.com/2007/09/22/profiling-code-using-clock_gettime/
struct timespec diff(struct timespec start, struct timespec end)
{
	struct timespec temp;
	if ((end.tv_nsec-start.tv_nsec)<0) {
		temp.tv_sec = end.tv_sec-start.tv_sec-1;
		temp.tv_nsec = 1000000000+end.tv_nsec-start.tv_nsec;
	} else {
		temp.tv_sec = end.tv_sec-start.tv_sec;
		temp.tv_nsec = end.tv_nsec-start.tv_nsec;
	}
	return temp;
}
