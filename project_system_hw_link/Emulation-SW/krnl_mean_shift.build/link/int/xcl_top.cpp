#include "libspir_types.h"
#include "hls_stream.h"
#include "xcl_top_defines.h"
#include "ap_axi_sdata.h"
#define EXPORT_PIPE_SYMBOLS 1
#include "cpu_pipes.h"
#undef EXPORT_PIPE_SYMBOLS
#include "xcl_half.h"
#include <cstddef>
#include <vector>
#include <complex>
#include <pthread.h>
using namespace std;

extern "C" {

void mean_shift_accel(size_t img_inp, size_t tlx, size_t tly, size_t obj_height, size_t obj_width, size_t dx, size_t dy, size_t track, unsigned int frame_status, unsigned int no_objects, unsigned int no_of_iterations, unsigned int rows, unsigned int cols);

static pthread_mutex_t __xlnx_cl_mean_shift_accel_mutex = PTHREAD_MUTEX_INITIALIZER;
void __stub____xlnx_cl_mean_shift_accel(char **argv) {
  void **args = (void **)argv;
  size_t img_inp = *((size_t*)args[0+1]);
  size_t tlx = *((size_t*)args[1+1]);
  size_t tly = *((size_t*)args[2+1]);
  size_t obj_height = *((size_t*)args[3+1]);
  size_t obj_width = *((size_t*)args[4+1]);
  size_t dx = *((size_t*)args[5+1]);
  size_t dy = *((size_t*)args[6+1]);
  size_t track = *((size_t*)args[7+1]);
  unsigned int frame_status = *((unsigned int*)args[8+1]);
  unsigned int no_objects = *((unsigned int*)args[9+1]);
  unsigned int no_of_iterations = *((unsigned int*)args[10+1]);
  unsigned int rows = *((unsigned int*)args[11+1]);
  unsigned int cols = *((unsigned int*)args[12+1]);
 pthread_mutex_lock(&__xlnx_cl_mean_shift_accel_mutex);
  mean_shift_accel(img_inp, tlx, tly, obj_height, obj_width, dx, dy, track, frame_status, no_objects, no_of_iterations, rows, cols);
  pthread_mutex_unlock(&__xlnx_cl_mean_shift_accel_mutex);
}
}
