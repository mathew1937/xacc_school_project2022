
a
GRunning '/opt/Xilinx/Vitis_HLS/2021.1/bin/unwrapped/lnx64.o/vitis_hls'
*HLSZ200-10h px 
¨
For user 'centos' on host 'ip-172-31-94-117.ec2.internal' (Linux_x86_64 version 3.10.0-1160.31.1.el7.x86_64) on Fri Jan 28 13:48:01 UTC 2022
*HLSZ200-10h px 
G
-On os "CentOS Linux release 7.9.2009 (Core)"
*HLSZ200-10h px 

kIn directory '/home/centos/workspace/project_kernels/Emulation-HW/build/mean_shift_accel/mean_shift_accel'
*HLSZ200-10h px 
F
+Sourcing Tcl script 'mean_shift_accel.tcl'
*HLSZ200-150h px 
e
Running: %s
2001510*hls22
open_project mean_shift_accel 2default:defaultZ200-1510h px 
¨
Creating and opening project '/home/centos/workspace/project_kernels/Emulation-HW/build/mean_shift_accel/mean_shift_accel/mean_shift_accel'.
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
Creating and opening solution '/home/centos/workspace/project_kernels/Emulation-HW/build/mean_shift_accel/mean_shift_accel/mean_shift_accel/solution'.
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
U
Running: %s
2001510*hls2"
csynth_design 2default:defaultZ200-1510h px 
Ç
«Finished File checks and directory preparation: CPU user time: 0.01 seconds. CPU system time: 0 seconds. Elapsed time: 0.01 seconds; current allocated memory: 108.754 MB.
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

ouse of undeclared identifier 'inMat': /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:51:55
*HLSZ207-3771h px 

puse of undeclared identifier 'outMat': /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:52:55
*HLSZ207-3771h px 

ouse of undeclared identifier 'inMat': /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:54:50
*HLSZ207-3771h px 

puse of undeclared identifier 'outMat': /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:54:57
*HLSZ207-3771h px 

puse of undeclared identifier 'outMat': /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:56:33
*HLSZ207-3771h px 
­
Ignore interface attribute or pragma which is not used in top function: /home/centos/workspace/project_kernels/src/xf_mean_shift_accel.cpp:48:9
*HLSZ207-5528h px 
¹
Finished Command csynth_design CPU user time: 3.17 seconds. CPU system time: 0.19 seconds. Elapsed time: 1.69 seconds; current allocated memory: 109.858 MB.
*HLSZ200-111h px 
§
 
    while executing
"source mean_shift_accel.tcl"
    ("uplevel" body line 1)
    invoked from within
"uplevel \#0 [list source $arg] "

*HLSZ200-150h px 
¨
Total CPU user time: 4.3 seconds. Total CPU system time: 0.55 seconds. Total elapsed time: 2.84 seconds; peak allocated memory: 109.520 MB.
*HLSZ200-112h px 

Exiting %s at %s...
206*common2
	vitis_hls2default:default2,
Fri Jan 28 13:48:04 20222default:defaultZ17-206h px 


End Record