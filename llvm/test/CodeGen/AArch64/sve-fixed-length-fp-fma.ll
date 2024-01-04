; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -O3 -aarch64-sve-vector-bits-min=2048 < %s | FileCheck %s

target triple = "aarch64-unknown-linux-gnu"

;
; FMA
;

; Don't use SVE for 64-bit vectors.
define <4 x half> @fma_v4f16(<4 x half> %op1, <4 x half> %op2, <4 x half> %op3) #0 {
; CHECK-LABEL: fma_v4f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla v2.4h, v0.4h, v1.4h
; CHECK-NEXT:    fmov d0, d2
; CHECK-NEXT:    ret
  %mul = fmul contract <4 x half> %op1, %op2
  %res = fadd contract <4 x half> %mul, %op3
  ret <4 x half> %res
}

; Don't use SVE for 128-bit vectors.
define <8 x half> @fma_v8f16(<8 x half> %op1, <8 x half> %op2, <8 x half> %op3) #0 {
; CHECK-LABEL: fma_v8f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla v2.8h, v0.8h, v1.8h
; CHECK-NEXT:    mov v0.16b, v2.16b
; CHECK-NEXT:    ret
  %mul = fmul contract <8 x half> %op1, %op2
  %res = fadd contract <8 x half> %mul, %op3
  ret <8 x half> %res
}

define void @fma_v16f16(<16 x half>* %a, <16 x half>* %b, <16 x half>* %c) #0 {
; CHECK-LABEL: fma_v16f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl16
; CHECK-NEXT:    ld1h { z0.h }, p0/z, [x0]
; CHECK-NEXT:    ld1h { z1.h }, p0/z, [x1]
; CHECK-NEXT:    ld1h { z2.h }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    st1h { z0.h }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <16 x half>, <16 x half>* %a
  %op2 = load <16 x half>, <16 x half>* %b
  %op3 = load <16 x half>, <16 x half>* %c
  %mul = fmul contract <16 x half> %op1, %op2
  %res = fadd contract <16 x half> %mul, %op3
  store <16 x half> %res, <16 x half>* %a
  ret void
}

define void @fma_v32f16(<32 x half>* %a, <32 x half>* %b, <32 x half>* %c) #0 {
; CHECK-LABEL: fma_v32f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl32
; CHECK-NEXT:    ld1h { z0.h }, p0/z, [x0]
; CHECK-NEXT:    ld1h { z1.h }, p0/z, [x1]
; CHECK-NEXT:    ld1h { z2.h }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    st1h { z0.h }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <32 x half>, <32 x half>* %a
  %op2 = load <32 x half>, <32 x half>* %b
  %op3 = load <32 x half>, <32 x half>* %c
  %mul = fmul contract <32 x half> %op1, %op2
  %res = fadd contract <32 x half> %mul, %op3
  store <32 x half> %res, <32 x half>* %a
  ret void
}

define void @fma_v64f16(<64 x half>* %a, <64 x half>* %b, <64 x half>* %c) #0 {
; CHECK-LABEL: fma_v64f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl64
; CHECK-NEXT:    ld1h { z0.h }, p0/z, [x0]
; CHECK-NEXT:    ld1h { z1.h }, p0/z, [x1]
; CHECK-NEXT:    ld1h { z2.h }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    st1h { z0.h }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <64 x half>, <64 x half>* %a
  %op2 = load <64 x half>, <64 x half>* %b
  %op3 = load <64 x half>, <64 x half>* %c
  %mul = fmul contract <64 x half> %op1, %op2
  %res = fadd contract <64 x half> %mul, %op3
  store <64 x half> %res, <64 x half>* %a
  ret void
}

define void @fma_v128f16(<128 x half>* %a, <128 x half>* %b, <128 x half>* %c) #0 {
; CHECK-LABEL: fma_v128f16:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.h, vl128
; CHECK-NEXT:    ld1h { z0.h }, p0/z, [x0]
; CHECK-NEXT:    ld1h { z1.h }, p0/z, [x1]
; CHECK-NEXT:    ld1h { z2.h }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.h, p0/m, z1.h, z2.h
; CHECK-NEXT:    st1h { z0.h }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <128 x half>, <128 x half>* %a
  %op2 = load <128 x half>, <128 x half>* %b
  %op3 = load <128 x half>, <128 x half>* %c
  %mul = fmul contract <128 x half> %op1, %op2
  %res = fadd contract <128 x half> %mul, %op3
  store <128 x half> %res, <128 x half>* %a
  ret void
}

