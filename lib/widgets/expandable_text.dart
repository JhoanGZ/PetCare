import 'package:flutter/material.dart';
import 'package:petcare_app/design/colors.dart';

class ExpandText extends StatefulWidget {
  final String text;
  final int maxLines;

  const ExpandText({super.key, required this.text, required this.maxLines});

  @override
  ExpandTextState createState() => ExpandTextState();
}

class ExpandTextState extends State<ExpandText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded ? widget.text : '${widget.text.substring(0, widget.maxLines)}...',
          maxLines: isExpanded ? null : widget.maxLines,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? 'Ver menos' : 'Ver más',
            style: const TextStyle(
              color: PetCareColors.brandDisabledColor, // Cambia el color a tu preferencia
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
