part of 'package:sdcpp/sdcpp.dart';

class StableDiffusionNative {
  static final _contextFinalizer =
      Finalizer<ffi.Pointer<sd_ctx_t>>(StableDiffusion.lib.free_sd_ctx);
  
  late ContextParams _contextParams;
  DiffusionParams diffusionParams;

  ffi.Pointer<sd_ctx_t> _context = ffi.nullptr;

  ContextParams get contextParams => _contextParams;

  set contextParams(ContextParams value) {
    if (_context != ffi.nullptr) {
      StableDiffusion.lib.free_sd_ctx(_context);
    }

    _context = value.toNative();
    assert(_context != ffi.nullptr, StableDiffusionException('Failed to create context'));

    _contextFinalizer.attach(this, _context);
  }

  StableDiffusionNative(
    ContextParams contextParams, 
    this.diffusionParams
  ) { 
    contextParams = contextParams;
  }
}