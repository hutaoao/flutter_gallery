import 'package:flutter/material.dart';

class HtAlign1 extends StatelessWidget {
  const HtAlign1({super.key});

  final List<Alignment> alignments = const [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: alignments
          .toList()
          .map((mode) => Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.all(5),
                    color: Colors.black12,
                    child: Align(
                      alignment: mode,
                      child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                  Text(mode.toString().split('.')[1])
                ],
              ))
          .toList(),
    );
  }
}
