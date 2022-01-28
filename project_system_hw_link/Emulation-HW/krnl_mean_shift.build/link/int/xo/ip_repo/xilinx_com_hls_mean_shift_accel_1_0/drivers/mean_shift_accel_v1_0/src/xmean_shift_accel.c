// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
/***************************** Include Files *********************************/
#include "xmean_shift_accel.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XMean_shift_accel_CfgInitialize(XMean_shift_accel *InstancePtr, XMean_shift_accel_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XMean_shift_accel_Start(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL, Data | 0x01);
}

u32 XMean_shift_accel_IsDone(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 1) & 0x1;
}

u32 XMean_shift_accel_IsIdle(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL);
    return (Data >> 2) & 0x1;
}

u32 XMean_shift_accel_IsReady(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL);
    // check ap_start to see if the pcore is ready for next input
    return !(Data & 0x1);
}

void XMean_shift_accel_Continue(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL) & 0x80;
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL, Data | 0x10);
}

void XMean_shift_accel_EnableAutoRestart(XMean_shift_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL, 0x80);
}

void XMean_shift_accel_DisableAutoRestart(XMean_shift_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_AP_CTRL, 0);
}

void XMean_shift_accel_Set_img_inp(XMean_shift_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IMG_INP_DATA, (u32)(Data));
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IMG_INP_DATA + 4, (u32)(Data >> 32));
}

u64 XMean_shift_accel_Get_img_inp(XMean_shift_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IMG_INP_DATA);
    Data += (u64)XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IMG_INP_DATA + 4) << 32;
    return Data;
}

void XMean_shift_accel_Set_tlx(XMean_shift_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TLX_DATA, (u32)(Data));
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TLX_DATA + 4, (u32)(Data >> 32));
}

u64 XMean_shift_accel_Get_tlx(XMean_shift_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TLX_DATA);
    Data += (u64)XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TLX_DATA + 4) << 32;
    return Data;
}

void XMean_shift_accel_Set_tly(XMean_shift_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TLY_DATA, (u32)(Data));
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TLY_DATA + 4, (u32)(Data >> 32));
}

u64 XMean_shift_accel_Get_tly(XMean_shift_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TLY_DATA);
    Data += (u64)XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TLY_DATA + 4) << 32;
    return Data;
}

void XMean_shift_accel_Set_obj_height(XMean_shift_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_OBJ_HEIGHT_DATA, (u32)(Data));
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_OBJ_HEIGHT_DATA + 4, (u32)(Data >> 32));
}

u64 XMean_shift_accel_Get_obj_height(XMean_shift_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_OBJ_HEIGHT_DATA);
    Data += (u64)XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_OBJ_HEIGHT_DATA + 4) << 32;
    return Data;
}

void XMean_shift_accel_Set_obj_width(XMean_shift_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_OBJ_WIDTH_DATA, (u32)(Data));
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_OBJ_WIDTH_DATA + 4, (u32)(Data >> 32));
}

u64 XMean_shift_accel_Get_obj_width(XMean_shift_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_OBJ_WIDTH_DATA);
    Data += (u64)XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_OBJ_WIDTH_DATA + 4) << 32;
    return Data;
}

void XMean_shift_accel_Set_dx(XMean_shift_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_DX_DATA, (u32)(Data));
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_DX_DATA + 4, (u32)(Data >> 32));
}

u64 XMean_shift_accel_Get_dx(XMean_shift_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_DX_DATA);
    Data += (u64)XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_DX_DATA + 4) << 32;
    return Data;
}

void XMean_shift_accel_Set_dy(XMean_shift_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_DY_DATA, (u32)(Data));
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_DY_DATA + 4, (u32)(Data >> 32));
}

u64 XMean_shift_accel_Get_dy(XMean_shift_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_DY_DATA);
    Data += (u64)XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_DY_DATA + 4) << 32;
    return Data;
}

void XMean_shift_accel_Set_track(XMean_shift_accel *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TRACK_DATA, (u32)(Data));
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TRACK_DATA + 4, (u32)(Data >> 32));
}

u64 XMean_shift_accel_Get_track(XMean_shift_accel *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TRACK_DATA);
    Data += (u64)XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_TRACK_DATA + 4) << 32;
    return Data;
}

void XMean_shift_accel_Set_frame_status(XMean_shift_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_FRAME_STATUS_DATA, Data);
}

u32 XMean_shift_accel_Get_frame_status(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_FRAME_STATUS_DATA);
    return Data;
}

void XMean_shift_accel_Set_no_objects(XMean_shift_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_NO_OBJECTS_DATA, Data);
}

u32 XMean_shift_accel_Get_no_objects(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_NO_OBJECTS_DATA);
    return Data;
}

void XMean_shift_accel_Set_no_of_iterations(XMean_shift_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_NO_OF_ITERATIONS_DATA, Data);
}

u32 XMean_shift_accel_Get_no_of_iterations(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_NO_OF_ITERATIONS_DATA);
    return Data;
}

void XMean_shift_accel_Set_rows(XMean_shift_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_ROWS_DATA, Data);
}

u32 XMean_shift_accel_Get_rows(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_ROWS_DATA);
    return Data;
}

void XMean_shift_accel_Set_cols(XMean_shift_accel *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_COLS_DATA, Data);
}

u32 XMean_shift_accel_Get_cols(XMean_shift_accel *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_COLS_DATA);
    return Data;
}

void XMean_shift_accel_InterruptGlobalEnable(XMean_shift_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_GIE, 1);
}

void XMean_shift_accel_InterruptGlobalDisable(XMean_shift_accel *InstancePtr) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_GIE, 0);
}

void XMean_shift_accel_InterruptEnable(XMean_shift_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IER);
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IER, Register | Mask);
}

void XMean_shift_accel_InterruptDisable(XMean_shift_accel *InstancePtr, u32 Mask) {
    u32 Register;

    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Register =  XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IER);
    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IER, Register & (~Mask));
}

void XMean_shift_accel_InterruptClear(XMean_shift_accel *InstancePtr, u32 Mask) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XMean_shift_accel_WriteReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_ISR, Mask);
}

u32 XMean_shift_accel_InterruptGetEnabled(XMean_shift_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_IER);
}

u32 XMean_shift_accel_InterruptGetStatus(XMean_shift_accel *InstancePtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    return XMean_shift_accel_ReadReg(InstancePtr->Control_BaseAddress, XMEAN_SHIFT_ACCEL_CONTROL_ADDR_ISR);
}

