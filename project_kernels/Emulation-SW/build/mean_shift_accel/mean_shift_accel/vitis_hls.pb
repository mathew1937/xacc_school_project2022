
a
GRunning '/opt/Xilinx/Vitis_HLS/2021.1/bin/unwrapped/lnx64.o/vitis_hls'
*HLSZ200-10h px 
¨
For user 'centos' on host 'ip-172-31-94-117.ec2.internal' (Linux_x86_64 version 3.10.0-1160.31.1.el7.x86_64) on Fri Jan 28 14:38:17 UTC 2022
*HLSZ200-10h px 
G
-On os "CentOS Linux release 7.9.2009 (Core)"
*HLSZ200-10h px 

kIn directory '/home/centos/workspace/project_kernels/Emulation-SW/build/mean_shift_accel/mean_shift_accel'
*HLSZ200-10h px 
F
+Sourcing Tcl script 'mean_shift_accel.tcl'
*HLSZ200-150h px 
e
Running: %s
2001510*hls22
open_project mean_shift_accel 2default:defaultZ200-1510h px 
¨
Creating and opening project '/home/centos/workspace/project_kernels/Emulation-SW/build/mean_shift_accel/mean_shift_accel/mean_shift_accel'.
*HLSZ200-10h px 
`
Running: %s
2001510*hls2-
set_top mean_shift_accel 2default:defaultZ200-1510h px 
Ü
Running: %s
2001510*hls2¨
add_files /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp -cflags  -g -D __SDA_MEM_MAP__ -I /home/centos/workspace/project_kernels/src -I /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include -I /home/centos/workspace/project_kernels/src/build  2default:defaultZ200-1510h px 

gAdding design file '/home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp' to the project
*HLSZ200-10h px 
q
Running: %s
2001510*hls2>
*open_solution -flow_target vitis solution 2default:defaultZ200-1510h px 
²
Creating and opening solution '/home/centos/workspace/project_kernels/Emulation-SW/build/mean_shift_accel/mean_shift_accel/mean_shift_accel/solution'.
*HLSZ200-10h px 
×
Using %sflow_target '%s'
2001505*hls2
 2default:default2
vitis2default:defaultZ200-1505h pxeFor help on HLS 200-1505 see www.xilinx.com/cgi-bin/docs/rdoc?v=2021.1;t=hls+guidance;d=200-1505.html 
°
Setting %s configuration: %s
200435*hls26
"'open_solution -flow_target vitis'2default:default26
"config_interface -m_axi_latency=642default:defaultZ200-435h px 
¼
Setting %s configuration: %s
200435*hls26
"'open_solution -flow_target vitis'2default:default2B
.config_interface -m_axi_alignment_byte_size=642default:defaultZ200-435h px 
¼
Setting %s configuration: %s
200435*hls26
"'open_solution -flow_target vitis'2default:default2B
.config_interface -m_axi_max_widen_bitwidth=5122default:defaultZ200-435h px 
®
Setting %s configuration: %s
200435*hls26
"'open_solution -flow_target vitis'2default:default24
 config_rtl -register_reset_num=32default:defaultZ200-435h px 
d
Running: %s
2001510*hls21
set_part xcvu9p-flgb2104-2-i 2default:defaultZ200-1510h px 
k
Setting target device to '%s'2001611*hls2'
xcvu9p-flgb2104-2-i2default:defaultZ200-1611h px 
x
Running: %s
2001510*hls2E
1create_clock -period 250.000000MHz -name default 2default:defaultZ200-1510h px 
L
1Setting up clock 'default' with a period of 4ns.
*SYNZ201-201h px 
b
Running: %s
2001510*hls2/
config_rtl -kernel_profile 2default:defaultZ200-1510h px 
l
Running: %s
2001510*hls29
%config_dataflow -strict_mode warning 2default:defaultZ200-1510h px 
\
Running: %s
2001510*hls2)
config_debug -enable 2default:defaultZ200-1510h px 
v
Running: %s
2001510*hls2C
/config_export -disable_deadlock_detection=true 2default:defaultZ200-1510h px 
m
Running: %s
2001510*hls2:
&config_rtl -m_axi_conservative_mode=1 2default:defaultZ200-1510h px 
þ
cThe '%s' command is deprecated and will be removed in a future release. Use %s as its replacement.
200483*hls27
#config_rtl -m_axi_conservative_mode2default:default2=
)config_interface -m_axi_conservative_mode2default:defaultZ200-483h px 
f
Running: %s
2001510*hls23
config_interface -m_axi_addr64 2default:defaultZ200-1510h px 
p
Running: %s
2001510*hls2=
)config_interface -m_axi_auto_max_ports=0 2default:defaultZ200-1510h px 

Running: %s
2001510*hls2N
:config_export -format ip_catalog -ipname mean_shift_accel 2default:defaultZ200-1510h px 
f
Running: %s
2001510*hls23
csynth_design -synthesis_check 2default:defaultZ200-1510h px 
Ä
¨Finished File checks and directory preparation: CPU user time: 0.01 seconds. CPU system time: 0 seconds. Elapsed time: 0 seconds; current allocated memory: 108.756 MB.
*HLSZ200-111h px 
z
`Analyzing design file '/home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp' ... 
*HLSZ200-10h px 
·
'INPUT_PTR_WIDTH' macro redefined: /home/centos/workspace/project_kernels/src/../../project/src/../../project/src/build/xf_mean_shift_config_params.h:17:9
*HLSZ207-910h px 

