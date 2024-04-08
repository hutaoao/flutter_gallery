import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  final String title;
  final String content;
  final Function()? onClose;
  const MyDialog({super.key, required this.title, required this.content, required this.onClose});

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Material(
      // 设置背景透明
      type: MaterialType.transparency,
      child: Center( // 注意包裹一个组件，不然会全屏
        child: Container(
          width: 200,
          height: 200,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(6),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(title, style: const TextStyle(fontSize: 18)),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: onClose,
                        child: const Icon(Icons.close),
                      ),
                    )
                  ],
                )
              ),
              const Divider(height: 5,),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                child: Text(content),
              )
            ],
          ),
        ),
      ),
    );
  }
}
