#pragma OPENCL EXTENSION cl_khr_fp64 : enable
__kernel void scatter1(__global double* restrict target, 
                     __global double* restrict source, 
                     __global long* restrict ti,
                     __global long* restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot;
    __global double* sr = source + os;
    __global long *tir  = ti     + oi;
    tr[tir[gid]] = sr[gid];
}

__kernel void scatter2(__global double* restrict target, 
                     __global double2*  restrict source, 
                     __global long2*   restrict ti,
                     __global long2*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot; 
    __global double2*  sr = source + os /2;     
    __global long2*  tir = ti     + oi / 2;

    double2 buf = sr[gid];
    long2   idx = tir[gid];
    tr[idx.s0] = buf.s0;
    tr[idx.s1] = buf.s1;
}

__kernel void scatter4(__global double* restrict target, 
                     __global double4*  restrict source, 
                     __global long4*   restrict ti,
                     __global long4*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot; 
    __global double4*  sr = source + os / 4;     
    __global long4*  tir = ti     + oi / 4;

    double4 buf = sr[gid];
    long4 idx = tir[gid];
    tr[idx.s0] = buf.s0;
    tr[idx.s1] = buf.s1;
    tr[idx.s2] = buf.s2;
    tr[idx.s3] = buf.s3;
}

__kernel void scatter8(__global double* restrict target, 
                     __global double8*  restrict source, 
                     __global long8*   restrict ti,
                     __global long8*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot; 
    __global double8*  sr = source + os / 8;     
    __global long8*  tir = ti     + oi / 8;

    double8 buf = sr[gid];
    long8 idx = tir[gid];
    tr[idx.s0] = buf.s0;
    tr[idx.s1] = buf.s1;
    tr[idx.s2] = buf.s2;
    tr[idx.s3] = buf.s3;
    tr[idx.s4] = buf.s4;
    tr[idx.s5] = buf.s5;
    tr[idx.s6] = buf.s6;
    tr[idx.s7] = buf.s7;
}

__kernel void scatter16(__global double* restrict target, 
                     __global double16*   restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot; 
    __global double16*  sr = source + os / 16;     
    __global long16*  tir = ti     + oi / 16;

    double16 buf = sr[gid];
    long16 idx = tir[gid];
    tr[idx.s0] = buf.s0;
    tr[idx.s1] = buf.s1;
    tr[idx.s2] = buf.s2;
    tr[idx.s3] = buf.s3;
    tr[idx.s4] = buf.s4;
    tr[idx.s5] = buf.s5;
    tr[idx.s6] = buf.s6;
    tr[idx.s7] = buf.s7;
    tr[idx.s8] = buf.s8;
    tr[idx.s9] = buf.s9;
    tr[idx.sa] = buf.sa;
    tr[idx.sb] = buf.sb;
    tr[idx.sc] = buf.sc;
    tr[idx.sd] = buf.sd;
    tr[idx.se] = buf.se;
    tr[idx.sf] = buf.sf;
}

__kernel void scatter32(__global double* restrict target, 
                     __global double16*   restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = 2*get_global_id(0);
    __global double* tr = target + ot; 
    __global double16*  sr = source + os / 32;     
    __global long16*  tir = ti     + oi / 32;

    double16 buf[2];
    long16 idx[2];

    for(int i = 0; i < 2; i++){
        buf[i] = sr[gid+i];
        idx[i] = tir[gid+i];
    }

    for(int i = 0; i < 2; i++){
        tr[idx[i].s0] = buf[i].s0;
        tr[idx[i].s1] = buf[i].s1;
        tr[idx[i].s2] = buf[i].s2;
        tr[idx[i].s3] = buf[i].s3;
        tr[idx[i].s4] = buf[i].s4;
        tr[idx[i].s5] = buf[i].s5;
        tr[idx[i].s6] = buf[i].s6;
        tr[idx[i].s7] = buf[i].s7;
        tr[idx[i].s8] = buf[i].s8;
        tr[idx[i].s9] = buf[i].s9;
        tr[idx[i].sa] = buf[i].sa;
        tr[idx[i].sb] = buf[i].sb;
        tr[idx[i].sc] = buf[i].sc;
        tr[idx[i].sd] = buf[i].sd;
        tr[idx[i].se] = buf[i].se;
        tr[idx[i].sf] = buf[i].sf;
    }
}

