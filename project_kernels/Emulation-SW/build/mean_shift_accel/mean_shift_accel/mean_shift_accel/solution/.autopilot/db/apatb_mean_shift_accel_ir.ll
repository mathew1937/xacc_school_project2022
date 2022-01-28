; ModuleID = '/home/centos/workspace/project_kernels/Emulation-SW/build/mean_shift_accel/mean_shift_accel/mean_shift_accel/solution/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%struct.ap_uint = type { %struct.ap_int_base }
%struct.ap_int_base = type { %struct.ssdm_int }
%struct.ssdm_int = type { i32 }

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i1) #0

; Function Attrs: noinline
define void @apatb_mean_shift_accel_ir(%struct.ap_uint* %img_inp, i16* %tlx, i16* %tly, i16* %obj_height, i16* %obj_width, i16* %dx, i16* %dy, i16* %track, i8 %frame_status, i8 %no_objects, i8 %no_of_iterations, i32 %rows, i32 %cols) local_unnamed_addr #1 {
entry:
  %malloccall = tail call i8* @malloc(i64 8294400)
  %img_inp_copy = bitcast i8* %malloccall to [2073600 x %struct.ap_uint]*
  %tlx_copy = alloca i16, align 512
  %tly_copy = alloca i16, align 512
  %obj_height_copy = alloca i16, align 512
  %obj_width_copy = alloca i16, align 512
  %dx_copy = alloca i16, align 512
  %dy_copy = alloca i16, align 512
  %track_copy = alloca i16, align 512
  %0 = bitcast %struct.ap_uint* %img_inp to [2073600 x %struct.ap_uint]*
  call fastcc void @copy_in([2073600 x %struct.ap_uint]* %0, [2073600 x %struct.ap_uint]* %img_inp_copy, i16* %tlx, i16* nonnull align 512 %tlx_copy, i16* %tly, i16* nonnull align 512 %tly_copy, i16* %obj_height, i16* nonnull align 512 %obj_height_copy, i16* %obj_width, i16* nonnull align 512 %obj_width_copy, i16* %dx, i16* nonnull align 512 %dx_copy, i16* %dy, i16* nonnull align 512 %dy_copy, i16* %track, i16* nonnull align 512 %track_copy)
  %1 = getelementptr inbounds [2073600 x %struct.ap_uint], [2073600 x %struct.ap_uint]* %img_inp_copy, i32 0, i32 0
  call void @apatb_mean_shift_accel_hw(%struct.ap_uint* %1, i16* %tlx_copy, i16* %tly_copy, i16* %obj_height_copy, i16* %obj_width_copy, i16* %dx_copy, i16* %dy_copy, i16* %track_copy, i8 %frame_status, i8 %no_objects, i8 %no_of_iterations, i32 %rows, i32 %cols)
  call fastcc void @copy_out([2073600 x %struct.ap_uint]* %0, [2073600 x %struct.ap_uint]* %img_inp_copy, i16* %tlx, i16* nonnull align 512 %tlx_copy, i16* %tly, i16* nonnull align 512 %tly_copy, i16* %obj_height, i16* nonnull align 512 %obj_height_copy, i16* %obj_width, i16* nonnull align 512 %obj_width_copy, i16* %dx, i16* nonnull align 512 %dx_copy, i16* %dy, i16* nonnull align 512 %dy_copy, i16* %track, i16* nonnull align 512 %track_copy)
  tail call void @free(i8* %malloccall)
  ret void
}

declare noalias i8* @malloc(i64) local_unnamed_addr

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_in([2073600 x %struct.ap_uint]* readonly, [2073600 x %struct.ap_uint]* noalias, i16* readonly, i16* noalias align 512, i16* readonly, i16* noalias align 512, i16* readonly, i16* noalias align 512, i16* readonly, i16* noalias align 512, i16* readonly, i16* noalias align 512, i16* readonly, i16* noalias align 512, i16* readonly, i16* noalias align 512) unnamed_addr #2 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2073600struct.ap_uint([2073600 x %struct.ap_uint]* %1, [2073600 x %struct.ap_uint]* %0)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %3, i16* %2)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %5, i16* %4)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %7, i16* %6)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %9, i16* %8)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %11, i16* %10)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %13, i16* %12)
  call fastcc void @onebyonecpy_hls.p0i16(i16* align 512 %15, i16* %14)
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0a2073600struct.ap_uint([2073600 x %struct.ap_uint]* noalias, [2073600 x %struct.ap_uint]* noalias readonly) unnamed_addr #3 {
entry:
  %2 = icmp eq [2073600 x %struct.ap_uint]* %0, null
  %3 = icmp eq [2073600 x %struct.ap_uint]* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  br label %for.loop

