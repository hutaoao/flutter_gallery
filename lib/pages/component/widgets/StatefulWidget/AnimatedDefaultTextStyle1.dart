import 'package:flutter/material.dart';

class HtAnimatedDefaultTextStyle1 extends StatefulWidget {
  const HtAnimatedDefaultTextStyle1({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedDefaultTextStyle1State();
}

class _HtAnimatedDefaultTextStyle1State extends State<HtAnimatedDefaultTextStyle1> {
  late TextStyle _style;

  final TextStyle start = const TextStyle(
    fontSize: 50,
    color: Colors.red
  );

  final TextStyle end = const TextStyle(
      fontSize: 20,
      color: Colors.blue
  );

  void onChanged(bool value) {
    setState(() {
      _style = value ? end : start;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _style = start;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _style == end,
          onChanged: onChanged
        ),
        Container(
          width: 400,
          height: 160,
          color: Colors.grey.withAlpha(22),
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 500),
            style: _style,
            child: const Text('Flutter'),
          ),
        )
      ],
    );
  }
}
