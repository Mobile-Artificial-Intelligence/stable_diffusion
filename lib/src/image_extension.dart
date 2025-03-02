part of 'package:sdcpp/sdcpp.dart';

extension ImageExtension on Image {
  Future<({
    ffi.Pointer<sd_image_t> r,
    ffi.Pointer<sd_image_t> g,
    ffi.Pointer<sd_image_t> b,
    ffi.Pointer<sd_image_t> a,
  })> toNative() async {
    final byteData = await toByteData(format: ImageByteFormat.rawRgba);

    assert(byteData != null, StableDiffusionException('Failed to convert image to byte data'));

    final data = byteData!.buffer.asUint8List();

    Uint8List rData = Uint8List(data.length ~/ 4);
    Uint8List gData = Uint8List(data.length ~/ 4);
    Uint8List bData = Uint8List(data.length ~/ 4);
    Uint8List aData = Uint8List(data.length ~/ 4);

    for (var i = 0; i < data.length; i += 4) {
      rData[i ~/ 4] = data[i];
      gData[i ~/ 4] = data[i + 1];
      bData[i ~/ 4] = data[i + 2];
      aData[i ~/ 4] = data[i + 3];
    }

    final r = calloc<sd_image_t>();
    final g = calloc<sd_image_t>();
    final b = calloc<sd_image_t>();
    final a = calloc<sd_image_t>();

    r.ref.width = width;
    r.ref.height = height;
    r.ref.channel = 0;

    r.ref.data = malloc.allocate<ffi.Uint8>(rData.length);
    
    for (var i = 0; i < rData.length; i++) {
      r.ref.data[i] = rData[i];
    }

    g.ref.width = width;
    g.ref.height = height;
    g.ref.channel = 1;

    g.ref.data = malloc.allocate<ffi.Uint8>(gData.length);

    for (var i = 0; i < gData.length; i++) {
      g.ref.data[i] = gData[i];
    }

    b.ref.width = width;
    b.ref.height = height;
    b.ref.channel = 2;

    b.ref.data = malloc.allocate<ffi.Uint8>(bData.length);

    for (var i = 0; i < bData.length; i++) {
      b.ref.data[i] = bData[i];
    }

    a.ref.width = width;
    a.ref.height = height;
    a.ref.channel = 3;

    a.ref.data = malloc.allocate<ffi.Uint8>(aData.length);

    for (var i = 0; i < aData.length; i++) {
      a.ref.data[i] = aData[i];
    }

    return (
      r: r,
      g: g,
      b: b,
      a: a,
    );
  }
}