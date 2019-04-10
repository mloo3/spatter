/*! \file layout
 \date July 5, 2018
 \author Jeffrey Young 
 \brief Header file for OpenCL backend
*/

#ifndef FPGA_BACKEND_H
#define FPGA_BACKEND_H

#include "../opencl/cl-helper.h"
#include "sgtype.h"
#include "sgbuf.h"

    cl_context context;
    cl_command_queue queue;
    cl_device_id device;
    cl_mem_flags flags; 
    cl_kernel sgp;
    
    cl_event e;

void initialize_dev_fpga(char* platform_string, char* device_string);

void create_dev_buffers_fpga(sgDataBuf *source, sgDataBuf *target, sgIndexBuf *si, sgIndexBuf *ti, size_t block_len);

#endif //end OCL_BACKEND
