import 'package:flutter/material.dart';
import 'package:lifeline/widgets/custom_app_bar.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      
    );
  }
}