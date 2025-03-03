part of 'package:sdcpp/sdcpp.dart';

class ContextParams extends ChangeNotifier{
  File _model;

  File get model => _model;

  set model(File value) {
    assert(value.existsSync(), StableDiffusionException('Model file does not exist'));
    _model = value;
    notifyListeners();
  }

  File _clipL;

  File get clipL => _clipL;

  set clipL(File value) {
    assert(value.existsSync(), StableDiffusionException('Clip L file does not exist'));
    _clipL = value;
    notifyListeners();
  }

  File _clipG;

  File get clipG => _clipG;

  set clipG(File value) {
    assert(value.existsSync(), StableDiffusionException('Clip G file does not exist'));
    _clipG = value;
    notifyListeners();
  }

  File _t5xxl;

  File get t5xxl => _t5xxl;

  set t5xxl(File value) {
    assert(value.existsSync(), StableDiffusionException('T5XXL file does not exist'));
    _t5xxl = value;
    notifyListeners();
  }

  File _diffusionModel;

  File get diffusionModel => _diffusionModel;

  set diffusionModel(File value) {
    assert(value.existsSync(), StableDiffusionException('Diffusion model file does not exist'));
    _diffusionModel = value;
    notifyListeners();
  }
  
  File _vae;

  File get vae => _vae;

  set vae(File value) {
    assert(value.existsSync(), StableDiffusionException('VAE file does not exist'));
    _vae = value;
    notifyListeners();
  }

  File _taesd;

  File get taesd => _taesd;

  set taesd(File value) {
    assert(value.existsSync(), StableDiffusionException('TAESD file does not exist'));
    _taesd = value;
    notifyListeners();
  }

  File _controlnet;

  File get controlnet => _controlnet;

  set controlnet(File value) {
    assert(value.existsSync(), StableDiffusionException('Controlnet file does not exist'));
    _controlnet = value;
    notifyListeners();
  }

  File _embeddings;

  File get embeddings => _embeddings;

  set embeddings(File value) {
    assert(value.existsSync(), StableDiffusionException('Embeddings file does not exist'));
    _embeddings = value;
    notifyListeners();
  }

  File _stackedIdEmbeddings;

  File get stackedIdEmbeddings => _stackedIdEmbeddings;

  set stackedIdEmbeddings(File value) {
    assert(value.existsSync(), StableDiffusionException('Stacked ID embeddings file does not exist'));
    _stackedIdEmbeddings = value;
    notifyListeners();
  }

  File _inputIdImages;

  File get inputIdImages => _inputIdImages;

  set inputIdImages(File value) {
    assert(value.existsSync(), StableDiffusionException('Input ID images file does not exist'));
    _inputIdImages = value;
    notifyListeners();
  }

  File _loraModel;

  File get loraModel => _loraModel;

  set loraModel(File value) {
    assert(value.existsSync(), StableDiffusionException('Lora model file does not exist'));
    _loraModel = value;
    notifyListeners();
  }

  bool _vaeDecodeOnly;

  bool get vaeDecodeOnly => _vaeDecodeOnly;

  set vaeDecodeOnly(bool value) {
    _vaeDecodeOnly = value;
    notifyListeners();
  }

  bool _vaeTiling;

  bool get vaeTiling => _vaeTiling;

  set vaeTiling(bool value) {
    _vaeTiling = value;
    notifyListeners();
  }

  bool _freeParamsImmediately;

  bool get freeParamsImmediately => _freeParamsImmediately;

  set freeParamsImmediately(bool value) {
    _freeParamsImmediately = value;
    notifyListeners();
  }

  int _nThreads;

  int get nThreads => _nThreads;

  set nThreads(int value) {
    _nThreads = value;
    notifyListeners();
  }

  StableDiffusionType _wType;

  StableDiffusionType get wType => _wType;

  set wType(StableDiffusionType value) {
    _wType = value;
    notifyListeners();
  }

  ScheduleType _sType;

  ScheduleType get sType => _sType;

  set sType(ScheduleType value) {
    _sType = value;
    notifyListeners();
  }

  bool _keepClipOnCpu;

  bool get keepClipOnCpu => _keepClipOnCpu;

  set keepClipOnCpu(bool value) {
    _keepClipOnCpu = value;
    notifyListeners();
  }

  bool _keepControlNetCpu;

  bool get keepControlNetCpu => _keepControlNetCpu;

  set keepControlNetCpu(bool value) {
    _keepControlNetCpu = value;
    notifyListeners();
  }

  bool _keepVaeOnCpu;

