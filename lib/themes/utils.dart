import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

pickImage(ImageSource source) async {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: source);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  print('No Image Selected');
}

class MaskModel {
  final TextEditingController textController = TextEditingController();
  final MaskTextInputFormatter formatter;
  final FormFieldValidator<String>? validator;

  MaskModel({
    required this.formatter,
    this.validator,
  });
}

class Mask {
  final MaskModel phoneNumber = MaskModel(
    formatter: MaskTextInputFormatter(
      mask: "(##) #####-####",
      type: MaskAutoCompletionType.eager,
    ),
  );
}
