; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -mtriple=thumbv8.1m.main -mattr=+mve.fp -verify-machineinstrs -enable-arm-maskedldst -o - %s | FileCheck %s

define arm_aapcs_vfpcc <8 x half> @test_vld1q_f16(half* %base) {
; CHECK-LABEL: test_vld1q_f16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast half* %base to <8 x half>*
  %1 = load <8 x half>, <8 x half>* %0, align 2
  ret <8 x half> %1
}

define arm_aapcs_vfpcc <4 x float> @test_vld1q_f32(float* %base) {
; CHECK-LABEL: test_vld1q_f32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast float* %base to <4 x float>*
  %1 = load <4 x float>, <4 x float>* %0, align 4
  ret <4 x float> %1
}

define arm_aapcs_vfpcc <16 x i8> @test_vld1q_s8(i8* %base) {
; CHECK-LABEL: test_vld1q_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = load <16 x i8>, <16 x i8>* %0, align 1
  ret <16 x i8> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vld1q_s16(i16* %base) {
; CHECK-LABEL: test_vld1q_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = load <8 x i16>, <8 x i16>* %0, align 2
  ret <8 x i16> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vld1q_s32(i32* %base) {
; CHECK-LABEL: test_vld1q_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = load <4 x i32>, <4 x i32>* %0, align 4
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <16 x i8> @test_vld1q_u8(i8* %base) {
; CHECK-LABEL: test_vld1q_u8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = load <16 x i8>, <16 x i8>* %0, align 1
  ret <16 x i8> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vld1q_u16(i16* %base) {
; CHECK-LABEL: test_vld1q_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = load <8 x i16>, <8 x i16>* %0, align 2
  ret <8 x i16> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vld1q_u32(i32* %base) {
; CHECK-LABEL: test_vld1q_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = load <4 x i32>, <4 x i32>* %0, align 4
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <8 x half> @test_vld1q_z_f16(half* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vld1q_z_f16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrht.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast half* %base to <8 x half>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  %3 = call <8 x half> @llvm.masked.load.v8f16.p0v8f16(<8 x half>* %0, i32 2, <8 x i1> %2, <8 x half> zeroinitializer)
  ret <8 x half> %3
}

declare <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32)

declare <8 x half> @llvm.masked.load.v8f16.p0v8f16(<8 x half>*, i32 immarg, <8 x i1>, <8 x half>)

define arm_aapcs_vfpcc <4 x float> @test_vld1q_z_f32(float* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vld1q_z_f32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrwt.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast float* %base to <4 x float>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x float> @llvm.masked.load.v4f32.p0v4f32(<4 x float>* %0, i32 4, <4 x i1> %2, <4 x float> zeroinitializer)
  ret <4 x float> %3
}

declare <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32)

declare <4 x float> @llvm.masked.load.v4f32.p0v4f32(<4 x float>*, i32 immarg, <4 x i1>, <4 x float>)

define arm_aapcs_vfpcc <16 x i8> @test_vld1q_z_s8(i8* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vld1q_z_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrbt.u8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %1)
  %3 = call <16 x i8> @llvm.masked.load.v16i8.p0v16i8(<16 x i8>* %0, i32 1, <16 x i1> %2, <16 x i8> zeroinitializer)
  ret <16 x i8> %3
}

declare <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32)

declare <16 x i8> @llvm.masked.load.v16i8.p0v16i8(<16 x i8>*, i32 immarg, <16 x i1>, <16 x i8>)

define arm_aapcs_vfpcc <8 x i16> @test_vld1q_z_s16(i16* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vld1q_z_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrht.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  %3 = call <8 x i16> @llvm.masked.load.v8i16.p0v8i16(<8 x i16>* %0, i32 2, <8 x i1> %2, <8 x i16> zeroinitializer)
  ret <8 x i16> %3
}

declare <8 x i16> @llvm.masked.load.v8i16.p0v8i16(<8 x i16>*, i32 immarg, <8 x i1>, <8 x i16>)

define arm_aapcs_vfpcc <4 x i32> @test_vld1q_z_s32(i32* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vld1q_z_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrwt.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %0, i32 4, <4 x i1> %2, <4 x i32> zeroinitializer)
  ret <4 x i32> %3
}

declare <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>*, i32 immarg, <4 x i1>, <4 x i32>)

