import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 语雀
class YuQueWidget extends StatefulWidget {
  const YuQueWidget({super.key});

  @override
  State<StatefulWidget> createState() => _YuQueWidgetState();
}

class _YuQueWidgetState extends State<YuQueWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('data'),
      ),
      body: Center(
        child: Text('demo', style: TextStyle(fontSize: 30.sp)),
      ),
    );
  }
}
