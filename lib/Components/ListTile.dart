import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CustomCheckbox extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;

  const CustomCheckbox({
    required this.value,
    required this.onChanged,
    required this.activeColor,
  });

  @override
  _CustomCheckboxState createState() => _CustomCheckboxState();
}

class _CustomCheckboxState extends State<CustomCheckbox> {
  Color borderColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged!(!widget.value);
        setState(() {
          borderColor = widget.value ? Colors.blue : Colors.grey;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          //shape: BoxShape.circle,
          //border: Border.all(color: borderColor),
        ),
        child: widget.value
            ? 


        Icon(Icons.check_circle,color:widget.activeColor,size: 24.0, )
            :Icon(Icons.circle_outlined),
      ),
    );
  }
}