define arm_aapcs_vfpcc <16 x i8> @test_vld1q_z_u8(i8* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vld1q_z_u8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrbt.u8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %1)
  %3 = call <16 x i8> @llvm.masked.load.v16i8.p0v16i8(<16 x i8>* %0, i32 1, <16 x i1> %2, <16 x i8> zeroinitializer)
  ret <16 x i8> %3
}

define arm_aapcs_vfpcc <8 x i16> @test_vld1q_z_u16(i16* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vld1q_z_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrht.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  %3 = call <8 x i16> @llvm.masked.load.v8i16.p0v8i16(<8 x i16>* %0, i32 2, <8 x i1> %2, <8 x i16> zeroinitializer)
  ret <8 x i16> %3
}

define arm_aapcs_vfpcc <4 x i32> @test_vld1q_z_u32(i32* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vld1q_z_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrwt.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %0, i32 4, <4 x i1> %2, <4 x i32> zeroinitializer)
  ret <4 x i32> %3
}

define arm_aapcs_vfpcc <16 x i8> @test_vldrbq_s8(i8* %base) {
; CHECK-LABEL: test_vldrbq_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = load <16 x i8>, <16 x i8>* %0, align 1
  ret <16 x i8> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vldrbq_s16(i8* %base) {
; CHECK-LABEL: test_vldrbq_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.s16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <8 x i8>*
  %1 = load <8 x i8>, <8 x i8>* %0, align 1
  %2 = sext <8 x i8> %1 to <8 x i16>
  ret <8 x i16> %2
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrbq_s32(i8* %base) {
; CHECK-LABEL: test_vldrbq_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.s32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <4 x i8>*
  %1 = load <4 x i8>, <4 x i8>* %0, align 1
  %2 = sext <4 x i8> %1 to <4 x i32>
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <16 x i8> @test_vldrbq_u8(i8* %base) {
; CHECK-LABEL: test_vldrbq_u8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = load <16 x i8>, <16 x i8>* %0, align 1
  ret <16 x i8> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vldrbq_u16(i8* %base) {
; CHECK-LABEL: test_vldrbq_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <8 x i8>*
  %1 = load <8 x i8>, <8 x i8>* %0, align 1
  %2 = zext <8 x i8> %1 to <8 x i16>
  ret <8 x i16> %2
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrbq_u32(i8* %base) {
; CHECK-LABEL: test_vldrbq_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrb.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <4 x i8>*
  %1 = load <4 x i8>, <4 x i8>* %0, align 1
  %2 = zext <4 x i8> %1 to <4 x i32>
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <16 x i8> @test_vldrbq_z_s8(i8* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrbq_z_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrbt.u8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %1)
  %3 = call <16 x i8> @llvm.masked.load.v16i8.p0v16i8(<16 x i8>* %0, i32 1, <16 x i1> %2, <16 x i8> zeroinitializer)
  ret <16 x i8> %3
}

define arm_aapcs_vfpcc <8 x i16> @test_vldrbq_z_s16(i8* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrbq_z_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrbt.s16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <8 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  %3 = call <8 x i8> @llvm.masked.load.v8i8.p0v8i8(<8 x i8>* %0, i32 1, <8 x i1> %2, <8 x i8> zeroinitializer)
  %4 = sext <8 x i8> %3 to <8 x i16>
  ret <8 x i16> %4
}

declare <8 x i8> @llvm.masked.load.v8i8.p0v8i8(<8 x i8>*, i32 immarg, <8 x i1>, <8 x i8>)

define arm_aapcs_vfpcc <4 x i32> @test_vldrbq_z_s32(i8* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrbq_z_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrbt.s32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <4 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x i8> @llvm.masked.load.v4i8.p0v4i8(<4 x i8>* %0, i32 1, <4 x i1> %2, <4 x i8> zeroinitializer)
  %4 = sext <4 x i8> %3 to <4 x i32>
  ret <4 x i32> %4
}

declare <4 x i8> @llvm.masked.load.v4i8.p0v4i8(<4 x i8>*, i32 immarg, <4 x i1>, <4 x i8>)

define arm_aapcs_vfpcc <16 x i8> @test_vldrbq_z_u8(i8* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrbq_z_u8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrbt.u8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %1)
  %3 = call <16 x i8> @llvm.masked.load.v16i8.p0v16i8(<16 x i8>* %0, i32 1, <16 x i1> %2, <16 x i8> zeroinitializer)
  ret <16 x i8> %3
}

define arm_aapcs_vfpcc <8 x i16> @test_vldrbq_z_u16(i8* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrbq_z_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrbt.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <8 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  %3 = call <8 x i8> @llvm.masked.load.v8i8.p0v8i8(<8 x i8>* %0, i32 1, <8 x i1> %2, <8 x i8> zeroinitializer)
  %4 = zext <8 x i8> %3 to <8 x i16>
  ret <8 x i16> %4
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrbq_z_u32(i8* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrbq_z_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrbt.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <4 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x i8> @llvm.masked.load.v4i8.p0v4i8(<4 x i8>* %0, i32 1, <4 x i1> %2, <4 x i8> zeroinitializer)
  %4 = zext <4 x i8> %3 to <4 x i32>
  ret <4 x i32> %4
}

define arm_aapcs_vfpcc <8 x half> @test_vldrhq_f16(half* %base) {
; CHECK-LABEL: test_vldrhq_f16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast half* %base to <8 x half>*
  %1 = load <8 x half>, <8 x half>* %0, align 2
  ret <8 x half> %1
}

define arm_aapcs_vfpcc <8 x i16> @test_vldrhq_s16(i16* %base) {
; CHECK-LABEL: test_vldrhq_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = load <8 x i16>, <8 x i16>* %0, align 2
  ret <8 x i16> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrhq_s32(i16* %base) {
; CHECK-LABEL: test_vldrhq_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.s32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <4 x i16>*
  %1 = load <4 x i16>, <4 x i16>* %0, align 2
  %2 = sext <4 x i16> %1 to <4 x i32>
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <8 x i16> @test_vldrhq_u16(i16* %base) {
; CHECK-LABEL: test_vldrhq_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = load <8 x i16>, <8 x i16>* %0, align 2
  ret <8 x i16> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrhq_u32(i16* %base) {
; CHECK-LABEL: test_vldrhq_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrh.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <4 x i16>*
  %1 = load <4 x i16>, <4 x i16>* %0, align 2
  %2 = zext <4 x i16> %1 to <4 x i32>
  ret <4 x i32> %2
}

define arm_aapcs_vfpcc <8 x half> @test_vldrhq_z_f16(half* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrhq_z_f16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrht.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast half* %base to <8 x half>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  %3 = call <8 x half> @llvm.masked.load.v8f16.p0v8f16(<8 x half>* %0, i32 2, <8 x i1> %2, <8 x half> zeroinitializer)
  ret <8 x half> %3
}

define arm_aapcs_vfpcc <8 x i16> @test_vldrhq_z_s16(i16* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrhq_z_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrht.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  %3 = call <8 x i16> @llvm.masked.load.v8i16.p0v8i16(<8 x i16>* %0, i32 2, <8 x i1> %2, <8 x i16> zeroinitializer)
  ret <8 x i16> %3
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrhq_z_s32(i16* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrhq_z_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrht.s32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <4 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x i16> @llvm.masked.load.v4i16.p0v4i16(<4 x i16>* %0, i32 2, <4 x i1> %2, <4 x i16> zeroinitializer)
  %4 = sext <4 x i16> %3 to <4 x i32>
  ret <4 x i32> %4
}

declare <4 x i16> @llvm.masked.load.v4i16.p0v4i16(<4 x i16>*, i32 immarg, <4 x i1>, <4 x i16>)

define arm_aapcs_vfpcc <8 x i16> @test_vldrhq_z_u16(i16* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrhq_z_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrht.u16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  %3 = call <8 x i16> @llvm.masked.load.v8i16.p0v8i16(<8 x i16>* %0, i32 2, <8 x i1> %2, <8 x i16> zeroinitializer)
  ret <8 x i16> %3
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrhq_z_u32(i16* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrhq_z_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrht.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <4 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x i16> @llvm.masked.load.v4i16.p0v4i16(<4 x i16>* %0, i32 2, <4 x i1> %2, <4 x i16> zeroinitializer)
  %4 = zext <4 x i16> %3 to <4 x i32>
  ret <4 x i32> %4
}

define arm_aapcs_vfpcc <4 x float> @test_vldrwq_f32(float* %base) {
; CHECK-LABEL: test_vldrwq_f32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast float* %base to <4 x float>*
  %1 = load <4 x float>, <4 x float>* %0, align 4
  ret <4 x float> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrwq_s32(i32* %base) {
; CHECK-LABEL: test_vldrwq_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = load <4 x i32>, <4 x i32>* %0, align 4
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrwq_u32(i32* %base) {
; CHECK-LABEL: test_vldrwq_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vldrw.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = load <4 x i32>, <4 x i32>* %0, align 4
  ret <4 x i32> %1
}

define arm_aapcs_vfpcc <4 x float> @test_vldrwq_z_f32(float* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrwq_z_f32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrwt.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast float* %base to <4 x float>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x float> @llvm.masked.load.v4f32.p0v4f32(<4 x float>* %0, i32 4, <4 x i1> %2, <4 x float> zeroinitializer)
  ret <4 x float> %3
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrwq_z_s32(i32* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrwq_z_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrwt.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %0, i32 4, <4 x i1> %2, <4 x i32> zeroinitializer)
  ret <4 x i32> %3
}

define arm_aapcs_vfpcc <4 x i32> @test_vldrwq_z_u32(i32* %base, i16 zeroext %p) {
; CHECK-LABEL: test_vldrwq_z_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vldrwt.u32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  %3 = call <4 x i32> @llvm.masked.load.v4i32.p0v4i32(<4 x i32>* %0, i32 4, <4 x i1> %2, <4 x i32> zeroinitializer)
  ret <4 x i32> %3
}

define arm_aapcs_vfpcc void @test_vst1q_f16(half* %base, <8 x half> %value) {
; CHECK-LABEL: test_vst1q_f16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast half* %base to <8 x half>*
  store <8 x half> %value, <8 x half>* %0, align 2
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_f32(float* %base, <4 x float> %value) {
; CHECK-LABEL: test_vst1q_f32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast float* %base to <4 x float>*
  store <4 x float> %value, <4 x float>* %0, align 4
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_s8(i8* %base, <16 x i8> %value) {
; CHECK-LABEL: test_vst1q_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrb.8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  store <16 x i8> %value, <16 x i8>* %0, align 1
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_s16(i16* %base, <8 x i16> %value) {
; CHECK-LABEL: test_vst1q_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  store <8 x i16> %value, <8 x i16>* %0, align 2
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_s32(i32* %base, <4 x i32> %value) {
; CHECK-LABEL: test_vst1q_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  store <4 x i32> %value, <4 x i32>* %0, align 4
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_u8(i8* %base, <16 x i8> %value) {
; CHECK-LABEL: test_vst1q_u8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrb.8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  store <16 x i8> %value, <16 x i8>* %0, align 1
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_u16(i16* %base, <8 x i16> %value) {
; CHECK-LABEL: test_vst1q_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  store <8 x i16> %value, <8 x i16>* %0, align 2
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_u32(i32* %base, <4 x i32> %value) {
; CHECK-LABEL: test_vst1q_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  store <4 x i32> %value, <4 x i32>* %0, align 4
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_p_f16(half* %base, <8 x half> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vst1q_p_f16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrht.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast half* %base to <8 x half>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  call void @llvm.masked.store.v8f16.p0v8f16(<8 x half> %value, <8 x half>* %0, i32 2, <8 x i1> %2)
  ret void
}

declare void @llvm.masked.store.v8f16.p0v8f16(<8 x half>, <8 x half>*, i32 immarg, <8 x i1>)

define arm_aapcs_vfpcc void @test_vst1q_p_f32(float* %base, <4 x float> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vst1q_p_f32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrwt.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast float* %base to <4 x float>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  call void @llvm.masked.store.v4f32.p0v4f32(<4 x float> %value, <4 x float>* %0, i32 4, <4 x i1> %2)
  ret void
}

declare void @llvm.masked.store.v4f32.p0v4f32(<4 x float>, <4 x float>*, i32 immarg, <4 x i1>)

define arm_aapcs_vfpcc void @test_vst1q_p_s8(i8* %base, <16 x i8> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vst1q_p_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrbt.8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %1)
  call void @llvm.masked.store.v16i8.p0v16i8(<16 x i8> %value, <16 x i8>* %0, i32 1, <16 x i1> %2)
  ret void
}

declare void @llvm.masked.store.v16i8.p0v16i8(<16 x i8>, <16 x i8>*, i32 immarg, <16 x i1>)

define arm_aapcs_vfpcc void @test_vst1q_p_s16(i16* %base, <8 x i16> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vst1q_p_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrht.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  call void @llvm.masked.store.v8i16.p0v8i16(<8 x i16> %value, <8 x i16>* %0, i32 2, <8 x i1> %2)
  ret void
}

declare void @llvm.masked.store.v8i16.p0v8i16(<8 x i16>, <8 x i16>*, i32 immarg, <8 x i1>)

define arm_aapcs_vfpcc void @test_vst1q_p_s32(i32* %base, <4 x i32> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vst1q_p_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrwt.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %value, <4 x i32>* %0, i32 4, <4 x i1> %2)
  ret void
}

declare void @llvm.masked.store.v4i32.p0v4i32(<4 x i32>, <4 x i32>*, i32 immarg, <4 x i1>)

define arm_aapcs_vfpcc void @test_vst1q_p_u8(i8* %base, <16 x i8> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vst1q_p_u8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrbt.8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %1)
  call void @llvm.masked.store.v16i8.p0v16i8(<16 x i8> %value, <16 x i8>* %0, i32 1, <16 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_p_u16(i16* %base, <8 x i16> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vst1q_p_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrht.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  call void @llvm.masked.store.v8i16.p0v8i16(<8 x i16> %value, <8 x i16>* %0, i32 2, <8 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vst1q_p_u32(i32* %base, <4 x i32> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vst1q_p_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrwt.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %value, <4 x i32>* %0, i32 4, <4 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_s8(i8* %base, <16 x i8> %value) {
; CHECK-LABEL: test_vstrbq_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrb.8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  store <16 x i8> %value, <16 x i8>* %0, align 1
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_s16(i8* %base, <8 x i16> %value) {
; CHECK-LABEL: test_vstrbq_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrb.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <8 x i16> %value to <8 x i8>
  %1 = bitcast i8* %base to <8 x i8>*
  store <8 x i8> %0, <8 x i8>* %1, align 1
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_s32(i8* %base, <4 x i32> %value) {
; CHECK-LABEL: test_vstrbq_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrb.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %value to <4 x i8>
  %1 = bitcast i8* %base to <4 x i8>*
  store <4 x i8> %0, <4 x i8>* %1, align 1
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_u8(i8* %base, <16 x i8> %value) {
; CHECK-LABEL: test_vstrbq_u8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrb.8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  store <16 x i8> %value, <16 x i8>* %0, align 1
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_u16(i8* %base, <8 x i16> %value) {
; CHECK-LABEL: test_vstrbq_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrb.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <8 x i16> %value to <8 x i8>
  %1 = bitcast i8* %base to <8 x i8>*
  store <8 x i8> %0, <8 x i8>* %1, align 1
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_u32(i8* %base, <4 x i32> %value) {
; CHECK-LABEL: test_vstrbq_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrb.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %value to <4 x i8>
  %1 = bitcast i8* %base to <4 x i8>*
  store <4 x i8> %0, <4 x i8>* %1, align 1
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_p_s8(i8* %base, <16 x i8> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrbq_p_s8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrbt.8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %1)
  call void @llvm.masked.store.v16i8.p0v16i8(<16 x i8> %value, <16 x i8>* %0, i32 1, <16 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_p_s16(i8* %base, <8 x i16> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrbq_p_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrbt.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <8 x i16> %value to <8 x i8>
  %1 = bitcast i8* %base to <8 x i8>*
  %2 = zext i16 %p to i32
  %3 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %2)
  call void @llvm.masked.store.v8i8.p0v8i8(<8 x i8> %0, <8 x i8>* %1, i32 1, <8 x i1> %3)
  ret void
}

declare void @llvm.masked.store.v8i8.p0v8i8(<8 x i8>, <8 x i8>*, i32 immarg, <8 x i1>)

define arm_aapcs_vfpcc void @test_vstrbq_p_s32(i8* %base, <4 x i32> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrbq_p_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrbt.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %value to <4 x i8>
  %1 = bitcast i8* %base to <4 x i8>*
  %2 = zext i16 %p to i32
  %3 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %2)
  call void @llvm.masked.store.v4i8.p0v4i8(<4 x i8> %0, <4 x i8>* %1, i32 1, <4 x i1> %3)
  ret void
}

declare void @llvm.masked.store.v4i8.p0v4i8(<4 x i8>, <4 x i8>*, i32 immarg, <4 x i1>)

define arm_aapcs_vfpcc void @test_vstrbq_p_u8(i8* %base, <16 x i8> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrbq_p_u8:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrbt.8 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i8* %base to <16 x i8>*
  %1 = zext i16 %p to i32
  %2 = call <16 x i1> @llvm.arm.mve.pred.i2v.v16i1(i32 %1)
  call void @llvm.masked.store.v16i8.p0v16i8(<16 x i8> %value, <16 x i8>* %0, i32 1, <16 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_p_u16(i8* %base, <8 x i16> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrbq_p_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrbt.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <8 x i16> %value to <8 x i8>
  %1 = bitcast i8* %base to <8 x i8>*
  %2 = zext i16 %p to i32
  %3 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %2)
  call void @llvm.masked.store.v8i8.p0v8i8(<8 x i8> %0, <8 x i8>* %1, i32 1, <8 x i1> %3)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrbq_p_u32(i8* %base, <4 x i32> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrbq_p_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrbt.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %value to <4 x i8>
  %1 = bitcast i8* %base to <4 x i8>*
  %2 = zext i16 %p to i32
  %3 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %2)
  call void @llvm.masked.store.v4i8.p0v4i8(<4 x i8> %0, <4 x i8>* %1, i32 1, <4 x i1> %3)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_f16(half* %base, <8 x half> %value) {
; CHECK-LABEL: test_vstrhq_f16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast half* %base to <8 x half>*
  store <8 x half> %value, <8 x half>* %0, align 2
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_s16(i16* %base, <8 x i16> %value) {
; CHECK-LABEL: test_vstrhq_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  store <8 x i16> %value, <8 x i16>* %0, align 2
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_s32(i16* %base, <4 x i32> %value) {
; CHECK-LABEL: test_vstrhq_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrh.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %value to <4 x i16>
  %1 = bitcast i16* %base to <4 x i16>*
  store <4 x i16> %0, <4 x i16>* %1, align 2
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_u16(i16* %base, <8 x i16> %value) {
; CHECK-LABEL: test_vstrhq_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrh.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  store <8 x i16> %value, <8 x i16>* %0, align 2
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_u32(i16* %base, <4 x i32> %value) {
; CHECK-LABEL: test_vstrhq_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrh.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %value to <4 x i16>
  %1 = bitcast i16* %base to <4 x i16>*
  store <4 x i16> %0, <4 x i16>* %1, align 2
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_p_f16(half* %base, <8 x half> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrhq_p_f16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrht.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast half* %base to <8 x half>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  call void @llvm.masked.store.v8f16.p0v8f16(<8 x half> %value, <8 x half>* %0, i32 2, <8 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_p_s16(i16* %base, <8 x i16> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrhq_p_s16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrht.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  call void @llvm.masked.store.v8i16.p0v8i16(<8 x i16> %value, <8 x i16>* %0, i32 2, <8 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_p_s32(i16* %base, <4 x i32> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrhq_p_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrht.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %value to <4 x i16>
  %1 = bitcast i16* %base to <4 x i16>*
  %2 = zext i16 %p to i32
  %3 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %2)
  call void @llvm.masked.store.v4i16.p0v4i16(<4 x i16> %0, <4 x i16>* %1, i32 2, <4 x i1> %3)
  ret void
}

declare void @llvm.masked.store.v4i16.p0v4i16(<4 x i16>, <4 x i16>*, i32 immarg, <4 x i1>)

define arm_aapcs_vfpcc void @test_vstrhq_p_u16(i16* %base, <8 x i16> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrhq_p_u16:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrht.16 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i16* %base to <8 x i16>*
  %1 = zext i16 %p to i32
  %2 = call <8 x i1> @llvm.arm.mve.pred.i2v.v8i1(i32 %1)
  call void @llvm.masked.store.v8i16.p0v8i16(<8 x i16> %value, <8 x i16>* %0, i32 2, <8 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrhq_p_u32(i16* %base, <4 x i32> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrhq_p_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrht.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = trunc <4 x i32> %value to <4 x i16>
  %1 = bitcast i16* %base to <4 x i16>*
  %2 = zext i16 %p to i32
  %3 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %2)
  call void @llvm.masked.store.v4i16.p0v4i16(<4 x i16> %0, <4 x i16>* %1, i32 2, <4 x i1> %3)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrwq_f32(float* %base, <4 x float> %value) {
; CHECK-LABEL: test_vstrwq_f32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast float* %base to <4 x float>*
  store <4 x float> %value, <4 x float>* %0, align 4
  ret void
}

define arm_aapcs_vfpcc void @test_vstrwq_s32(i32* %base, <4 x i32> %value) {
; CHECK-LABEL: test_vstrwq_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  store <4 x i32> %value, <4 x i32>* %0, align 4
  ret void
}

define arm_aapcs_vfpcc void @test_vstrwq_u32(i32* %base, <4 x i32> %value) {
; CHECK-LABEL: test_vstrwq_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vstrw.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  store <4 x i32> %value, <4 x i32>* %0, align 4
  ret void
}

define arm_aapcs_vfpcc void @test_vstrwq_p_f32(float* %base, <4 x float> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrwq_p_f32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrwt.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast float* %base to <4 x float>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  call void @llvm.masked.store.v4f32.p0v4f32(<4 x float> %value, <4 x float>* %0, i32 4, <4 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrwq_p_s32(i32* %base, <4 x i32> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrwq_p_s32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrwt.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %value, <4 x i32>* %0, i32 4, <4 x i1> %2)
  ret void
}

define arm_aapcs_vfpcc void @test_vstrwq_p_u32(i32* %base, <4 x i32> %value, i16 zeroext %p) {
; CHECK-LABEL: test_vstrwq_p_u32:
; CHECK:       @ %bb.0: @ %entry
; CHECK-NEXT:    vmsr p0, r1
; CHECK-NEXT:    vpst
; CHECK-NEXT:    vstrwt.32 q0, [r0]
; CHECK-NEXT:    bx lr
entry:
  %0 = bitcast i32* %base to <4 x i32>*
  %1 = zext i16 %p to i32
  %2 = call <4 x i1> @llvm.arm.mve.pred.i2v.v4i1(i32 %1)
  call void @llvm.masked.store.v4i32.p0v4i32(<4 x i32> %value, <4 x i32>* %0, i32 4, <4 x i1> %2)
  ret void
}