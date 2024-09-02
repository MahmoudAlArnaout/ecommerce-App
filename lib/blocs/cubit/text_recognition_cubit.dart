import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:ecommerce/blocs/cubit/text_recognition_state.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';


class TextRecognitionCubit extends Cubit<TextRecognitionState> {
  TextRecognitionCubit() : super(TextRecognitionInitial());

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final file = File(pickedFile.path);
      emit(TextRecognitionLoading(file));
      await _processImage(file);
    } else {
      emit(TextRecognitionError("No image selected"));
    }
  }

  Future<void> _processImage(File imageFile) async {
    try {
      final inputImage = InputImage.fromFilePath(imageFile.path);
      final textRecognizer = TextRecognizer();
      final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);
      emit(TextRecognitionSuccess(recognizedText.text,imageFile));
    } catch (e) {
      emit(TextRecognitionError("Failed to process image"));
    }
  }
}
