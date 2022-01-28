// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#include "xparameters.h"
#include "xmean_shift_accel.h"

extern XMean_shift_accel_Config XMean_shift_accel_ConfigTable[];

XMean_shift_accel_Config *XMean_shift_accel_LookupConfig(u16 DeviceId) {
	XMean_shift_accel_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XMEAN_SHIFT_ACCEL_NUM_INSTANCES; Index++) {
		if (XMean_shift_accel_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XMean_shift_accel_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XMean_shift_accel_Initialize(XMean_shift_accel *InstancePtr, u16 DeviceId) {
	XMean_shift_accel_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XMean_shift_accel_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XMean_shift_accel_CfgInitialize(InstancePtr, ConfigPtr);
}

#endif

