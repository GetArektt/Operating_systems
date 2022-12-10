#include <stdlib.h>
#include <stdio.h>

using namespace std;

//cd "/home/arek/astudia/sysopy/lab4/" && g++ zadanie_1.cpp -o zadanie_1 && "/home/arek/astudia/sysopy/lab4/"zadanie_1
void statyczna() {
	printf("Statyczna\n");
	double tablica[1000000];
	for (int i = 0; i < 1000000; i++) {
		tablica[i] = 1;
	}
	int r;
	scanf("%i", &r);
    printf("Zwolniono pamiec statyczna\n");
}

void dynamiczna() {
	printf("Alokacja dynamiczna\n");

	void* p = malloc(1000000000000);
	int r;
	scanf("%i", &r);

	free(p);
	printf("Zwolniono pamiec dynamiczna\n");
}

int main() {
	statyczna();
	
	dynamiczna();
	printf("Przed koncem\n");
	int k;
	scanf("%i", &k);
}