uprevious definition is here: /home/centos/workspace/project_kernels/src/../../project/src/xf_cvt_color_config.h:33:9
*HLSZ207-71h px 
­
Ignore interface attribute or pragma which is not used in top function: /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:48:9
*HLSZ207-5528h px 

hunused parameter 'print': /opt/Xilinx/Vitis_HLS/2021.1/common/technology/autopilot/ap_int_base.h:792:16
*HLSZ207-5301h px 

vunused parameter 'src': /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:506:30
*HLSZ207-5301h px 

xunused parameter '_data': /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:517:30
*HLSZ207-5301h px 

xunused parameter 'index': /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:530:14
*HLSZ207-5301h px 

xunused parameter 'index': /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:541:20
*HLSZ207-5301h px 

wunused parameter 'dst': /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:773:101
*HLSZ207-5301h px 

zunused parameter 'index': /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:1165:102
*HLSZ207-5301h px 

yunused parameter 'index': /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:1471:34
*HLSZ207-5301h px 
È
«the argument to '__builtin_assume' has side effects that will be discarded: /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:151:43
*HLSZ207-4610h px 
È
«the argument to '__builtin_assume' has side effects that will be discarded: /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:152:43
*HLSZ207-4610h px 
È
«the argument to '__builtin_assume' has side effects that will be discarded: /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:153:46
*HLSZ207-4610h px 
È
«the argument to '__builtin_assume' has side effects that will be discarded: /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:154:46
*HLSZ207-4610h px 

unused parameter 'y1': /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:194:30
*HLSZ207-5301h px 
È
«the argument to '__builtin_assume' has side effects that will be discarded: /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:151:43
*HLSZ207-4610h px 
Í
°in instantiation of function template specialization 'xf::cv::rgb2hsv<9, 550, 598, 1>' requested here: /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:54:13
*HLSZ207-4230h px 
È
«the argument to '__builtin_assume' has side effects that will be discarded: /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:152:43
*HLSZ207-4610h px 
È
«the argument to '__builtin_assume' has side effects that will be discarded: /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:153:46
*HLSZ207-4610h px 
È
«the argument to '__builtin_assume' has side effects that will be discarded: /home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:154:46
*HLSZ207-4610h px 
Ì
°Finished Source Code Analysis and Preprocessing: CPU user time: 10.13 seconds. CPU system time: 0.62 seconds. Elapsed time: 8.97 seconds; current allocated memory: 110.149 MB.
*HLSZ200-111h px 
m
/Using interface defaults for '%s' flow target.
200777*hls2
Vitis2default:defaultZ200-777h px 
Q
6Initial Interval estimation mode is set into default.
*HLSZ214-279h px 
J
/Auto array partition mode is set into default.
*HLSZ214-284h px 

úInlining function 'xf::cv::Mat<9, 550, 598, 1, -1>::init(int, int, bool)' into 'void xf::cv::Mat<9, 550, 598, 1, -1>::init<-1, (void*)0>(int, int, void*)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:554:9)
*HLSZ214-131h px 
ó
×Inlining function 'xf::cv::Mat<9, 550, 598, 1, -1>::init(int, int, bool)' into 'xf::cv::Mat<9, 550, 598, 1, -1>::Mat()' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:645:2)
*HLSZ214-131h px 

