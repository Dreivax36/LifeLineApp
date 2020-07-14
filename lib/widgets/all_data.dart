 import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:lifeline/config/styles.dart';
import 'package:lifeline/widgets/global_data.dart';
import 'package:lifeline/widgets/ph_data.dart';


class AllData extends StatefulWidget {
  @override
  _AllDataState createState() => _AllDataState();
}

class _AllDataState extends State<AllData> with TickerProviderStateMixin {
  double screenSize;
  double screenRatio;
  AppBar appBar;
  List<Tab> tabList = List();
  TabController _tabController;

  @override
  void initState() {
    tabList.add(new Tab(
      text: 'My Country',
    ));
    tabList.add(new Tab(
     text: 'Worldwide',
    ));
    _tabController = new TabController(vsync: this, length: tabList.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size.width;
    appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
    return Container(
      //color: Colors.white,
      child: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: Stack(
              children: <Widget>[
                new Positioned(
                  width: screenSize * .91,
                  top: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: new Column(
                      children: <Widget>[
                        Container (
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            height: 50.0,
                            width: screenSize * 1.5,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(53, 79, 121, 1),
                                borderRadius: BorderRadius.circular(25.0)
                            ),
                          child: new TabBar(
                              controller: _tabController,
                              indicator: BubbleTabIndicator(
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                                indicatorHeight: 40.0,
                                indicatorColor: Colors.white,
                              ),
                              labelStyle: Styles.tabTextStyle,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                              tabs: tabList),
                        ),
                        new Container(
                          height: 800.0,
                          child: new TabBarView(
                            controller: _tabController,
                            children: <Widget>[
                              PHData(),
                              GlobalData(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

// ignore: missing_return
  
}