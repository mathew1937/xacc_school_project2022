// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef XMEAN_SHIFT_ACCEL_H
#define XMEAN_SHIFT_ACCEL_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xmean_shift_accel_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
    u16 DeviceId;
    u32 Control_BaseAddress;
} XMean_shift_accel_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XMean_shift_accel;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XMean_shift_accel_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XMean_shift_accel_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XMean_shift_accel_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XMean_shift_accel_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
int XMean_shift_accel_Initialize(XMean_shift_accel *InstancePtr, u16 DeviceId);
XMean_shift_accel_Config* XMean_shift_accel_LookupConfig(u16 DeviceId);
int XMean_shift_accel_CfgInitialize(XMean_shift_accel *InstancePtr, XMean_shift_accel_Config *ConfigPtr);
#else
int XMean_shift_accel_Initialize(XMean_shift_accel *InstancePtr, const char* InstanceName);
int XMean_shift_accel_Release(XMean_shift_accel *InstancePtr);
#endif

void XMean_shift_accel_Start(XMean_shift_accel *InstancePtr);
u32 XMean_shift_accel_IsDone(XMean_shift_accel *InstancePtr);
u32 XMean_shift_accel_IsIdle(XMean_shift_accel *InstancePtr);
u32 XMean_shift_accel_IsReady(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Continue(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_EnableAutoRestart(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_DisableAutoRestart(XMean_shift_accel *InstancePtr);

void XMean_shift_accel_Set_img_inp(XMean_shift_accel *InstancePtr, u64 Data);
u64 XMean_shift_accel_Get_img_inp(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_tlx(XMean_shift_accel *InstancePtr, u64 Data);
u64 XMean_shift_accel_Get_tlx(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_tly(XMean_shift_accel *InstancePtr, u64 Data);
u64 XMean_shift_accel_Get_tly(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_obj_height(XMean_shift_accel *InstancePtr, u64 Data);
u64 XMean_shift_accel_Get_obj_height(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_obj_width(XMean_shift_accel *InstancePtr, u64 Data);
u64 XMean_shift_accel_Get_obj_width(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_dx(XMean_shift_accel *InstancePtr, u64 Data);
u64 XMean_shift_accel_Get_dx(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_dy(XMean_shift_accel *InstancePtr, u64 Data);
u64 XMean_shift_accel_Get_dy(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_track(XMean_shift_accel *InstancePtr, u64 Data);
u64 XMean_shift_accel_Get_track(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_frame_status(XMean_shift_accel *InstancePtr, u32 Data);
u32 XMean_shift_accel_Get_frame_status(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_no_objects(XMean_shift_accel *InstancePtr, u32 Data);
u32 XMean_shift_accel_Get_no_objects(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_no_of_iterations(XMean_shift_accel *InstancePtr, u32 Data);
u32 XMean_shift_accel_Get_no_of_iterations(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_rows(XMean_shift_accel *InstancePtr, u32 Data);
u32 XMean_shift_accel_Get_rows(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_Set_cols(XMean_shift_accel *InstancePtr, u32 Data);
u32 XMean_shift_accel_Get_cols(XMean_shift_accel *InstancePtr);

void XMean_shift_accel_InterruptGlobalEnable(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_InterruptGlobalDisable(XMean_shift_accel *InstancePtr);
void XMean_shift_accel_InterruptEnable(XMean_shift_accel *InstancePtr, u32 Mask);
void XMean_shift_accel_InterruptDisable(XMean_shift_accel *InstancePtr, u32 Mask);
void XMean_shift_accel_InterruptClear(XMean_shift_accel *InstancePtr, u32 Mask);
u32 XMean_shift_accel_InterruptGetEnabled(XMean_shift_accel *InstancePtr);
u32 XMean_shift_accel_InterruptGetStatus(XMean_shift_accel *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
