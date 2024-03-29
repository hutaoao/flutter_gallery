import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HtText6 extends StatelessWidget {
  const HtText6({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      children: TextOverflow.values.map((TextOverflow textOverflow) => Container(
        width: 0.8.sw,
        height: 80,
        color: Colors.black12,
        child: Text(
          '$textOverflow - ' * 10,
          overflow: textOverflow,
          softWrap: false,
        ),
      )).toList(),
    );
  }
}
