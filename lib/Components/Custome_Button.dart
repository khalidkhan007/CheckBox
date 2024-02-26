import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Widget icon; // Use Widget instead of abstract `Icons` class
  final double buttonHeight; // Customize height as needed
  final double buttonWidth; // Customize width as needed
  final bool iconBeforeText; // Indicates whether the icon should be before the text

  const CustomButton({
    Key? key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.icon,
    this.buttonHeight = 50.0, // Default height
    this.buttonWidth = 200.0, // Default width
    this.iconBeforeText = true, // Default is to show icon before text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(22.0),
      ),
      height: buttonHeight,
      width: buttonWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          iconBeforeText ? icon : SizedBox.shrink(), // Show icon before text
          const SizedBox(width: 10.0), // Add spacing between icon and text
          Text(
            text,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 22.0,
              color: textColor,
            ),
          ),
          const SizedBox(width: 10.0), // Add spacing between text and icon
          !iconBeforeText ? icon : SizedBox.shrink(), // Show icon after text
        ],
      ),
    );
  }
}
