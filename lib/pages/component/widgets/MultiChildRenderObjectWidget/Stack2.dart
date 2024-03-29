import 'package:flutter/material.dart';

class HtStack2 extends StatelessWidget {
  const HtStack2({super.key});

  @override
  Widget build(BuildContext context) {
    Widget yellowBox = Container(
      color: Colors.yellow,
      width: 100,
      height: 100,
    );

    Widget redBox = Container(
      color: Colors.red,
      width: 90,
      height: 90,
    );

    Widget greenBox = Container(
      color: Colors.green,
      width: 80,
      height: 80,
    );

    Widget cyanBox = Container(
      color: Colors.cyan,
      width: 70,
      height: 70,
    );

    return Container(
      width: 200,
      height: 150,
      color: Colors.black12,
      child: Stack(
        fit: StackFit.loose,
        alignment: Alignment.topRight,
        children: [yellowBox, redBox, greenBox,
          Positioned(
            left: 10,
            bottom: 10,
            child: cyanBox,
          )
        ],
      ),
    );
  }
}
