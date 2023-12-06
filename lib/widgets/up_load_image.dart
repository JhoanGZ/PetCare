import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:image_cropper/image_cropper.dart'; // Standby
import 'package:image_picker/image_picker.dart';
import 'package:petcare_app/design/themes.dart';
import 'option_photo_select.dart';

// ignore: must_be_immutable
class SetPhotoScreen extends StatefulWidget {
  final Function(File?) onPhotoSelected;
  const SetPhotoScreen({super.key, required this.onPhotoSelected});

  static const id = 'set_photo_screen';

  @override
  State<SetPhotoScreen> createState() => _SetPhotoScreenState();
}

class _SetPhotoScreenState extends State<SetPhotoScreen> {
  File? _image;

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      // img = await _cropImage(imageFile: img);
      widget.onPhotoSelected(img);
      setState(() {
        _image = img;
        Navigator.of(context).pop(img);
        widget.onPhotoSelected(_image);
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  }

  //BUG: Problemas con el android manifest, tocaría revisar a fondo en la libreria.
  // Future<File?> _cropImage({required File imageFile}) async {
  //   CroppedFile? croppedImage =
  //       await ImageCropper().cropImage(sourcePath: imageFile.path);
  //   if (croppedImage == null) return null;
  //   return File(croppedImage.path);
  // }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding:
          const EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          // height: 30,
                          ),
                      Text(
                        'Elija una foto',
                        style: PetCareThemes.textStylePopUp,
                      ),
                      Text(
                        'Su foto es importante para un perfil completo de adopción',
                        style: PetCareThemes.statementItalicTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(80.0),
                child: Center(
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      _showSelectPhotoOptions(context);
                    },
                    child: Center(
                      child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: Center(
                            child: _image == null
                                ? const Text(
                                    'Imagen no seleccionada',
                                    style: PetCareThemes.blackRegularTextStyle,
                                    textAlign: TextAlign.center,
                                  )
                                : CircleAvatar(
                                    backgroundImage: FileImage(_image!),
                                    radius: 200.0,
                                  ),
                          )),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () => _showSelectPhotoOptions(context),
                    style: PetCareButtonStyles.elevatedButtonStyle,
                    child: const Text('Agregar una foto'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
