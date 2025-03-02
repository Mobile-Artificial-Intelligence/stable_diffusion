part of 'package:sdcpp/sdcpp.dart';

class StableDiffusion {
  static stable_diffusion? _lib;

  static stable_diffusion get lib {
    if (_lib == null) {
      if (Platform.isWindows) {
        // _lib = stable_diffusion(ffi.DynamicLibrary.open('llama.dll'));
        throw StableDiffusionException('Not Yet Supported');
      } else if (Platform.isLinux || Platform.isAndroid) {
        //_lib = stable_diffusion(ffi.DynamicLibrary.open('libllama.so'));
        throw StableDiffusionException('Not Yet Supported');
      } else if (Platform.isMacOS || Platform.isIOS) {
        _lib = stable_diffusion(ffi.DynamicLibrary.open('sdcpp.framework/sdcpp'));
      } else {
        throw StableDiffusionException('Unsupported platform');
      }
    }
    return _lib!;
  }
}