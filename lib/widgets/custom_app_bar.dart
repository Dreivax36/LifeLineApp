import 'package:flutter/material.dart';
import 'package:lifeline/widgets/sidenavbar.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'LIFELINE',
            style: TextStyle(
              fontFamily: 'Constantia',
              fontWeight: FontWeight.bold,
              fontSize: 28,
            ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromRGBO(10, 108, 158, 1),
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 28.0,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SideNavBar()));
          },
        ),
        actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.notifications_none),
              iconSize: 28.0,
              onPressed: () {},
            )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
