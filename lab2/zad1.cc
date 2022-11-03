#include <sys/types.h>
#include <sys/wait.h>
#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <fstream>
#include <iostream>

using namespace std;
int g;

int main() {
	ofstream f ("text");
	int st;
	int* dyn = (int*)malloc(sizeof(int));

	st = 1;
	(*dyn) = 1;
	g = 1;

	pid_t pid;
	pid = fork();

	if (pid == 0) {
		st = 2;
		(*dyn) = 2;
		g = 2;
	}

	usleep(5000);

	if (pid == 0)
		printf("Potomny:\nPid macierzysty: %i\nPid potomny: %i\nStatyczne: %i\nDynamiczne: %i\nGlobalne: %i\n\n", getppid(), getpid(), st, *dyn, g);
	else
		printf("Macierzysty:  \nPid macierzysty: %i\nPid potomny: %i\nStatyczne: %i\nDynamiczne: %i\nGlobalne: %i\n\n", getpid(), pid, st, *dyn, g);

	int r;

    if (pid == 0) {
        printf("Child Scanf: \n");
		scanf("%i", &r);
		printf("Child Scanf Complete\n");
	}
	else if (pid < 0) {
		fprintf(stderr, "Fork Failed");
		return 1;
	}	
	else {
        printf("Parent Scanf: \n");
		scanf("%i", &r);
		printf("Parent Complete\n");
		wait(NULL);
	}

	return 0;
}