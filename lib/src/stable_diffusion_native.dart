part of 'package:sdcpp/sdcpp.dart';

class StableDiffusionNative {
  static final _contextFinalizer =
      Finalizer<ffi.Pointer<sd_ctx_t>>(StableDiffusion.lib.free_sd_ctx);
  
  late ContextParams _contextParams;
  DiffusionParams diffusionParams;

  ffi.Pointer<sd_ctx_t> _context = ffi.nullptr;

  ContextParams get contextParams => _contextParams;

  set contextParams(ContextParams value) {
    _contextParams = value;

    _initContext();
  }

  StableDiffusionNative(
    ContextParams contextParams, 
    this.diffusionParams
  ) : _contextParams = contextParams{ 
    _initContext();
  }

  void _initContext() {
    if (_context != ffi.nullptr) {
      StableDiffusion.lib.free_sd_ctx(_context);
    }

    _context = _contextParams.toNative();
    assert(_context != ffi.nullptr, StableDiffusionException('Failed to create context'));

    _contextFinalizer.attach(this, _context);
  }

  List<File> txt2img(String prompt, [String? negativePrompt]) {
    ffi.Pointer<sd_image_t> controlImage = ffi.nullptr;

    final results = StableDiffusion.lib.txt2img(
      _context, 
      prompt.toNativeUtf8().cast<ffi.Char>(), 
      negativePrompt?.toNativeUtf8().cast<ffi.Char>() ?? ffi.nullptr, 
      diffusionParams.clipSkip,
      diffusionParams.cfgScale, 
      diffusionParams.guidance, 
      diffusionParams.eta, 
      diffusionParams.width, 
      diffusionParams.height, 
      diffusionParams.sampleMethod.toNative(), 
      diffusionParams.samplingSteps,
      diffusionParams.seed,
      diffusionParams.nBatch,
      controlImage,
      diffusionParams.controlStrength,
      diffusionParams.styleStrength,
      diffusionParams.normalizeInput,
      contextParams.inputIdImages.path.toNativeUtf8().cast<ffi.Char>(),
      diffusionParams.skipLayers.toUint8Pointer(),
      diffusionParams.skipLayers.length,
      diffusionParams.slgScale,
      diffusionParams.skipLayerStart,
      diffusionParams.skipLayerEnd
    );

    return []; // TODO
  }
}