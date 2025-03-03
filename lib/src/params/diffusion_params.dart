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
    double styleRatio;
    File inputIdImages;
    List<int> skipLayers;
    double slgScale;
    double skipLayerStart;
    double skipLayerEnd;

    DiffusionParams({
        required this.clipSkip,
        required this.cfgScale,
        required this.guidance,
        required this.eta,
        required this.width,
        required this.height,
        required this.sampleMethod,
        required this.samplingSteps,
        required this.seed,
        required this.nBatch,
        required this.controlStrength,
        required this.styleRatio,
        required this.inputIdImages,
        required this.skipLayers,
        required this.slgScale,
        required this.skipLayerStart,
        required this.skipLayerEnd
    });
}