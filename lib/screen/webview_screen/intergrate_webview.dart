import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:starting_block/constants/constants.dart';
import 'package:starting_block/screen/manage/screen_manage.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  final String id; // 추가된 id 필드

  const WebViewScreen({
    Key? key,
    required this.url,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WebViewController controller = WebViewController()
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: const SaveAppBar(
        isSaved: false,
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
