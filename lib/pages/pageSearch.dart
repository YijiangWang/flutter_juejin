import 'package:flutter/material.dart';

class PageSearch extends StatefulWidget {
  const PageSearch({super.key});

  @override
  State<PageSearch> createState() => _PageSearchState();
}

class _PageSearchState extends State<PageSearch> {
  @override
  Widget build(BuildContext context) {
    print('渲染搜索');
    return Scaffold(
      appBar: AppBar(title: Text('发现')),
      body: Center(
        child: Text('发现'),
      ),
    );
  }
}