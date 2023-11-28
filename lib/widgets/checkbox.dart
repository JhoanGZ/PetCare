import 'package:flutter/material.dart';
import 'package:petcare_app/design/themes.dart';

class PetCareCheckBox extends StatefulWidget {
  final bool initialValue;
  final ValueChanged<bool>? onChanged;
  final String labelText;

  const PetCareCheckBox({
    super.key,
    this.initialValue = false,
    this.onChanged,
    required this.labelText,
  });

  @override
  PetCareCheckBoxState createState() => PetCareCheckBoxState();
}

class PetCareCheckBoxState extends State<PetCareCheckBox> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            if (value != null) {
              setState(() {
                _isChecked = value;
              });
              widget.onChanged?.call(value);
            }
          },
        ),
        Text(
          widget.labelText,
          style: PetCareThemes.statementTextStyle,// Estilos del texto
        ),
      ],
    );
  }
}