__kernel void scatter64(__global double* restrict target, 
                     __global double16*   restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = 4*get_global_id(0);
    __global double* tr = target + ot; 
    __global double16*  sr = source + os / 64;     
    __global long16*  tir = ti     + oi / 64;

    double16 buf[4];
    long16 idx[4];

    for(int i = 0; i < 4; i++){
        buf[i] = sr[gid+i];
        idx[i] = tir[gid+i];
    }
    for(int i = 0; i < 4; i++){
        tr[idx[i].s0] = buf[i].s0;
        tr[idx[i].s1] = buf[i].s1;
        tr[idx[i].s2] = buf[i].s2;
        tr[idx[i].s3] = buf[i].s3;
        tr[idx[i].s4] = buf[i].s4;
        tr[idx[i].s5] = buf[i].s5;
        tr[idx[i].s6] = buf[i].s6;
        tr[idx[i].s7] = buf[i].s7;
        tr[idx[i].s8] = buf[i].s8;
        tr[idx[i].s9] = buf[i].s9;
        tr[idx[i].sa] = buf[i].sa;
        tr[idx[i].sb] = buf[i].sb;
        tr[idx[i].sc] = buf[i].sc;
        tr[idx[i].sd] = buf[i].sd;
        tr[idx[i].se] = buf[i].se;
        tr[idx[i].sf] = buf[i].sf;
    }
}
__kernel void gather1(__global double* restrict target, 
                     __global double* restrict source, 
                     __global long* restrict ti,
                     __global long* restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot;
    __global double* sr = source + os;
    __global long *sir  = si     + oi;
    tr[gid] = sr[sir[gid]];
}

__kernel void gather2(__global double2* restrict target, 
                     __global double*  restrict source, 
                     __global long2*   restrict ti,
                     __global long2*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double2* tr = target + ot / 2; 
    __global double*  sr = source + os;     
    __global long2*  sir = si     + oi / 2;

    double2 buf = 0;
    long2 idx = sir[gid];
    buf.s0 = sr[idx.s0];
    buf.s1 = sr[idx.s1];

    tr[gid] = buf;
}

__kernel void gather4(__global double4* restrict target, 
                     __global double*  restrict source, 
                     __global long4*   restrict ti,
                     __global long4*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double4* tr = target + ot / 4; 
    __global double*  sr = source + os;     
    __global long4*  sir = si     + oi / 4;

    double4 buf = 0;
    long4 idx = sir[gid];
    buf.s0 = sr[idx.s0];
    buf.s1 = sr[idx.s1];
    buf.s2 = sr[idx.s2];
    buf.s3 = sr[idx.s3];

    tr[gid] = buf;
}

__kernel void gather8(__global double8* restrict target, 
                     __global double*  restrict source, 
                     __global long8*   restrict ti,
                     __global long8*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double8* tr = target + ot / 8; 
    __global double*  sr = source + os;     
    __global long8*  sir = si     + oi / 8;

    double8 buf = 0;
    long8 idx = sir[gid];
    buf.s0 = sr[idx.s0];
    buf.s1 = sr[idx.s1];
    buf.s2 = sr[idx.s2];
    buf.s3 = sr[idx.s3];
    buf.s4 = sr[idx.s4];
    buf.s5 = sr[idx.s5];
    buf.s6 = sr[idx.s6];
    buf.s7 = sr[idx.s7];

    tr[gid] = buf;
}

__kernel void gather16(__global double16* restrict target, 
                     __global double*   restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double16* tr = target + ot / 16; 
    __global double*  sr = source + os;     
    __global long16*  sir = si     + oi / 16;

    double16 buf = 0;
    long16 idx = sir[gid];
    buf.s0 = sr[idx.s0];
    buf.s1 = sr[idx.s1];
    buf.s2 = sr[idx.s2];
    buf.s3 = sr[idx.s3];
    buf.s4 = sr[idx.s4];
    buf.s5 = sr[idx.s5];
    buf.s6 = sr[idx.s6];
    buf.s7 = sr[idx.s7];
    buf.s8 = sr[idx.s8];
    buf.s9 = sr[idx.s9];
    buf.sa = sr[idx.sa];
    buf.sb = sr[idx.sb];
    buf.sc = sr[idx.sc];
    buf.sd = sr[idx.sd];
    buf.se = sr[idx.se];
    buf.sf = sr[idx.sf];

    tr[gid] = buf;
}

