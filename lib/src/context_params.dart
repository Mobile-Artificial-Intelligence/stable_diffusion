part of 'package:sdcpp/sdcpp.dart';

class ContextParams {
  final File model;
  final File clipL;
  final File clipG;
  final File t5xxl;
  final File diffusionModel;
  final File vae;
  final File taesd;
  final File controlnet;
  final File embeddings;
  final File stackedIdEmbeddings;
  final File inputIdImages;
  final File loraModel;
  final bool vaeDecodeOnly;
  final bool vaeTiling;
  final bool freeParamsImmediately;
  final int nThreads;
  final StableDiffusionType wType;
  final ScheduleType sType;
  final bool keepClipOnCpu;
  final bool keepControlNetCpu;
  final bool keepVaeOnCpu;
  final bool diffusionFlashAttn;

  const ContextParams({
    required this.model,
    required this.clipL,
    required this.clipG,
    required this.t5xxl,
    required this.diffusionModel,
    required this.vae,
    required this.taesd,
    required this.controlnet,
    required this.embeddings,
    required this.stackedIdEmbeddings,
    required this.inputIdImages,
    required this.loraModel,
    required this.vaeDecodeOnly,
    required this.vaeTiling,
    required this.freeParamsImmediately,
    required this.nThreads,
    required this.wType,
    required this.sType,
    required this.keepClipOnCpu,
    required this.keepControlNetCpu,
    required this.keepVaeOnCpu,
    required this.diffusionFlashAttn
  });

  ffi.Pointer<sd_ctx_t> toNative() => StableDiffusion.lib.new_sd_ctx(
    model.path.toNativeUtf8().cast<ffi.Char>(), 
    clipL.path.toNativeUtf8().cast<ffi.Char>(), 
    clipG.path.toNativeUtf8().cast<ffi.Char>(), 
    t5xxl.path.toNativeUtf8().cast<ffi.Char>(), 
    diffusionModel.path.toNativeUtf8().cast<ffi.Char>(),
    vae.path.toNativeUtf8().cast<ffi.Char>(),
    taesd.path.toNativeUtf8().cast<ffi.Char>(), 
    controlnet.path.toNativeUtf8().cast<ffi.Char>(), 
    loraModel.path.toNativeUtf8().cast<ffi.Char>(), 
    embeddings.path.toNativeUtf8().cast<ffi.Char>(), 
    stackedIdEmbeddings.path.toNativeUtf8().cast<ffi.Char>(), 
    vaeDecodeOnly, 
    vaeTiling, 
    freeParamsImmediately, 
    nThreads, 
    wType.toNative(), 
    rng_type_t.STD_DEFAULT_RNG, // CUDA RNG not supported
    sType.toNative(), 
    keepClipOnCpu, 
    keepControlNetCpu, 
    keepVaeOnCpu, 
    diffusionFlashAttn
  );
}