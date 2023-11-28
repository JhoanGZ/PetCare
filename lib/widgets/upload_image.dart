import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  late File _image;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 50, // Se 
    );

    setState(() {
      if(pickedFile != null){
        _image = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _getImage,
          child: SizedBox(
            width: 200.0,
            height: 100.0,
            child: ClipOval(
              child: _image != null
                  ? Image.file(
                      _image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      'assets/images/pic_default_user.png',
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        const SizedBox(height: 10.0),
        const Text('Presiona para seleccionar una imagen'),
      ],
    );
  }
}