__kernel void gather32(__global double16* restrict target, 
                     __global double*   restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = 2*get_global_id(0);
    __global double16* tr = target + ot / 32; 
    __global double*  sr = source + os;     
    __global long16*  sir = si     + oi / 32;

    double16 buf[2]; 
    long16 idx[2]; 
    
    for(int i = 0; i < 2; i++){
        buf[i] = 0;
        idx[i] = sir[gid+i];
    }
    
    for(int i = 0; i < 2; i++){
        buf[i].s0 = sr[idx[i].s0];
        buf[i].s1 = sr[idx[i].s1];
        buf[i].s2 = sr[idx[i].s2];
        buf[i].s3 = sr[idx[i].s3];
        buf[i].s4 = sr[idx[i].s4];
        buf[i].s5 = sr[idx[i].s5];
        buf[i].s6 = sr[idx[i].s6];
        buf[i].s7 = sr[idx[i].s7];
        buf[i].s8 = sr[idx[i].s8];
        buf[i].s9 = sr[idx[i].s9];
        buf[i].sa = sr[idx[i].sa];
        buf[i].sb = sr[idx[i].sb];
        buf[i].sc = sr[idx[i].sc];
        buf[i].sd = sr[idx[i].sd];
        buf[i].se = sr[idx[i].se];
        buf[i].sf = sr[idx[i].sf];
    }

    for(int i = 0; i < 2; i++){
        tr[gid+i] = buf[i];
    }
}

__kernel void gather64(__global double16* restrict target, 
                     __global double*   restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = 4*get_global_id(0);
    __global double16* tr = target + ot / 64; 
    __global double*  sr = source + os;     
    __global long16*  sir = si     + oi / 64;

    double16 buf[4]; 
    long16 idx[4]; 
    
    for(int i = 0; i < 4; i++){
        buf[i] = 0;
        idx[i] = sir[gid+i];
    }
    
    for(int i = 0; i < 4; i++){
        buf[i].s0 = sr[idx[i].s0];
        buf[i].s1 = sr[idx[i].s1];
        buf[i].s2 = sr[idx[i].s2];
        buf[i].s3 = sr[idx[i].s3];
        buf[i].s4 = sr[idx[i].s4];
        buf[i].s5 = sr[idx[i].s5];
        buf[i].s6 = sr[idx[i].s6];
        buf[i].s7 = sr[idx[i].s7];
        buf[i].s8 = sr[idx[i].s8];
        buf[i].s9 = sr[idx[i].s9];
        buf[i].sa = sr[idx[i].sa];
        buf[i].sb = sr[idx[i].sb];
        buf[i].sc = sr[idx[i].sc];
        buf[i].sd = sr[idx[i].sd];
        buf[i].se = sr[idx[i].se];
        buf[i].sf = sr[idx[i].sf];
    }

    for(int i = 0; i < 4; i++){
        tr[gid+i] = buf[i];
    }
}

__kernel void sg1(__global double* restrict target, 
                     __global double* restrict source, 
                     __global long* restrict ti,
                     __global long* restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot;
    __global double* sr = source + os;
    __global long *sir  = si     + oi;
    __global long *tir  = ti     + oi;
    tr[tir[gid]] = sr[sir[gid]];
}

__kernel void sg2(__global double* restrict target, 
                     __global double*  restrict source, 
                     __global long2*   restrict ti,
                     __global long2*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot; 
    __global double*  sr = source + os;     
    __global long2*  sir = si     + oi / 2;
    __global long2*  tir = ti     + oi / 2;

    long2 sidx = sir[gid];
    long2 tidx = tir[gid];
    tr[tidx.s0] = sr[sidx.s0];
    tr[tidx.s1] = sr[sidx.s1];
}

__kernel void sg4(__global double* restrict target, 
                     __global double*  restrict source, 
                     __global long4*   restrict ti,
                     __global long4*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot; 
    __global double*  sr = source + os;     
    __global long4*  sir = si     + oi / 4;
    __global long4*  tir = ti     + oi / 4;

    long4 sidx = sir[gid];
    long4 tidx = tir[gid];
    tr[tidx.s0] = sr[sidx.s0];
    tr[tidx.s1] = sr[sidx.s1];
    tr[tidx.s2] = sr[sidx.s2];
    tr[tidx.s3] = sr[sidx.s3];
}

__kernel void sg8(__global double* restrict target, 
                     __global double*  restrict source, 
                     __global long8*   restrict ti,
                     __global long8*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot; 
    __global double*  sr = source + os;     
    __global long8*  sir = si     + oi / 8;
    __global long8*  tir = ti     + oi / 8;

    long8 sidx = sir[gid];
    long8 tidx = tir[gid];
    tr[tidx.s0] = sr[sidx.s0];
    tr[tidx.s1] = sr[sidx.s1];
    tr[tidx.s2] = sr[sidx.s2];
    tr[tidx.s3] = sr[sidx.s3];
    tr[tidx.s4] = sr[sidx.s4];
    tr[tidx.s5] = sr[sidx.s5];
    tr[tidx.s6] = sr[sidx.s6];
    tr[tidx.s7] = sr[sidx.s7];
}

