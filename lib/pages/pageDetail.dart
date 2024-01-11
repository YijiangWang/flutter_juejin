import 'package:flutter/material.dart';

class PageDetail extends StatefulWidget {
  final person;
  const PageDetail({
    super.key,
    required this.person,
  });

  @override
  State<PageDetail> createState() => _PageDetailState();
}

class _PageDetailState extends State<PageDetail> {
  @override
  Widget build(BuildContext context) {
    var person = widget.person;
    return Scaffold(
      appBar: AppBar(
        title: Text(person['name']['first'] + ' ' + person['name']['last']), 
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        
      )
    );
  }
}