part of 'package:sdcpp/sdcpp.dart';

class StableDiffusionParams {
  final StableDiffusionType type;
  final StableDiffusionMode mode;
  final File model;
  final File clipL;
  final File clipG;
  final File t5xxl;
  final File diffusionModel;
  final File vae;
  final File taesd;
  final File esrgan;
  final File controlnet;
  final File embeddings;
  final File stackedIdEmbeddings;
  final File inputIdImages;
  final File loraModel;


  const StableDiffusionParams({
    required this.type,
    required this.mode,
    required this.model,
    required this.clipL,
    required this.clipG,
    required this.t5xxl,
    required this.diffusionModel,
    required this.vae,
    required this.taesd,
    required this.esrgan,
    required this.controlnet,
    required this.embeddings,
    required this.stackedIdEmbeddings,
    required this.inputIdImages,
    required this.loraModel,
  });
}