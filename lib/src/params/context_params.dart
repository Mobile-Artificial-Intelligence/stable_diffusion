part of 'package:sdcpp/sdcpp.dart';

final emptyStringPtr = ''.toNativeUtf8().cast<ffi.Char>();

class ContextParams extends ChangeNotifier{
  File? _model;

  File? get model => _model;

  set model(File? value) {
    _model = value;
    notifyListeners();
  }

  File? _clipL;

  File? get clipL => _clipL;

  set clipL(File? value) {
    _clipL = value;
    notifyListeners();
  }

  File? _clipG;

  File? get clipG => _clipG;

  set clipG(File? value) {
    _clipG = value;
    notifyListeners();
  }

  File? _t5xxl;

  File? get t5xxl => _t5xxl;

  set t5xxl(File? value) {
    _t5xxl = value;
    notifyListeners();
  }

  File? _diffusionModel;

  File? get diffusionModel => _diffusionModel;

  set diffusionModel(File? value) {
    _diffusionModel = value;
    notifyListeners();
  }
  
  File? _vae;

  File? get vae => _vae;

  set vae(File? value) {
    _vae = value;
    notifyListeners();
  }

  File? _taesd;

  File? get taesd => _taesd;

  set taesd(File? value) {
    _taesd = value;
    notifyListeners();
  }

  File? _controlnet;

  File? get controlnet => _controlnet;

  set controlnet(File? value) {
    _controlnet = value;
    notifyListeners();
  }

  File? _embeddings;

  File? get embeddings => _embeddings;

  set embeddings(File? value) {
    _embeddings = value;
    notifyListeners();
  }

  File? _stackedIdEmbeddings;

  File? get stackedIdEmbeddings => _stackedIdEmbeddings;

  set stackedIdEmbeddings(File? value) {
    _stackedIdEmbeddings = value;
    notifyListeners();
  }

  File? _inputIdImages;

  File? get inputIdImages => _inputIdImages;

  set inputIdImages(File? value) {
    _inputIdImages = value;
    notifyListeners();
  }

  File? _loraModel;

  File? get loraModel => _loraModel;

  set loraModel(File? value) {
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
    File? model,
    File? clipL,
    File? clipG,
    File? t5xxl,
    File? diffusionModel,
    File? vae,
    File? taesd,
    File? controlnet,
    File? embeddings,
    File? stackedIdEmbeddings,
    File? inputIdImages,
    File? loraModel,
    bool vaeDecodeOnly = false,
    bool vaeTiling = false,
    bool freeParamsImmediately = false,
    int nThreads = -1,
    StableDiffusionType wType = StableDiffusionType.count,
    ScheduleType sType = ScheduleType.defaultSchedule,
    bool keepClipOnCpu = false,
    bool keepControlNetCpu = false,
    bool keepVaeOnCpu = false,
    bool diffusionFlashAttn = false
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
    assert((_model != null && _model!.existsSync()) || (_diffusionModel != null && _diffusionModel!.existsSync()), StableDiffusionException('Model and diffusion model file does not exist'));
  }

  ffi.Pointer<sd_ctx_t> toNative() => lib.new_sd_ctx(
    _model?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
    _clipL?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
    _clipG?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
    _t5xxl?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
    _diffusionModel?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr,
    _vae?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr,
    _taesd?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
    _controlnet?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
    _loraModel?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
    _embeddings?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
    _stackedIdEmbeddings?.path.toNativeUtf8().cast<ffi.Char>() ?? emptyStringPtr, 
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