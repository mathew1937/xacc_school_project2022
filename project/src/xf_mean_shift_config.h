/*
 * Copyright 2019 Xilinx, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef _XF_MEAN_SHIFT_CONFIG_H
#define _XF_MEAN_SHIFT_CONFIG_H

#include "../../project/src/build/xf_mean_shift_config_params.h"
#include "hls_stream.h"
#include "common/xf_common.hpp"
#include "common/xf_utility.hpp"
#include "imgproc/xf_mean_shift.hpp"

// set 1 for video
#define VIDEO_INPUT 0

// -------------------------------------------
// Parameters for the first data sample
#define TOTAL_FRAMES 40
#define XF_HEIGHT 550
#define XF_WIDTH 598
const int X1[XF_MAX_OBJECTS] = {238}; // col coordinates of the top-left corner of all the objects to be tracked
const int Y1[XF_MAX_OBJECTS] = {288}; // row coordinates of the top-left corner of all the objects to be tracked
const int WIDTH_MST[XF_MAX_OBJECTS] = {72}; // width of all the objects to be tracked (measured from top-left corner)
const int HEIGHT_MST[XF_MAX_OBJECTS] = {72}; // height of all the objects to be tracked (measured from top-left corner)

/*
// -------------------------------------------
// Parameters for the second data sample
#define TOTAL_FRAMES 59
#define XF_HEIGHT 318
#define XF_WIDTH 500
const int X1[XF_MAX_OBJECTS] = {290}; // col coordinates of the top-left corner of all the objects to be tracked
const int Y1[XF_MAX_OBJECTS] = {30}; // row coordinates of the top-left corner of all the objects to be tracked
const int WIDTH_MST[XF_MAX_OBJECTS] = {30}; // width of all the objects to be tracked (measured from top-left corner)
const int HEIGHT_MST[XF_MAX_OBJECTS] = {30}; // height of all the objects to be tracked (measured from top-left corner)
*/

#define IN_TYPE unsigned int

#endif
