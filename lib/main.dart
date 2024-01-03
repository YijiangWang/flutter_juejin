import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/pageIndex.dart';
import 'package:flutter_learn/pages/pageMy.dart';
import 'package:flutter_learn/pages/pageSearch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIdx = 0;
  late List<Widget> pages;

  @override
  void initState() {
    pages = [
      new PageIndex(),
      new PageSearch(),
      new PageMy(),
    ];
    super.initState();
  }

  getBodyPage() {
    return PageView(
      children: pages,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBodyPage(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIdx,
        onTap: (int idx) {
          setState((){
            currentIdx = idx;
            // 这里可以写跳转逻辑
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: '设置')
        ], 
      ),
    );
  }
}
