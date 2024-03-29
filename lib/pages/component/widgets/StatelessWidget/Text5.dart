import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HtText5 extends StatelessWidget {
  const HtText5({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: TextDirection.values.map((TextDirection direction) => Container(
        width: 0.4.sw,
        height: 80,
        color: Colors.black12,
        child: Text(
          '$direction - ' * 10,
          textDirection: direction,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      )).toList(),
    );
  }
}
