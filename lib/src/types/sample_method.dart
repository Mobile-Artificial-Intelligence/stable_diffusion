part of 'package:sdcpp/sdcpp.dart';

enum SampleMethod {
  eulerA,
  euler,
  heun,
  dpm2,
  dpmpp2sA,
  dpmpp2m,
  dpmpp2mv2,
  ipndm,
  ipmdmv,
  lcm,
  ddimTrailing,
  tcd,
  count;

  sample_method_t toNative() {
    switch (this) {
      case SampleMethod.eulerA:
        return sample_method_t.EULER_A;
      case SampleMethod.euler:
        return sample_method_t.EULER;
      case SampleMethod.heun:
        return sample_method_t.HEUN;
      case SampleMethod.dpm2:
        return sample_method_t.DPM2;
      case SampleMethod.dpmpp2sA:
        return sample_method_t.DPMPP2S_A;
      case SampleMethod.dpmpp2m:
        return sample_method_t.DPMPP2M;
      case SampleMethod.dpmpp2mv2:
        return sample_method_t.DPMPP2Mv2;
      case SampleMethod.ipndm:
        return sample_method_t.IPNDM;
      case SampleMethod.ipmdmv:
        return sample_method_t.IPNDM_V;
      case SampleMethod.lcm:
        return sample_method_t.LCM;
      case SampleMethod.ddimTrailing:
        return sample_method_t.DDIM_TRAILING;
      case SampleMethod.tcd:
        return sample_method_t.TCD;
      case SampleMethod.count:
        return sample_method_t.N_SAMPLE_METHODS;
    }
  }
}