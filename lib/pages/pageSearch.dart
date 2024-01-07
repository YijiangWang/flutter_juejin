import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PageSearch extends StatefulWidget {
  const PageSearch({super.key});

  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> with AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  final _webViewController = WebViewController()
    ..setBackgroundColor(Colors.lightGreen)
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          print('progress:  $progress');
        },
        onPageStarted: (String url) {
          print('start---> $url');
        },
        onPageFinished: (String url) {
          print('end---> $url');
        },
        onWebResourceError: (WebResourceError error) {
          print('WebResourceError:  $error');
        },
        onNavigationRequest: (NavigationRequest request) {
          if(request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        }
      )
    )
    ..loadRequest(Uri.parse('https://market.m.taobao.com/app/pm/new-main/home'));

  @override
  Widget build(BuildContext context) {
    print('渲染搜索');
    return Scaffold(
      appBar: AppBar(title: Text('发现')),
      body: WebViewWidget(
        controller: _webViewController,
      ),
    );
  }
}