óInlining function 'hls::stream<ap_uint<24>, 0>::write(ap_uint<24> const&)' into 'void xFTrackmulBlkReadIn<550, 598, 598, 9, 550, 598, 1>(DataType<9, 1>::name*, xf::cv::Mat<9, 550, 598, 1, -1>&, int, hls::stream<DataType<9, 1>::name, 0>&, int, int, unsigned short)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:89:16)
*HLSZ214-131h px 

ûInlining function 'void xFTrackmulBlkReadIn<550, 598, 598, 9, 550, 598, 1>(DataType<9, 1>::name*, xf::cv::Mat<9, 550, 598, 1, -1>&, int, hls::stream<DataType<9, 1>::name, 0>&, int, int, unsigned short)' into 'void xFTrackmulBlkRead<550, 598, 598, 9, 550, 598, 1>(hls::stream<DataType<9, 1>::name, 0>&, xf::cv::Mat<9, 550, 598, 1, -1>&, unsigned short, unsigned short, unsigned short, unsigned short)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:124:2)
*HLSZ214-131h px 
Ü
ÀInlining function 'hls::stream<ap_uint<24>, 0>::read(ap_uint<24>&)' into 'hls::stream<ap_uint<24>, 0>::read()' (/opt/Xilinx/Vitis_HLS/2021.1/common/technology/autopilot/hls_stream_39.h:156:9)
*HLSZ214-131h px 
±
Inlining function 'hls::stream<ap_uint<24>, 0>::read()' into 'void xFTrackmulHist<550, 299, 598, 1, 9, unsigned int, unsigned short>(hls::stream<StreamType<9>::name, 0>&, unsigned short, unsigned short, unsigned short, unsigned short, unsigned int*, unsigned int*, unsigned short*, unsigned char)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:245:52)
*HLSZ214-131h px 
±
Inlining function 'hls::stream<ap_uint<24>, 0>::read()' into 'void xFTrackmulHist<550, 299, 598, 1, 9, unsigned int, unsigned short>(hls::stream<StreamType<9>::name, 0>&, unsigned short, unsigned short, unsigned short, unsigned short, unsigned int*, unsigned int*, unsigned short*, unsigned char)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:246:63)
*HLSZ214-131h px 
½
¡Inlining function 'hls::stream<ap_uint<24>, 0>::stream()' into 'void xFTrackmulFindhist<550, 598, 598, 9, 550, 598, 1, unsigned int, unsigned short>(xf::cv::Mat<9, 550, 598, 1, -1>&, unsigned short, unsigned short, unsigned short, unsigned short, unsigned int*, unsigned int*, unsigned short*, unsigned char)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:456:51)
*HLSZ214-131h px 
¶
Inlining function 'xFTrackmulSqrt(int)' into 'void xFTrackmulWeight<550, 598, 598, 1, unsigned int, unsigned short>(unsigned int*, unsigned int*, unsigned short*, unsigned short&, unsigned short&, unsigned short, unsigned short, unsigned short&, unsigned short&, bool&, unsigned short, unsigned short)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:372:26)
*HLSZ214-131h px 
É
­Inlining function 'xf::cv::Mat<9, 550, 598, 1, -1>::Mat(int, int, void*)' into 'mean_shift_accel' (/home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:51:43)
*HLSZ214-131h px 
º
Inlining function 'xf::cv::Mat<9, 550, 598, 1, -1>::Mat()' into 'mean_shift_accel' (/home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:52:46)
*HLSZ214-131h px 
©
Inlining function 'void xf::cv::Mat<9, 550, 598, 1, -1>::assignDataPtr<-1, (void*)0>(void*)' into 'void xf::cv::Mat<9, 550, 598, 1, -1>::init<-1, (void*)0>(int, int, void*)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/common/xf_structs.hpp:553:0)
*HLSZ214-178h px 
Ä
¨Inlining function 'ap_uint<24> xf::cv::Mat<9, 550, 598, 1, -1>::read<-1, (void*)0>(int)' into 'void xf::cv::rgb2hsv<9, 550, 598, 1>(xf::cv::Mat<9, 550, 598, 1, -1>&, xf::cv::Mat<9, 550, 598, 1, -1>&)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:73:0)
*HLSZ214-178h px 
Ë
¯Inlining function 'void xf::cv::Mat<9, 550, 598, 1, -1>::write<-1, (void*)0>(int, ap_uint<24>)' into 'void xf::cv::rgb2hsv<9, 550, 598, 1>(xf::cv::Mat<9, 550, 598, 1, -1>&, xf::cv::Mat<9, 550, 598, 1, -1>&)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_rgb2hsv.hpp:73:0)
*HLSZ214-178h px 
¥
Inlining function 'ap_uint<24> xf::cv::Mat<9, 550, 598, 1, -1>::read<-1, (void*)0>(int)' into 'void xFTrackmulBlkRead<550, 598, 598, 9, 550, 598, 1>(hls::stream<DataType<9, 1>::name, 0>&, xf::cv::Mat<9, 550, 598, 1, -1>&, unsigned short, unsigned short, unsigned short, unsigned short)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:111:0)
*HLSZ214-178h px 
¯
Inlining function 'xFTrackmulFindbin(unsigned char, unsigned char, unsigned char)' into 'void xFTrackmulFindbinIncrement<550, 598, unsigned short>(ap_uint<32>, short&, unsigned short&, unsigned short*, unsigned short, unsigned short, unsigned short, unsigned short, unsigned short, unsigned int)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:156:0)
*HLSZ214-178h px 
Û
¿Inlining function 'void xFTrackmulFindbinIncrement<550, 598, unsigned short>(ap_uint<32>, short&, unsigned short&, unsigned short*, unsigned short, unsigned short, unsigned short, unsigned short, unsigned short, unsigned int)' into 'void xFTrackmulHist<550, 299, 598, 1, 9, unsigned int, unsigned short>(hls::stream<StreamType<9>::name, 0>&, unsigned short, unsigned short, unsigned short, unsigned short, unsigned int*, unsigned int*, unsigned short*, unsigned char)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:199:0)
*HLSZ214-178h px 