; Don't use SVE for 64-bit vectors.
define <2 x float> @fma_v2f32(<2 x float> %op1, <2 x float> %op2, <2 x float> %op3) #0 {
; CHECK-LABEL: fma_v2f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla v2.2s, v0.2s, v1.2s
; CHECK-NEXT:    fmov d0, d2
; CHECK-NEXT:    ret
  %mul = fmul contract <2 x float> %op1, %op2
  %res = fadd contract <2 x float> %mul, %op3
  ret <2 x float> %res
}

; Don't use SVE for 128-bit vectors.
define <4 x float> @fma_v4f32(<4 x float> %op1, <4 x float> %op2, <4 x float> %op3) #0 {
; CHECK-LABEL: fma_v4f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla v2.4s, v0.4s, v1.4s
; CHECK-NEXT:    mov v0.16b, v2.16b
; CHECK-NEXT:    ret
  %mul = fmul contract <4 x float> %op1, %op2
  %res = fadd contract <4 x float> %mul, %op3
  ret <4 x float> %res
}

define void @fma_v8f32(<8 x float>* %a, <8 x float>* %b, <8 x float>* %c) #0 {
; CHECK-LABEL: fma_v8f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl8
; CHECK-NEXT:    ld1w { z0.s }, p0/z, [x0]
; CHECK-NEXT:    ld1w { z1.s }, p0/z, [x1]
; CHECK-NEXT:    ld1w { z2.s }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    st1w { z0.s }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <8 x float>, <8 x float>* %a
  %op2 = load <8 x float>, <8 x float>* %b
  %op3 = load <8 x float>, <8 x float>* %c
  %mul = fmul contract <8 x float> %op1, %op2
  %res = fadd contract <8 x float> %mul, %op3
  store <8 x float> %res, <8 x float>* %a
  ret void
}

define void @fma_v16f32(<16 x float>* %a, <16 x float>* %b, <16 x float>* %c) #0 {
; CHECK-LABEL: fma_v16f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl16
; CHECK-NEXT:    ld1w { z0.s }, p0/z, [x0]
; CHECK-NEXT:    ld1w { z1.s }, p0/z, [x1]
; CHECK-NEXT:    ld1w { z2.s }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    st1w { z0.s }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <16 x float>, <16 x float>* %a
  %op2 = load <16 x float>, <16 x float>* %b
  %op3 = load <16 x float>, <16 x float>* %c
  %mul = fmul contract <16 x float> %op1, %op2
  %res = fadd contract <16 x float> %mul, %op3
  store <16 x float> %res, <16 x float>* %a
  ret void
}

define void @fma_v32f32(<32 x float>* %a, <32 x float>* %b, <32 x float>* %c) #0 {
; CHECK-LABEL: fma_v32f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl32
; CHECK-NEXT:    ld1w { z0.s }, p0/z, [x0]
; CHECK-NEXT:    ld1w { z1.s }, p0/z, [x1]
; CHECK-NEXT:    ld1w { z2.s }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    st1w { z0.s }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <32 x float>, <32 x float>* %a
  %op2 = load <32 x float>, <32 x float>* %b
  %op3 = load <32 x float>, <32 x float>* %c
  %mul = fmul contract <32 x float> %op1, %op2
  %res = fadd contract <32 x float> %mul, %op3
  store <32 x float> %res, <32 x float>* %a
  ret void
}

define void @fma_v64f32(<64 x float>* %a, <64 x float>* %b, <64 x float>* %c) #0 {
; CHECK-LABEL: fma_v64f32:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.s, vl64
; CHECK-NEXT:    ld1w { z0.s }, p0/z, [x0]
; CHECK-NEXT:    ld1w { z1.s }, p0/z, [x1]
; CHECK-NEXT:    ld1w { z2.s }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.s, p0/m, z1.s, z2.s
; CHECK-NEXT:    st1w { z0.s }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <64 x float>, <64 x float>* %a
  %op2 = load <64 x float>, <64 x float>* %b
  %op3 = load <64 x float>, <64 x float>* %c
  %mul = fmul contract <64 x float> %op1, %op2
  %res = fadd contract <64 x float> %mul, %op3
  store <64 x float> %res, <64 x float>* %a
  ret void
}

