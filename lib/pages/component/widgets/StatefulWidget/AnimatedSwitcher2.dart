import 'package:flutter/material.dart';

class HtAnimatedSwitcher2 extends StatefulWidget {
  const HtAnimatedSwitcher2({super.key});

  @override
  State<StatefulWidget> createState() => _HtAnimatedSwitcher2State();
}

class _HtAnimatedSwitcher2State extends State<HtAnimatedSwitcher2> {
  bool selected = false;

  void onChanged(bool value) {
    setState(() {
      selected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: selected,
          onChanged: onChanged
        ),
        Container(
          width: 400,
          height: 120,
          color: Colors.grey.withAlpha(22),
          child: AnimatedSwitcher(
            transitionBuilder: ((child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            }),
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            child: selected ? const Icon(Icons.home, size: 50) : const Text('data', style: TextStyle(fontSize: 30)),
          ),
        ),
        const Divider(height: 2),
        const Text('文本改变时动画（只需加上Key）', style: TextStyle(fontSize: 20)),
        Container(
          width: 400,
          height: 120,
          color: Colors.grey.withAlpha(22),
          child: AnimatedSwitcher(
            transitionBuilder: ((child, animation) {
              return ScaleTransition(
                scale: animation,
                child: FadeTransition(
                  opacity: animation,
                  child: child,
                ),
              );
            }),
            duration: const Duration(milliseconds: 500),
            switchInCurve: Curves.easeIn,
            child: Text(key: UniqueKey(), selected ? 'hello' : 'flutter', style: TextStyle(fontSize: 30)),
          ),
        )
      ],
    );
  }
}
