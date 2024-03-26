import 'package:flutter/material.dart';
import 'package:flutter_gallery/models/component_model.dart';
import 'widgets/widgets.dart';

class ComponentDetail extends StatefulWidget {
  final ComponentModel extraData;

  const ComponentDetail({super.key, required this.extraData});

  @override
  State<StatefulWidget> createState() => _ComponentDetailState();
}

class _ComponentDetailState extends State<ComponentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.extraData.widgetName),
      ),
      body: WidgetsMap.map(widget.extraData.widgetName),
    );
  }
}
