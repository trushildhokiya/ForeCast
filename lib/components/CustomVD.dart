import 'package:flutter/material.dart';

class CustomVD extends StatelessWidget {
  const CustomVD({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return VerticalDivider(
      color: Color(0x30FFFFFF),
      indent: 105,
      endIndent: 105,
      thickness: 4,
    );
  }
}
