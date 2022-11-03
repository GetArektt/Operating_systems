
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>

#include <iostream>

using namespace std;


int main() {
	pid_t pid;
	pid = fork();


	getchar();

	printf("Child: %i\nParent: %i\n", getppid(), getpid());
    system("ps aux | grep -e /lab2/child");
	return 0;
}