; Don't use SVE for 64-bit vectors.
define <1 x double> @fma_v1f64(<1 x double> %op1, <1 x double> %op2, <1 x double> %op3) #0 {
; CHECK-LABEL: fma_v1f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmadd d0, d0, d1, d2
; CHECK-NEXT:    ret
  %mul = fmul contract <1 x double> %op1, %op2
  %res = fadd contract <1 x double> %mul, %op3
  ret <1 x double> %res
}

; Don't use SVE for 128-bit vectors.
define <2 x double> @fma_v2f64(<2 x double> %op1, <2 x double> %op2, <2 x double> %op3) #0 {
; CHECK-LABEL: fma_v2f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    fmla v2.2d, v0.2d, v1.2d
; CHECK-NEXT:    mov v0.16b, v2.16b
; CHECK-NEXT:    ret
  %mul = fmul contract <2 x double> %op1, %op2
  %res = fadd contract <2 x double> %mul, %op3
  ret <2 x double> %res
}

define void @fma_v4f64(<4 x double>* %a, <4 x double>* %b, <4 x double>* %c) #0 {
; CHECK-LABEL: fma_v4f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d, vl4
; CHECK-NEXT:    ld1d { z0.d }, p0/z, [x0]
; CHECK-NEXT:    ld1d { z1.d }, p0/z, [x1]
; CHECK-NEXT:    ld1d { z2.d }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    st1d { z0.d }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <4 x double>, <4 x double>* %a
  %op2 = load <4 x double>, <4 x double>* %b
  %op3 = load <4 x double>, <4 x double>* %c
  %mul = fmul contract <4 x double> %op1, %op2
  %res = fadd contract <4 x double> %mul, %op3
  store <4 x double> %res, <4 x double>* %a
  ret void
}

define void @fma_v8f64(<8 x double>* %a, <8 x double>* %b, <8 x double>* %c) #0 {
; CHECK-LABEL: fma_v8f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d, vl8
; CHECK-NEXT:    ld1d { z0.d }, p0/z, [x0]
; CHECK-NEXT:    ld1d { z1.d }, p0/z, [x1]
; CHECK-NEXT:    ld1d { z2.d }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    st1d { z0.d }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <8 x double>, <8 x double>* %a
  %op2 = load <8 x double>, <8 x double>* %b
  %op3 = load <8 x double>, <8 x double>* %c
  %mul = fmul contract <8 x double> %op1, %op2
  %res = fadd contract <8 x double> %mul, %op3
  store <8 x double> %res, <8 x double>* %a
  ret void
}

define void @fma_v16f64(<16 x double>* %a, <16 x double>* %b, <16 x double>* %c) #0 {
; CHECK-LABEL: fma_v16f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d, vl16
; CHECK-NEXT:    ld1d { z0.d }, p0/z, [x0]
; CHECK-NEXT:    ld1d { z1.d }, p0/z, [x1]
; CHECK-NEXT:    ld1d { z2.d }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    st1d { z0.d }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <16 x double>, <16 x double>* %a
  %op2 = load <16 x double>, <16 x double>* %b
  %op3 = load <16 x double>, <16 x double>* %c
  %mul = fmul contract <16 x double> %op1, %op2
  %res = fadd contract <16 x double> %mul, %op3
  store <16 x double> %res, <16 x double>* %a
  ret void
}

define void @fma_v32f64(<32 x double>* %a, <32 x double>* %b, <32 x double>* %c) #0 {
; CHECK-LABEL: fma_v32f64:
; CHECK:       // %bb.0:
; CHECK-NEXT:    ptrue p0.d, vl32
; CHECK-NEXT:    ld1d { z0.d }, p0/z, [x0]
; CHECK-NEXT:    ld1d { z1.d }, p0/z, [x1]
; CHECK-NEXT:    ld1d { z2.d }, p0/z, [x2]
; CHECK-NEXT:    fmad z0.d, p0/m, z1.d, z2.d
; CHECK-NEXT:    st1d { z0.d }, p0, [x0]
; CHECK-NEXT:    ret
  %op1 = load <32 x double>, <32 x double>* %a
  %op2 = load <32 x double>, <32 x double>* %b
  %op3 = load <32 x double>, <32 x double>* %c
  %mul = fmul contract <32 x double> %op1, %op2
  %res = fadd contract <32 x double> %mul, %op3
  store <32 x double> %res, <32 x double>* %a
  ret void
}

attributes #0 = { "target-features"="+sve" }