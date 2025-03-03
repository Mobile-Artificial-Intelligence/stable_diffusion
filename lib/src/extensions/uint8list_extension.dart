part of 'package:sdcpp/sdcpp.dart';

extension Uint8ListExtension on Uint8List {
  ffi.Pointer<ffi.Int> toUint8Pointer() {
    final ptr = malloc.allocate<ffi.Int>(length);

    for (var i = 0; i < length; i++) {
      ptr[i] = this[i];
    }

    return ptr;
  }
}