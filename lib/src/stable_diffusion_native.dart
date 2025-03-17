part of 'package:sdcpp/sdcpp.dart';

class StableDiffusionNative {
  static final _contextFinalizer =
      Finalizer<ffi.Pointer<sd_ctx_t>>(StableDiffusion.lib.free_sd_ctx);
  
  ContextParams _contextParams;

  ffi.Pointer<sd_ctx_t> _context = ffi.nullptr;

  ContextParams get contextParams => _contextParams;

  set contextParams(ContextParams value) {
    _contextParams = value;
    _contextParams.addListener(_initContext);
    _initContext();
  }

  StableDiffusionNative(ContextParams contextParams) : _contextParams = contextParams { 
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

  List<Uint8List> txt2img({
    required String prompt, 
    String? negativePrompt, 
    int clipSkip = -1,
    double cfgScale = 7.0,
    double guidance = 3.5,
    double eta = 0.0,
    int width = 512,
    int height = 512,
    SampleMethod sampleMethod = SampleMethod.eulerA,
    int samplingSteps = 20,
    int? seed,
    int nBatch = 1,
    double controlStrength = 0.9,
    double styleStrength = 0.0, 
    bool normalizeInput = false,
    double styleRatio = 20.0,
    Uint8List? skipLayers,
    double slgScale = 0.0,
    double skipLayerStart = 0.01,
    double skipLayerEnd = 0.2
  }) {
    seed ??= math.Random().nextInt(1000000);
    skipLayers ??= Uint8List.fromList([7, 8, 9]);

    final resultsPtr = StableDiffusion.lib.txt2img(
      _context, 
      prompt.toNativeUtf8().cast<ffi.Char>(), 
      negativePrompt?.toNativeUtf8().cast<ffi.Char>() ?? ffi.nullptr, 
      clipSkip,
      cfgScale, 
      guidance, 
      eta, 
      width, 
      height, 
      sampleMethod.toNative(), 
      samplingSteps,
      seed,
      nBatch,
      ffi.nullptr, // Control Image
      controlStrength,
      styleStrength,
      normalizeInput,
      contextParams.inputIdImages?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr,
      skipLayers.toUint8Pointer(),
      skipLayers.length,
      slgScale,
      skipLayerStart,
      skipLayerEnd
    );

    final List<Uint8List> results = [];

    for (var i = 0; i < nBatch; i++) {
      final image = resultsPtr.ref;
      final bytes = image.data.asTypedList(image.width * image.height * image.channel);
      final rgbaBytes = Uint8List(image.width * image.height * 4);

      for (var i = 0; i < image.width * image.height; i++) {
        rgbaBytes[i * 4 + 0] = bytes[i * 3 + 0];
        rgbaBytes[i * 4 + 1] = bytes[i * 3 + 1];
        rgbaBytes[i * 4 + 2] = bytes[i * 3 + 2];
        rgbaBytes[i * 4 + 3] = 255;
      }

      results.add(rgbaBytes);
    }

    return results;
  }
}