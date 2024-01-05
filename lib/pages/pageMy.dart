import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PageMy extends StatefulWidget {
  const PageMy({super.key});

  @override
  State<PageMy> createState() => _PageMyState();
}

class _PageMyState extends State<PageMy> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    print('渲染我的');
    return Scaffold(
      appBar: AppBar(title: Text('我的')),
      body: Center(
        child: Text('我的'),
      ),
    );
  }
}