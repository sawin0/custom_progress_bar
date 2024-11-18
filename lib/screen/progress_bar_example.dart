import 'package:flutter/material.dart';

import '../widgets/custom_linear_progress_bar.dart';

class ProgressBarExample extends StatefulWidget {
  const ProgressBarExample({super.key});

  @override
  ProgressBarExampleState createState() => ProgressBarExampleState();
}

class ProgressBarExampleState extends State<ProgressBarExample> {
  double progress = 0.5; // Initial progress value (50%)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Custom Linear Progress Bar")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Custom progress bar
              CustomLinearProgressBar(
                value: progress,
                height: 12,
                iconData:
                    Icons.favorite.codePoint.toString(), // Using a circle icon
              ),
              const SizedBox(height: 20),
              // Slider to control progress
              Slider(
                value: progress,
                min: 0,
                max: 1,
                onChanged: (value) {
                  setState(() {
                    progress = value; // Update progress value.
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
