import 'package:flutter/material.dart';

class CustomLinearProgressBar extends StatelessWidget {
  final double value; // Current progress value (0.0 to 1.0)
  final String iconData; // Icon to use as a handle.
  final double height; // Height of the progress bar.

  const CustomLinearProgressBar({
    super.key,
    required this.value,
    required this.iconData,
    this.height = 10,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Determine handle's position based on progress
        final double progressPosition = value * constraints.maxWidth;

        return SizedBox(
          height: height * 5, // Increase height to accommodate the larger icon
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              // Flutter's built-in LinearProgressIndicator
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(
                  value: value,
                  minHeight: height,
                  backgroundColor: Colors.red.shade100,
                  valueColor: AlwaysStoppedAnimation(Colors.red.shade900),
                ),
              ),
              // Icon handle dynamically positioned and larger, placed over the progress bar
              Positioned(
                left: progressPosition - (height * 2), // Center the larger icon
                top: (height / 2) *
                    2, // Offset to position the icon over the bar
                child: Icon(
                  IconData(int.parse(iconData), fontFamily: 'MaterialIcons'),
                  size: height * 3, // Icon size relative to the bar's height
                  color: Colors.red.shade900,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
