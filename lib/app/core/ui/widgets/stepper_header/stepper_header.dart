import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';

class StepperHeader extends StatelessWidget {
  final int currentStep;
  final List<String> stepTitles;
  const StepperHeader({super.key, required this.currentStep, required this.stepTitles});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(stepTitles.length, (index) {
        final isActive = index <= currentStep;
        return Column(
          spacing: 5,
          children: [
            CircleAvatar(
              backgroundColor: isActive ? AppTheme.darkTextColor : Colors.grey.shade500,
              radius: 12,
              child: Text('${index + 1}', style: const TextStyle(fontSize: 12, color: Colors.white)),
            ),
            Text(
              stepTitles[index],
              style: TextStyle(
                fontWeight: .w600,
                color: isActive ? AppTheme.darkTextColor : Colors.grey.shade500,
                fontSize: 12,
              ),
            ),
          ],
        );
      }),
    );
  }
}
