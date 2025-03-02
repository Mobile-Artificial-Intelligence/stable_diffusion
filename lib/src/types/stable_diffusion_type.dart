// ignore_for_file: constant_identifier_names

part of 'package:sdcpp/sdcpp.dart';

enum StableDiffusionType {
  f32,
  f16,
  q4_0,
  q4_1,
  q5_0,
  q5_1,
  q8_0,
  q8_1,
  q2_k,
  q3_k,
  q4_k,
  q5_k,
  q6_k,
  q8_k,
  iq2xxs,
  iq2xs,
  iq3xxs,
  iq1s,
  iq4nl,
  iq3s,
  iq2s,
  iq4xs,
  i8,
  i16,
  i32,
  i64,
  f64,
  iq1m,
  bf16,
  tq1_0,
  tq2_0,
  count;

  sd_type_t toNative() {
    switch (this) {
      case StableDiffusionType.f32:
        return sd_type_t.SD_TYPE_F32;
      case StableDiffusionType.f16:
        return sd_type_t.SD_TYPE_F16;
      case StableDiffusionType.q4_0:
        return sd_type_t.SD_TYPE_Q4_0;
      case StableDiffusionType.q4_1:
        return sd_type_t.SD_TYPE_Q4_1;
      case StableDiffusionType.q5_0:
        return sd_type_t.SD_TYPE_Q5_0;
      case StableDiffusionType.q5_1:
        return sd_type_t.SD_TYPE_Q5_1;
      case StableDiffusionType.q8_0:
        return sd_type_t.SD_TYPE_Q8_0;
      case StableDiffusionType.q8_1:
        return sd_type_t.SD_TYPE_Q8_1;
      case StableDiffusionType.q2_k:
        return sd_type_t.SD_TYPE_Q2_K;
      case StableDiffusionType.q3_k:
        return sd_type_t.SD_TYPE_Q3_K;
      case StableDiffusionType.q4_k:
        return sd_type_t.SD_TYPE_Q4_K;
      case StableDiffusionType.q5_k:
        return sd_type_t.SD_TYPE_Q5_K;
      case StableDiffusionType.q6_k:
        return sd_type_t.SD_TYPE_Q6_K;
      case StableDiffusionType.q8_k:
        return sd_type_t.SD_TYPE_Q8_K;
      case StableDiffusionType.iq2xxs:
        return sd_type_t.SD_TYPE_IQ2_XXS;
      case StableDiffusionType.iq2xs:
        return sd_type_t.SD_TYPE_IQ2_XS;
      case StableDiffusionType.iq3xxs:
        return sd_type_t.SD_TYPE_IQ3_XXS;
      case StableDiffusionType.iq1s:
        return sd_type_t.SD_TYPE_IQ1_S;
      case StableDiffusionType.iq4nl:
        return sd_type_t.SD_TYPE_IQ4_NL;
      case StableDiffusionType.iq3s:
        return sd_type_t.SD_TYPE_IQ3_S;
      case StableDiffusionType.iq2s:
        return sd_type_t.SD_TYPE_IQ2_S;
      case StableDiffusionType.iq4xs:
        return sd_type_t.SD_TYPE_IQ4_XS;
      case StableDiffusionType.i8:
        return sd_type_t.SD_TYPE_I8;
      case StableDiffusionType.i16:
        return sd_type_t.SD_TYPE_I16;
      case StableDiffusionType.i32:
        return sd_type_t.SD_TYPE_I32;
      case StableDiffusionType.i64:
        return sd_type_t.SD_TYPE_I64;
      case StableDiffusionType.f64:
        return sd_type_t.SD_TYPE_F64;
      case StableDiffusionType.iq1m:
        return sd_type_t.SD_TYPE_IQ1_M;
      case StableDiffusionType.bf16:
        return sd_type_t.SD_TYPE_BF16;
      case StableDiffusionType.tq1_0:
        return sd_type_t.SD_TYPE_TQ1_0;
      case StableDiffusionType.tq2_0:
        return sd_type_t.SD_TYPE_TQ2_0;
      case StableDiffusionType.count:
        return sd_type_t.SD_TYPE_COUNT;
    }
  }
}