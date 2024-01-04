import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/pageDetail.dart';

class PageIndex extends StatefulWidget {
  const PageIndex({super.key});

  @override
  State<PageIndex> createState() => _PageIndexState();
}

class _PageIndexState extends State<PageIndex> with TickerProviderStateMixin {

  List<String> tabTitles = ['今日最佳', '前端', '后端', 'iOS', 'Android', '大数据', '颈椎病预防指南', '程序人生'];

  List<Widget> getAllTabs() {
    List<Widget> list = [];
    for(int i=0; i<tabTitles.length; i++) {
      list.add(Tab(text: tabTitles[i]));
    }
    return list;
  }

  List<Widget> getAllTabBarViewList() {
    List<Widget> tabBarViewList = [];
    for(int i=0; i<tabTitles.length; i++) {
      tabBarViewList.add(Center(
        child: Text(tabTitles[i]),
      ));
    }
    return tabBarViewList;
  }

  getList() {
    List<Widget> dataList = [];
    for (int i = 0; i < 100; i++) {
      dataList.add(Container(
        height: 100,
        color: Colors.red[400],
        child: Text('item $i'),
      ));
    }
    return dataList;
  }

  /// 通过层层嵌套渲染通讯录
  Widget getSingleCell() {
    return Container(
      height: 80,
      child: Padding (
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: (
          Container(child: 
            Row(
              children: [
                Container(width: 70, height: 70, color: Colors.grey),
                const Expanded(
                  child: Padding( 
                    padding: EdgeInsets.only(left: 20),
                    child :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('姓名'),
                        Text('电话号码'),
                      ]
                    )
                  ),
                ),
                Icon(Icons.arrow_right)
              ]
            ),
          )
        ),
      )
    );
  }

  /// 通过 ListTile 渲染通讯录
  getSingleCell2(int idx) {
    var person = listData[idx];
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageDetail(person: person)));
      },
      leading: ClipOval(
        child: Image.network(person['picture']['large'], width: 50, height: 50,),
      ),
      title: Text(person['name']['first'] + ' ' + person['name']['last']),
      subtitle: Text(person["phone"]),
      trailing: Icon(Icons.favorite, color: Colors.red,),
    );
  }

  List listData = [];

  /// 通过原生方法获取数据
  requestData1() async {
    var url = 'https://randomuser.me/api/?results=20';
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var responseBody = await response.transform(utf8.decoder).join();
    var data = jsonDecode(responseBody);
    print(data);
    setState(() {
      listData = data['results'];
    });
  }

  /// 通过 Dio 第三方库获取数据
  requestData2() async {
    var url = 'https://randomuser.me/api/?results=20';
    var dio = Dio();
    var response = await dio.get(url);
    print(response);
    setState(() {
      listData = response.data['results'];
      listData.sort((a, b) => a['name']['first'].compareTo(b['name']['first']));
    });
  }

  @override
  void initState() {
    requestData2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('首页'),
          bottom: TabBar(
            isScrollable: true,
            tabs: getAllTabs(),
            indicatorSize: TabBarIndicatorSize.tab,
          ),
        ),
        drawer: Container(
          width: 300,
          color: Colors.yellow,
          child: const Center(
            child: Text('drawer'),
          ),
        ),
        body: TabBarView(
          children: getAllTabBarViewList(),
        ),
        // body: SizedBox(
        //   height: double.infinity,
        //   width: double.infinity,
          
        //   child: ListView.separated(
        //     itemBuilder: (BuildContext context, int idx){
        //       return getSingleCell2(idx);
        //     }, 
        //     separatorBuilder: (BuildContext context, int index) {
        //       return Container(
        //         height: 1,
        //         color: Colors.grey,
        //       );
        //     },
        //     itemCount: listData.length,
        //   ), 
        // ),
      )
    );
  }
}