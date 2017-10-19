//Example 3.2.2
#include <stdio.h>
#include "../common/book.h"

__global__ void multiply(int a, int b, int *c) {
	*c = a * b;
}

int main(void) {
	int c;
	int *dev_c;

	HANDLE_ERROR(cudaMalloc((void**)&dev_c, sizeof(int)));

	multiply <<< 1, 1 >>> (4, 11, dev_c);

	HANDLE_ERROR(cudaMemcpy(&c, dev_c, sizeof(int), cudaMemcpyDeviceToHost));

	printf("4 * 11 = %d\n", c);

	cudaFree(dev_c);
	return 0;
}