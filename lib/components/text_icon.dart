import 'package:flutter/material.dart';
import 'package:fore_cast/utilities/constants.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon(
      {super.key,
      required this.value,
      required this.icon,
      required this.label});

  final dynamic value;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  size: 30,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  value.toString(),
                  style: kGradientButtonStyle,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              label,
              style: kGradientButtonStyle,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
