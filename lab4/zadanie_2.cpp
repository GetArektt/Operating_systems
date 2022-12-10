#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

using namespace std;
// dla 3500 sie wywala
int main() {
    int size;
	printf("Podaj wielkość\n");
    scanf("%i", &size);

	int*** a = (int***)malloc(size);
    int r;
	printf("Przed petlami, po alokacji\n");
	scanf("%i", &r);

	for (int i = 0; i < size; i++) {
		int** m = (int**)malloc(size);
		a[i] = m;

		for (int j = 0; j < size; j++) {
			m[j] = (int*)malloc(size);
            printf("Koniec petli %i\n", j);

		}
	}
	printf("Koniec\n");
	scanf("%i", &r);
}