  bool get keepVaeOnCpu => _keepVaeOnCpu;

  set keepVaeOnCpu(bool value) {
    _keepVaeOnCpu = value;
    notifyListeners();
  }

  bool _diffusionFlashAttn;

  bool get diffusionFlashAttn => _diffusionFlashAttn;

  set diffusionFlashAttn(bool value) {
    _diffusionFlashAttn = value;
    notifyListeners();
  }

  ContextParams({
    required File model,
    required File clipL,
    required File clipG,
    required File t5xxl,
    required File diffusionModel,
    required File vae,
    required File taesd,
    required File controlnet,
    required File embeddings,
    required File stackedIdEmbeddings,
    required File inputIdImages,
    required File loraModel,
    required bool vaeDecodeOnly,
    required bool vaeTiling,
    required bool freeParamsImmediately,
    required int nThreads,
    required StableDiffusionType wType,
    required ScheduleType sType,
    required bool keepClipOnCpu,
    required bool keepControlNetCpu,
    required bool keepVaeOnCpu,
    required bool diffusionFlashAttn
  }) : _model = model,
       _clipL = clipL,
       _clipG = clipG,
       _t5xxl = t5xxl,
       _diffusionModel = diffusionModel,
       _vae = vae,
       _taesd = taesd,
       _controlnet = controlnet,
       _embeddings = embeddings,
       _stackedIdEmbeddings = stackedIdEmbeddings,
       _inputIdImages = inputIdImages,
       _loraModel = loraModel,
       _vaeDecodeOnly = vaeDecodeOnly,
       _vaeTiling = vaeTiling,
       _freeParamsImmediately = freeParamsImmediately,
       _nThreads = nThreads,
       _wType = wType,
       _sType = sType,
       _keepClipOnCpu = keepClipOnCpu,
       _keepControlNetCpu = keepControlNetCpu,
       _keepVaeOnCpu = keepVaeOnCpu,
       _diffusionFlashAttn = diffusionFlashAttn {
    assert(_model.existsSync(), StableDiffusionException('Model file does not exist'));
    assert(_clipL.existsSync(), StableDiffusionException('Clip L file does not exist'));
    assert(_clipG.existsSync(), StableDiffusionException('Clip G file does not exist'));
    assert(_t5xxl.existsSync(), StableDiffusionException('T5XXL file does not exist'));
    assert(_diffusionModel.existsSync(), StableDiffusionException('Diffusion model file does not exist'));
    assert(_vae.existsSync(), StableDiffusionException('VAE file does not exist'));
    assert(_taesd.existsSync(), StableDiffusionException('TAESD file does not exist'));
    assert(_controlnet.existsSync(), StableDiffusionException('Controlnet file does not exist'));
    assert(_embeddings.existsSync(), StableDiffusionException('Embeddings file does not exist'));
    assert(_stackedIdEmbeddings.existsSync(), StableDiffusionException('Stacked ID embeddings file does not exist'));
    assert(_inputIdImages.existsSync(), StableDiffusionException('Input ID images file does not exist'));
    assert(_loraModel.existsSync(), StableDiffusionException('Lora model file does not exist'));
  }

  ffi.Pointer<sd_ctx_t> toNative() => StableDiffusion.lib.new_sd_ctx(
    _model.path.toNativeUtf8().cast<ffi.Char>(), 
    _clipL.path.toNativeUtf8().cast<ffi.Char>(), 
    _clipG.path.toNativeUtf8().cast<ffi.Char>(), 
    _t5xxl.path.toNativeUtf8().cast<ffi.Char>(), 
    _diffusionModel.path.toNativeUtf8().cast<ffi.Char>(),
    _vae.path.toNativeUtf8().cast<ffi.Char>(),
    _taesd.path.toNativeUtf8().cast<ffi.Char>(), 
    _controlnet.path.toNativeUtf8().cast<ffi.Char>(), 
    _loraModel.path.toNativeUtf8().cast<ffi.Char>(), 
    _embeddings.path.toNativeUtf8().cast<ffi.Char>(), 
    _stackedIdEmbeddings.path.toNativeUtf8().cast<ffi.Char>(), 
    _vaeDecodeOnly, 
    _vaeTiling, 
    _freeParamsImmediately, 
    _nThreads, 
    _wType.toNative(), 
    rng_type_t.STD_DEFAULT_RNG, // CUDA RNG not supported
    _sType.toNative(), 
    _keepClipOnCpu, 
    _keepControlNetCpu, 
    _keepVaeOnCpu, 
    _diffusionFlashAttn
  );
}