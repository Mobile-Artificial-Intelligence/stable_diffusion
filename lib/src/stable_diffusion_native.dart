part of 'package:sdcpp/sdcpp.dart';

class StableDiffusionNative {
  static final _contextFinalizer =
      Finalizer<ffi.Pointer<sd_ctx_t>>(StableDiffusion.lib.free_sd_ctx);

  ffi.Pointer<sd_ctx_t> _context = ffi.nullptr;
}