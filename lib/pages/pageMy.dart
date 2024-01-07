import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageMy extends StatefulWidget {
  const PageMy({super.key});

  @override
  State<PageMy> createState() => _PageMyState();
}

class _PageMyState extends State<PageMy> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  final _jdSifaWebViewController = WebViewController()
    ..loadRequest(Uri.parse('https://mauction.jd.com/sifa.html?page=1&sTop=0'));

  @override
  Widget build(BuildContext context) {
    print('渲染我的');
    return Scaffold(
      appBar: AppBar(title: Text('我的')),
      body: WebViewWidget(controller: _jdSifaWebViewController),
    );
  }
}