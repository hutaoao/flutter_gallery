import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HtText4 extends StatelessWidget {
  const HtText4({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: TextAlign.values.map((TextAlign textAlign) => Container(
        width: 0.8.sw,
        height: 80,
        color: Colors.black12,
        child: Text(
          '$textAlign' * 2,
          textAlign: textAlign,
        ),
      )).toList(),
    );
  }
}
