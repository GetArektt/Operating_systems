#include <iostream>
#include<unistd.h>
#include <stdlib.h>

using namespace std;


int main()
{
	printf("Hello, I'm an system program!\n");
    getchar();

    system("ls -al /var/log/ | lolcat");
    return 0;
}