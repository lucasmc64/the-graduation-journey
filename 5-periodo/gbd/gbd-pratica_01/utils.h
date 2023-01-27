#ifndef UTILS_H_
#define UTILS_H_

char* read_line();
int file_exists(const char* path);
unsigned long long get_total_sys_memory();
struct timespec diff(struct timespec start, struct timespec end);

#endif // UTILS_H_
