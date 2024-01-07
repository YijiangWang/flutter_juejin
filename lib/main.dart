import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/pageContact.dart';
import 'package:flutter_learn/pages/pageIndex.dart';
import 'package:flutter_learn/pages/pageMy.dart';
import 'package:flutter_learn/pages/pageSearch.dart';
// import 'package:flutter_learn/pages/pageDetail.dart';

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
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      // 如果是客户端，可是像如下方式使用
      home: const MyHomePage(title: 'Home Page'),

      // 如果是网页端，像如下方式使用路由
      // routes: {
      //   '/': (_) => MyHomePage(title: ''),
      //   '/detail': (_) => PageDetail(person: '',),
      // },
      // 后续的跳转也可以修改为： 
      // Navigator.pushNamed(context, '/detail');
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

  PageController _pageController = PageController(initialPage: 0);

  late List<Widget> pages = [
    new PageIndex(),
    new PageSearch(),
    new PageContact(),
    new PageMy(),
  ];

  @override
  void initState() {
    super.initState();
  }

  getBodyPage() {
    return pages[currentIdx];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 方法一：IndexedStack：一旦构建过，下次再显示时不再构建，但是刚开始会构建完所有页面
      /// 方法二：使用PageView和每个页面的 AutomaticKeepAliveClientMixin
      body: PageView(
        children: pages,
        controller: _pageController,
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIdx,
        type: BottomNavigationBarType.fixed,
        onTap: (int idx) {
          setState((){
            currentIdx = idx;
            // 这里可以写跳转逻辑
            _pageController.jumpToPage(currentIdx);
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: '首页'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: '发现'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: '联系人'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: '我的')
        ], 
      ),
    );
  }
}
