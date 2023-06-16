import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebScreen extends StatefulWidget {
  const WebScreen({Key? key, required this.onBackPressed}) : super(key: key);
  final void Function()? onBackPressed;

  @override
  State<WebScreen> createState() => _WebScreenState();
}

class _WebScreenState extends State<WebScreen>
    with AutomaticKeepAliveClientMixin {
  final _controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse('https://asthatrade.com/product/flow'));

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
          leading: BackButton(
        onPressed: widget.onBackPressed,
      )),
      body: WebViewWidget(controller: _controller),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
