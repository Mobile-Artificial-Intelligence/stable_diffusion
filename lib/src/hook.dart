import 'dart:ffi' as ffi;

import 'package:flutter/foundation.dart';

import 'bindings.dart';

stable_diffusion? _lib;

stable_diffusion get lib {
  if (_lib == null) {
    if (TargetPlatform.windows == defaultTargetPlatform) {
      _lib = stable_diffusion(ffi.DynamicLibrary.open('stable-diffusion.dll'));
    } else if (TargetPlatform.linux == defaultTargetPlatform || TargetPlatform.android == defaultTargetPlatform) {
      _lib = stable_diffusion(ffi.DynamicLibrary.open('libstable-diffusion.so'));
    } else if (TargetPlatform.iOS == defaultTargetPlatform || TargetPlatform.macOS == defaultTargetPlatform) {
      _lib = stable_diffusion(ffi.DynamicLibrary.open('sdcpp.framework/sdcpp'));
    } else {
      throw Exception('Unsupported platform');
    }
  }
  return _lib!;
}