__kernel void sg16(__global double* restrict target, 
                     __global double*  restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = get_global_id(0);
    __global double* tr = target + ot; 
    __global double*  sr = source + os;     
    __global long16*  sir = si     + oi / 16;
    __global long16*  tir = ti     + oi / 16;

    long16 sidx = sir[gid];
    long16 tidx = tir[gid];
    tr[tidx.s0] = sr[sidx.s0];
    tr[tidx.s1] = sr[sidx.s1];
    tr[tidx.s2] = sr[sidx.s2];
    tr[tidx.s3] = sr[sidx.s3];
    tr[tidx.s4] = sr[sidx.s4];
    tr[tidx.s5] = sr[sidx.s5];
    tr[tidx.s6] = sr[sidx.s6];
    tr[tidx.s7] = sr[sidx.s7];
    tr[tidx.s8] = sr[sidx.s8];
    tr[tidx.s9] = sr[sidx.s9];
    tr[tidx.sa] = sr[sidx.sa];
    tr[tidx.sb] = sr[sidx.sb];
    tr[tidx.sc] = sr[sidx.sc];
    tr[tidx.sd] = sr[sidx.sd];
    tr[tidx.se] = sr[sidx.se];
    tr[tidx.sf] = sr[sidx.sf];
}

__kernel void sg32(__global double* restrict target, 
                     __global double*  restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = 2*get_global_id(0);
    __global double* tr = target + ot; 
    __global double*  sr = source + os;     
    __global long16*  sir = si     + oi / 32;
    __global long16*  tir = ti     + oi / 32;

    long16 sidx[2]; 
    long16 tidx[2];
    
    for(int i = 0; i < 2; i++){
        sidx[i] = sir[gid+i];
        tidx[i] = tir[gid+i];
    }

    for(int i = 0; i < 2; i++){ 
        tr[tidx[i].s0] = sr[sidx[i].s0];
        tr[tidx[i].s1] = sr[sidx[i].s1];
        tr[tidx[i].s2] = sr[sidx[i].s2];
        tr[tidx[i].s3] = sr[sidx[i].s3];
        tr[tidx[i].s4] = sr[sidx[i].s4];
        tr[tidx[i].s5] = sr[sidx[i].s5];
        tr[tidx[i].s6] = sr[sidx[i].s6];
        tr[tidx[i].s7] = sr[sidx[i].s7];
        tr[tidx[i].s8] = sr[sidx[i].s8];
        tr[tidx[i].s9] = sr[sidx[i].s9];
        tr[tidx[i].sa] = sr[sidx[i].sa];
        tr[tidx[i].sb] = sr[sidx[i].sb];
        tr[tidx[i].sc] = sr[sidx[i].sc];
        tr[tidx[i].sd] = sr[sidx[i].sd];
        tr[tidx[i].se] = sr[sidx[i].se];
        tr[tidx[i].sf] = sr[sidx[i].sf];
    }
}

__kernel void sg64(__global double* restrict target, 
                     __global double*  restrict source, 
                     __global long16*   restrict ti,
                     __global long16*   restrict si,
                     long ot, long os, long oi)
{
    int gid = 4*get_global_id(0);
    __global double* tr = target + ot; 
    __global double*  sr = source + os;     
    __global long16*  sir = si     + oi / 64;
    __global long16*  tir = ti     + oi / 64;

    long16 sidx[4]; 
    long16 tidx[4];
    
    for(int i = 0; i < 4; i++){
        sidx[i] = sir[gid+i];
        tidx[i] = tir[gid+i];
    }

    for(int i = 0; i < 4; i++){ 
        tr[tidx[i].s0] = sr[sidx[i].s0];
        tr[tidx[i].s1] = sr[sidx[i].s1];
        tr[tidx[i].s2] = sr[sidx[i].s2];
        tr[tidx[i].s3] = sr[sidx[i].s3];
        tr[tidx[i].s4] = sr[sidx[i].s4];
        tr[tidx[i].s5] = sr[sidx[i].s5];
        tr[tidx[i].s6] = sr[sidx[i].s6];
        tr[tidx[i].s7] = sr[sidx[i].s7];
        tr[tidx[i].s8] = sr[sidx[i].s8];
        tr[tidx[i].s9] = sr[sidx[i].s9];
        tr[tidx[i].sa] = sr[sidx[i].sa];
        tr[tidx[i].sb] = sr[sidx[i].sb];
        tr[tidx[i].sc] = sr[sidx[i].sc];
        tr[tidx[i].sd] = sr[sidx[i].sd];
        tr[tidx[i].se] = sr[sidx[i].se];
        tr[tidx[i].sf] = sr[sidx[i].sf];
    }
}
