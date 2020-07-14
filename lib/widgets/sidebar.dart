import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {

  final bool isSideBarOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Positioned(
      top: 0,
      bottom: 0,
      left: isSideBarOpen ? 0 : 0,
      right: isSideBarOpen ? 0: screenWidth,

      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color:Color.fromRGBO(35, 90, 144, 1),
            ),
          ),
        ],
      ),
    );
  }
}