ûInlining function 'void xFTrackmulKernelFunc<550, 598, 598, 9, 550, 598, 10, 8, 1>(xf::cv::Mat<9, 550, 598, 1, -1>&, unsigned short, unsigned short, unsigned short, unsigned short, unsigned short&, unsigned short&, bool&, unsigned char, unsigned char, unsigned char)' into 'void xFMeanShiftKernel<550, 598, 9, 550, 598, 10, 4, 1>(xf::cv::Mat<9, 550, 598, 1, -1>&, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned char, unsigned char, unsigned char)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift_kernel.hpp:582:0)
*HLSZ214-178h px 

ùInlining function 'void xFMeanShiftKernel<550, 598, 9, 550, 598, 10, 4, 1>(xf::cv::Mat<9, 550, 598, 1, -1>&, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned char, unsigned char, unsigned char)' into 'void xf::cv::MeanShift<10, 4, 550, 598, 9, 550, 598, 1>(xf::cv::Mat<9, 550, 598, 1, -1>&, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned short*, unsigned char, unsigned char, unsigned char)' (/home/centos/workspace/project_kernels/libs/xf_opencv/L1/include/imgproc/xf_mean_shift.hpp:38:0)
*HLSZ214-178h px 
Ü
ÀInlining function 'void xf::cv::Mat<9, 550, 598, 1, -1>::init<-1, (void*)0>(int, int, void*)' into 'mean_shift_accel' (/home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:33:0)
*HLSZ214-178h px 
É
­Finished Compiling Optimization and Transform: CPU user time: 4.58 seconds. CPU system time: 0.35 seconds. Elapsed time: 4.93 seconds; current allocated memory: 111.186 MB.
*HLSZ200-111h px 
¯
Finished Checking Pragmas: CPU user time: 0.01 seconds. CPU system time: 0 seconds. Elapsed time: 0 seconds; current allocated memory: 111.187 MB.
*HLSZ200-111h px 
x
SRunning only source code synthesis checks, skipping scheduling and RTL generation.
2001493*hlsZ200-1493h px 
»
Finished Command csynth_design CPU user time: 14.73 seconds. CPU system time: 0.98 seconds. Elapsed time: 13.92 seconds; current allocated memory: 111.159 MB.
*HLSZ200-111h px 
6
HLS completed successfully
*HLSZ200-150h px 
«
Total CPU user time: 15.83 seconds. Total CPU system time: 1.32 seconds. Total elapsed time: 15.05 seconds; peak allocated memory: 111.187 MB.
*HLSZ200-112h px 

Exiting %s at %s...
206*common2
	vitis_hls2default:default2,
Fri Jan 28 14:38:32 20222default:defaultZ17-206h px 


End Record