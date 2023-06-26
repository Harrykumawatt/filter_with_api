import 'package:flutter/material.dart';

class FilteScreen extends StatefulWidget {
  final String text;
  final String id;
  const FilteScreen({
    Key? key,
    required this.text,
    required this.id,
  }) : super(key: key);

  @override
  State<FilteScreen> createState() => _FilteScreenState();
}

class _FilteScreenState extends State<FilteScreen> {
  List fullData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [Text(widget.id)],
        ));
  }
}
