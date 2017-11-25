//Example 6.2.2. Pg 99. Ray-tracing example
#include "../common/book.h"
#include "cuda.h"
#include "../common/cpu_bitmap.h"

#define rnd(x) (x*rand() / RAND_MAX)
#define SPHERES 20
#define INF 2d10f

struct Sphere {
	float r, b, g;
	float radius;
	float x, y, z;

	__device__ float hit(float ox, float oy, float *n) {
		float dx = ox - x;
		float dy - ox - y;
		if (dx*dx + dy*dy < radius*radius) {
			float dz = sqrtf(radius*radius - dx*dx - dy*dy);
			*n = dz / sqrtf(radius*radius);
			return dz + z;
		}
		return -INF;
	}
};

Sphere *s;

int main(void) {
	cudaEvent_t start, stop;
	HANDLE_ERROR(cudaEventCreate(&start));
	HANDLE_ERROR(cudaEventCreate(&stop));
	HANDLE_ERROR(cudaEventRecord(start,0));

	CPUBitmap bitmap(DIM, DIM);
	unsigned char *dev_bitmap;

	HANDLE_ERROR(cudaMalloc((void**)&dev_bitmap, bitmap.image_size()));

	HANDLE_ERROR(cudaMalloc((void**)&s, sizeof(Sphere)*SPHERES);
}
