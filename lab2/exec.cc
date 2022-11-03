#include <iostream>
#include<unistd.h>

using namespace std;


int main()
{
	printf("Hello, I'm an exec program!\n");
    getchar();

    execvp("/home/arek/studia/sysopy/lab2/another",NULL);

    return 0;
}