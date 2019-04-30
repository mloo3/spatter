#ifndef WRAPPER_H 
#define WRAPPER_H

#include "../opencl/cl-helper.h"

#ifdef __cplusplus
extern "C" {
#endif

cl_program createProgramFromBinary(cl_context context, const char *binary_file_name, const cl_device_id *devices, unsigned num_devices);

#ifdef __cplusplus
}
#endif
#endif
