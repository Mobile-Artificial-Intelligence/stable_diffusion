part of 'package:sdcpp/sdcpp.dart';

class DiffusionParams extends ChangeNotifier{
    int clipSkip;
    double cfgScale;
    double guidance;
    double eta;
    int width;
    int height;
    SampleMethod sampleMethod;
    int samplingSteps;
    int seed;
    int nBatch;
    double controlStrength;
    double styleStrength;
    bool normalizeInput;
    double styleRatio;
    Uint8List skipLayers;
    double slgScale;
    double skipLayerStart;
    double skipLayerEnd;

    DiffusionParams({
      this.clipSkip = -1,
      this.cfgScale = 7.0,
      this.guidance = 3.5,
      this.eta = 0.0,
      this.width = 512,
      this.height = 512,
      this.sampleMethod = SampleMethod.eulerA,
      this.samplingSteps = 20,
      int? seed,
      this.nBatch = 1,
      this.controlStrength = 0.9,
      this.styleStrength = 0.0,
      this.normalizeInput = false,
      this.styleRatio = 20.0,
      Uint8List? skipLayers,
      this.slgScale = 0.0,
      this.skipLayerStart = 0.01,
      this.skipLayerEnd = 0.2
    }) : seed = seed ?? math.Random().nextInt(1000000), 
         skipLayers = skipLayers ?? Uint8List.fromList([7, 8, 9]);
}