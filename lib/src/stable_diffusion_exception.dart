part of 'package:sdcpp/sdcpp.dart';

class StableDiffusionException implements Exception {
  final String message;

  StableDiffusionException(this.message);

  @override
  String toString() => message;
}