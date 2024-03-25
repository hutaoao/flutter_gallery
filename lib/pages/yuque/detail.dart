import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class YuQueDetailWidget extends StatefulWidget {
  final String? slug;

  const YuQueDetailWidget({super.key, required this.slug});

  @override
  State<StatefulWidget> createState() => _YuQueDetailWidgetState();
}

class _YuQueDetailWidgetState extends State<YuQueDetailWidget> {
  bool completed = false;
  WebViewController controller = WebViewController();

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    initWebview();
    print(widget.slug);
  }

  initWebview() {
    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          /// 加载进度
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            setState(() {
              completed = true;
            });
          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            print('onNavigationRequest$request');
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse('https://www.yuque.com/hutaoao/blog/${widget.slug}?view=doc_embed&from=blog&title=1&outline=1'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('文章详情'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: completed ? WebViewWidget(controller: controller) : const Text('加载中'),
      ),
    );
  }
}
