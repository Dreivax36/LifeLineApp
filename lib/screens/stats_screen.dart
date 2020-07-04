import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeline/app/repositories/data_repository.dart';
import 'package:lifeline/app/repositories/endpoints_data.dart';
import 'package:lifeline/app/services/api.dart';
import 'package:lifeline/config/styles.dart';
import 'package:lifeline/widgets/last_updated.dart';
import 'package:lifeline/widgets/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lifeline/screens/stats_screen.dart';
import 'package:lifeline/data/data.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:provider/provider.dart';


class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen> {
  EndpointsData _endpointsData;

  void initState(){
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointsData();
    setState(() {
      _endpointsData = endpointsData;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      body: RefreshIndicator(
          onRefresh: () => _updateData(),
              child: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: <Widget>[
            _buildHeader(screenHeight, screenWidth),
            _buildPreventionTips(screenHeight, screenWidth),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight, double screenWidth){
    final formatter = DateFormatter(
      lastUpdated: _endpointsData != null
                    ? _endpointsData.values[Endpoint.cases].date
                      : null,
      );
    return SliverToBoxAdapter(
      child: ClipPath(
        clipper: MyClipper1(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 5),
          height: screenHeight * .68,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(5, 96, 144, 1),
                  Color.fromRGBO(81, 159, 199, 1),
                ]
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Text (
                  'STATISTICS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight:  FontWeight.bold,
                  )
              ),
              SizedBox(height: screenHeight * .001,),
              LastUpdated(
                text: formatter.lastUpdatedText(),

              ),
              SizedBox(height: screenHeight * .005,),
              DefaultTabController(
                length: 2,
                child: Container (
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  height: 50.0,
                  width: screenWidth * 1.5,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(53, 79, 121, 1),
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                  child: TabBar(
                    indicator: BubbleTabIndicator(
                      tabBarIndicatorSize: TabBarIndicatorSize.tab,
                      indicatorHeight: 40.0,
                      indicatorColor: Colors.white,
                    ),
                    labelStyle: Styles.tabTextStyle,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.white,
                    tabs: <Widget>[
                      Text('My Country'),
                      Text('Worldwide'),
                    ],
                    onTap: (index) {
                    },
                  ),
                ),
              ),
              SizedBox(height: screenHeight * .015,),
              DefaultTabController(
                length: 1,
                child: Container (
                  margin: const EdgeInsets.symmetric(horizontal: 13.0),
                  height: 35.0,
                  width: screenWidth * 1,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0)
                  ),
                ),
              ),
              SizedBox(height: screenHeight * .01,),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                        for (var endpoint in Endpoint.values)
                          StatsGrid(
                          endpoint: endpoint,
                          value: _endpointsData != null
                              ? _endpointsData.values[endpoint].value
                              : null,
                          ),
                ],
              ),
              
            
            ],
          ),
        ),
      ),
    );
  }
}

SliverToBoxAdapter _buildPreventionTips(double screenHeight, double screenWidth) {
    return SliverToBoxAdapter(
          child: CovidBarChart(covidCases: covidPHDailyNewCases),
    );
}

class MyClipper1 extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.cubicTo(size.width/15, size.height-60, 2*size.width/2, size.height+40, size.width, size.height-40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}
