import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/pages/pageDetail.dart';

class PageContact extends StatefulWidget {
  const PageContact({super.key});

  @override
  State<PageContact> createState() => _PageContactState();
}

class _PageContactState extends State<PageContact> with AutomaticKeepAliveClientMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  List listData = [];

  /// 获取数据
  getListData() async {
    String url = 'https://randomuser.me/api/?results=20';
    var dio = Dio();
    var response = await dio.get(url);
    print(response);
    setState(() {
      listData = response.data['results'];
      listData.sort((a, b) => a['name']['first'].compareTo(b['name']['first']));
    });
  }

  /// 渲染列表
  getList(index) {
    var item = listData[index];
    return ListTile(
      leading: ClipOval(
        child: Image.network(item['picture']['large'], width: 50, height: 50,),
      ),
      title: Text(item['name']['first'] + ' ' + item['name']['last']),
      subtitle: Text(item['phone']),
      trailing: Icon(Icons.navigate_next),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PageDetail(person: item)));
      },
    );
  }

  @override
  void initState() {
    getListData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('渲染联系人');
    return Scaffold(
      appBar: AppBar(
        title: Text('联系人'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return getList(index);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            height: 1,
            color: Colors.grey,
          );
        },
        itemCount: listData.length,
      )
    );
  }
}