for.loop:                                         ; preds = %for.loop, %copy
  %for.loop.idx7 = phi i64 [ 0, %copy ], [ %for.loop.idx.next, %for.loop ]
  %src.addr.0.0.05 = getelementptr [2073600 x %struct.ap_uint], [2073600 x %struct.ap_uint]* %1, i64 0, i64 %for.loop.idx7, i32 0, i32 0, i32 0
  %dst.addr.0.0.06 = getelementptr [2073600 x %struct.ap_uint], [2073600 x %struct.ap_uint]* %0, i64 0, i64 %for.loop.idx7, i32 0, i32 0, i32 0
  %5 = bitcast i32* %dst.addr.0.0.06 to i8*
  %6 = bitcast i32* %src.addr.0.0.05 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 4, i1 false)
  %for.loop.idx.next = add nuw nsw i64 %for.loop.idx7, 1
  %exitcond = icmp ne i64 %for.loop.idx.next, 2073600
  br i1 %exitcond, label %for.loop, label %ret

ret:                                              ; preds = %for.loop, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @onebyonecpy_hls.p0i16(i16* noalias align 512, i16* noalias readonly) unnamed_addr #3 {
entry:
  %2 = icmp eq i16* %0, null
  %3 = icmp eq i16* %1, null
  %4 = or i1 %2, %3
  br i1 %4, label %ret, label %copy

copy:                                             ; preds = %entry
  %5 = bitcast i16* %0 to i8*
  %6 = bitcast i16* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %5, i8* align 1 %6, i64 2, i1 false)
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline
define internal fastcc void @copy_out([2073600 x %struct.ap_uint]*, [2073600 x %struct.ap_uint]* noalias readonly, i16*, i16* noalias readonly align 512, i16*, i16* noalias readonly align 512, i16*, i16* noalias readonly align 512, i16*, i16* noalias readonly align 512, i16*, i16* noalias readonly align 512, i16*, i16* noalias readonly align 512, i16*, i16* noalias readonly align 512) unnamed_addr #4 {
entry:
  call fastcc void @onebyonecpy_hls.p0a2073600struct.ap_uint([2073600 x %struct.ap_uint]* %0, [2073600 x %struct.ap_uint]* %1)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %2, i16* align 512 %3)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %4, i16* align 512 %5)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %6, i16* align 512 %7)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %8, i16* align 512 %9)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %10, i16* align 512 %11)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %12, i16* align 512 %13)
  call fastcc void @onebyonecpy_hls.p0i16(i16* %14, i16* align 512 %15)
  ret void
}

declare void @free(i8*) local_unnamed_addr

declare void @apatb_mean_shift_accel_hw(%struct.ap_uint*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i8, i8, i8, i32, i32)

define void @mean_shift_accel_hw_stub_wrapper(%struct.ap_uint*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i8, i8, i8, i32, i32) #5 {
entry:
  %13 = bitcast %struct.ap_uint* %0 to [2073600 x %struct.ap_uint]*
  call void @copy_out([2073600 x %struct.ap_uint]* null, [2073600 x %struct.ap_uint]* %13, i16* null, i16* %1, i16* null, i16* %2, i16* null, i16* %3, i16* null, i16* %4, i16* null, i16* %5, i16* null, i16* %6, i16* null, i16* %7)
  %14 = bitcast [2073600 x %struct.ap_uint]* %13 to %struct.ap_uint*
  call void @mean_shift_accel_hw_stub(%struct.ap_uint* %14, i16* %1, i16* %2, i16* %3, i16* %4, i16* %5, i16* %6, i16* %7, i8 %8, i8 %9, i8 %10, i32 %11, i32 %12)
  call void @copy_in([2073600 x %struct.ap_uint]* null, [2073600 x %struct.ap_uint]* %13, i16* null, i16* %1, i16* null, i16* %2, i16* null, i16* %3, i16* null, i16* %4, i16* null, i16* %5, i16* null, i16* %6, i16* null, i16* %7)
  ret void
}

declare void @mean_shift_accel_hw_stub(%struct.ap_uint*, i16*, i16*, i16*, i16*, i16*, i16*, i16*, i8, i8, i8, i32, i32)

attributes #0 = { argmemonly nounwind }
attributes #1 = { noinline "fpga.wrapper.func"="wrapper" }
attributes #2 = { argmemonly noinline "fpga.wrapper.func"="copyin" }
attributes #3 = { argmemonly noinline "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #4 = { argmemonly noinline "fpga.wrapper.func"="copyout" }
attributes #5 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
