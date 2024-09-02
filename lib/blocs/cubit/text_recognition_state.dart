
import 'dart:io';

abstract class TextRecognitionState {}

class TextRecognitionInitial extends TextRecognitionState {}

class TextRecognitionLoading extends TextRecognitionState {
  final File imageFile;

  TextRecognitionLoading(this.imageFile);
}

class TextRecognitionSuccess extends TextRecognitionState {
  final File imageFile;
  final String extractedText;

  TextRecognitionSuccess(this.extractedText ,this.imageFile);
}

class TextRecognitionError extends TextRecognitionState {
  final String message;

  TextRecognitionError(this.message);
}
