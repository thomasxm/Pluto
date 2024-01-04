; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; RUN: opt -basic-aa -memcpyopt -S %s -verify-memoryssa -opaque-pointers | FileCheck %s

define void @test_memset_memcpy(ptr %src, i64 %src_size, ptr noalias %dst, i64 %dst_size, i8 %c) {
; CHECK-LABEL: @test_memset_memcpy(
; CHECK-NEXT:    [[TMP1:%.*]] = icmp ule i64 [[DST_SIZE:%.*]], [[SRC_SIZE:%.*]]
; CHECK-NEXT:    [[TMP2:%.*]] = sub i64 [[DST_SIZE]], [[SRC_SIZE]]
; CHECK-NEXT:    [[TMP3:%.*]] = select i1 [[TMP1]], i64 0, i64 [[TMP2]]
; CHECK-NEXT:    [[TMP4:%.*]] = getelementptr i8, ptr [[DST:%.*]], i64 [[SRC_SIZE]]
; CHECK-NEXT:    call void @llvm.memset.p0.i64(ptr align 1 [[TMP4]], i8 [[C:%.*]], i64 [[TMP3]], i1 false)
; CHECK-NEXT:    call void @llvm.memcpy.p0.p0.i64(ptr [[DST]], ptr [[SRC:%.*]], i64 [[SRC_SIZE]], i1 false)
; CHECK-NEXT:    ret void
;
  call void @llvm.memset.p0.i64(ptr %dst, i8 %c, i64 %dst_size, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr %dst, ptr %src, i64 %src_size, i1 false)
  ret void
}

declare void @llvm.memset.p0.i64(ptr nocapture, i8, i64, i1)
declare void @llvm.memcpy.p0.p0.i64(ptr nocapture, ptr nocapture readonly, i64, i1)