part of 'package:sdcpp/sdcpp.dart';

class StableDiffusion {
  ContextParams _contextParams;

  ContextParams get contextParams => _contextParams;

  set contextParams(ContextParams value) {
    _contextParams = value;
    _contextParams.addListener(_initContext);
    _initContext();
  }

  StableDiffusion(ContextParams contextParams) : _contextParams = contextParams { 
    _initContext();
  }

  void _initContext() => lib.stable_diffusion_init(_contextParams.toJson().toNativeUtf8().cast<ffi.Char>());

  Future<List<File>> txt2img({
    required String prompt, 
    String negativePrompt = '', 
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
  }) async {
    seed ??= math.Random().nextInt(1000000);
    skipLayers ??= Uint8List.fromList([7, 8, 9]);

    final temp = await getTemporaryDirectory();

    final Map<String, dynamic> params = {
      'prompt': prompt,
      'negative_prompt': negativePrompt,
      'output_path': temp.path,
      'clip_skip': clipSkip,
      'cfg_scale': cfgScale,
      'guidance': guidance,
      'eta': eta,
      'width': width,
      'height': height,
      'sample_method': sampleMethod.index,
      'sampling_steps': samplingSteps,
      'seed': seed,
      'n_batch': nBatch,
      'control_strength': controlStrength,
      'style_strength': styleStrength,
      'normalize_input': normalizeInput,
      'style_ratio': styleRatio,
      'skip_layers': skipLayers,
      'slg_scale': slgScale,
      'skip_layer_start': skipLayerStart,
      'skip_layer_end': skipLayerEnd
    };

    final input = jsonEncode(params).toNativeUtf8().cast<ffi.Char>();

    final images = lib.stable_diffusion_txt2img(input);

    final List<File> results = [];

    for (int i = 0; i < nBatch; i++) {
      final path = (images + i).cast<Utf8>().toDartString();
      final file = File(path);

      assert(file.existsSync(), StableDiffusionException('Failed to create image'));

      results.add(file);
    }
    
    return results;
  }
}