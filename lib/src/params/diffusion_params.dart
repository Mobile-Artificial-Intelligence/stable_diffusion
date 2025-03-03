part of 'package:sdcpp/sdcpp.dart';

class DiffusionParams extends ChangeNotifier{
    int _clipSkip;

    int get clipSkip => _clipSkip;

    set clipSkip(int value){
        _clipSkip = value;
        notifyListeners();
    }

    double _cfgScale;

    double get cfgScale => _cfgScale;

    set cfgScale(double value){
        _cfgScale = value;
        notifyListeners();
    }

    double _guidance;

    double get guidance => _guidance;

    set guidance(double value){
        _guidance = value;
        notifyListeners();
    }

    double _eta;

    double get eta => _eta;

    set eta(double value){
        _eta = value;
        notifyListeners();
    }

    int _width;

    int get width => _width;

    set width(int value){
        _width = value;
        notifyListeners();
    }

    int _height;

    int get height => _height;

    set height(int value){
        _height = value;
        notifyListeners();
    }

    SampleMethod _sampleMethod;

    SampleMethod get sampleMethod => _sampleMethod;

    set sampleMethod(SampleMethod value){
        _sampleMethod = value;
        notifyListeners();
    }

    int _samplingSteps;

    int get samplingSteps => _samplingSteps;

    set samplingSteps(int value){
        _samplingSteps = value;
        notifyListeners();
    }

    int _seed;

    int get seed => _seed;

    set seed(int value){
        _seed = value;
        notifyListeners();
    }

    int _nBatch;

    int get nBatch => _nBatch;

    set nBatch(int value){
        _nBatch = value;
        notifyListeners();
    }

    double _controlStrength;

    double get controlStrength => _controlStrength;

    set controlStrength(double value){
        _controlStrength = value;
        notifyListeners();
    }

    double _styleRatio;

    double get styleRatio => _styleRatio;

    set styleRatio(double value){
        _styleRatio = value;
        notifyListeners();
    }

    File _inputIdImages;

    File get inputIdImages => _inputIdImages;

    set inputIdImages(File value){
        _inputIdImages = value;
        notifyListeners();
    }

    List<int> _skipLayers;

    List<int> get skipLayers => _skipLayers;

    set skipLayers(List<int> value){
        _skipLayers = value;
        notifyListeners();
    }

    double _slgScale;

    double get slgScale => _slgScale;

    set slgScale(double value){
        _slgScale = value;
        notifyListeners();
    }

    double _skipLayerStart;

    double get skipLayerStart => _skipLayerStart;

    set skipLayerStart(double value){
        _skipLayerStart = value;
        notifyListeners();
    }

    double _skipLayerEnd;

    double get skipLayerEnd => _skipLayerEnd;

    set skipLayerEnd(double value) {
        _skipLayerEnd = value;
        notifyListeners();
    }

    DiffusionParams({
        int clipSkip = -1,
        double cfgScale = 7.0,
        double guidance = 3.5,
        double eta = 0.0,
        int width = 512,
        int height = 512,
        SampleMethod sampleMethod = SampleMethod.eulerA,
        int samplingSteps = 20,
        int? seed,
        int nBatch = 1,
        double controlStrength = 0.9,
        double styleRatio = 20.0,
        required File inputIdImages,
        List<int>? skipLayers,
        double slgScale = 0.0,
        double skipLayerStart = 0.01,
        double skipLayerEnd = 0.2
    }) : _clipSkip = clipSkip,
        _cfgScale = cfgScale,
        _guidance = guidance,
        _eta = eta,
        _width = width,
        _height = height,
        _sampleMethod = sampleMethod,
        _samplingSteps = samplingSteps,
        _seed = seed ?? math.Random().nextInt(1000000),
        _nBatch = nBatch,
        _controlStrength = controlStrength,
        _styleRatio = styleRatio,
        _inputIdImages = inputIdImages,
        _skipLayers = skipLayers ?? [7, 8, 9],
        _slgScale = slgScale,
        _skipLayerStart = skipLayerStart,
        _skipLayerEnd = skipLayerEnd {
        assert(inputIdImages.existsSync(), StableDiffusionException('Input ID images file does not exist'));
    }
}