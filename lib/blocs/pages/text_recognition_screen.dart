import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/text_recognition_cubit.dart';
import '../cubit/text_recognition_state.dart';

class TextRecognitionScreen extends StatelessWidget {
  const TextRecognitionScreen({super.key});

  void _showAlertDialog(BuildContext context, String extractedText) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(extractedText),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextRecognitionCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: Text(
            "Text Recognition",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<TextRecognitionCubit, TextRecognitionState>(
          listener: (context, state) {
            if (state is TextRecognitionSuccess) {
              Image.file(state.imageFile);
              _showAlertDialog(context, state.extractedText);
            } else if (state is TextRecognitionError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (state is TextRecognitionInitial) ...[
                      Text("Select an image to analyze."),
                    ] else if (state is TextRecognitionLoading) ...[
                      Image.file(state.imageFile),
                    ] else if (state is TextRecognitionSuccess) ...[
                      Image.file(state.imageFile),
                    ] else if (state is TextRecognitionError) ...[
                      Text("Error occurred: ${state.message}"),
                    ],
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        context.read<TextRecognitionCubit>().pickImage();
                      },
                      child: Text("Pick Image"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
