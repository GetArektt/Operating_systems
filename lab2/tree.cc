#include <sys.types.h>
#include <stdio.h>
#include <unistd.h>

int main(){
	printf("Pid: %d\n", getpid());
	pid_t child;
	grandchild = fork();
	if(grandchild == 0){
		printf("grandchild PID: %d\n Parent: PID: %d\n", getpid(),getppid());

	}
	else{
		pid_t anotherchild;
		anotherchild = fork();
		if(anotherchild == 0){
			printf("2. Child PID: %d\n Parent PID: %d\n", getpid(), getppid());
		}
	getchar();
	return 0;
	}
}
