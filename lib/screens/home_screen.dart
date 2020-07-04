import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lifeline/config/styles.dart';
import 'package:lifeline/widgets/widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          _buildHeader(screenHeight, screenWidth),
          _buildPreventionTips(screenHeight, screenWidth),
          _buildCallSMS(screenHeight, screenWidth),
        ],
      ),
    );
  }

  SliverToBoxAdapter _buildHeader(double screenHeight, double screenWidth){
    return SliverToBoxAdapter(
      child: ClipPath(
        clipper: MyClipper(),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 13, 20, 5),
          height: screenHeight * .295,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(5, 96, 144, 1),
                  Color.fromRGBO(81, 159, 199, 1),
                ]
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                width: screenWidth / 2.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AutoSizeText(
                      'COVID-19 ALERT',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                    SizedBox(height: screenHeight * 0.008),
                    AutoSizeText(
                      'How are you Today?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                      //presetFontSizes: [16, 15, 14,],
                      textAlign: TextAlign.left,
                      maxLines: 1,
                    ),
                    SizedBox(height: screenHeight * 0.007),
                    AutoSizeText(
                      'Do you feel you have the symptoms of COVID-19? Take our Self-Assessment Today',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                      //presetFontSizes: [16, 15, 14,],
                      textAlign: TextAlign.left,
                      maxLines: 4,
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    SizedBox(
                      width: double.infinity,
                      //width: screenWidth / 2,
                      //padding: const EdgeInsets.fromLTRB(20, 3, 0, 0),
                      child: Row(
                        children: <Widget>[
                          FlatButton.icon(
                            onPressed: (){},
                            color: Color.fromRGBO(53, 79, 121, 1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                            label: AutoSizeText(
                              'Self Assessment',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                              presetFontSizes: [16, 15, 14,],
                            ),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(width: screenWidth * .020),
              Stack(
                children: <Widget>[
                  //Expanded(child:
                  Container(
                    width: screenWidth / 2.5,
                    child: Positioned(
                        child: Image.asset(
                          'assets/images/Doct.png',
                          scale: 1.4,
                          //fit: BoxFit.fitHeight,
                        )
                    ),
                  ),

                  //),
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
    child: Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
              children: <Widget>[
                AutoSizeText (
                    'PREVENTIONS',
                    style: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25.0,
                    ),
                  minFontSize: 2,
                  stepGranularity: 2,
                  maxLines: 1,
                ),
                Spacer(),
                AutoSizeText (
                    'More Details',
                    style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 15.0,
                    ),
                  minFontSize: 2,
                  stepGranularity: 2,
                ),
              ]
          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: screenWidth * .45, // screenWidth ,
                      height: screenHeight * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 5,
                            color: Colors.black54,
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(-1.0, -2.0),
                            end: Alignment(1.0, 2.0),
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(52, 127, 172, 1),
                              Color.fromRGBO(48, 24, 108, 1),
                            ]
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            child: Image.asset(
                              'assets/images/1r.gif',
                              scale: 8,
                              //fit: BoxFit.fitHeight,
                              //alignment: Alignment.topRight,
                            ),
                          ),

                          Positioned(
                            left: 98.0,
                            child: Container(
                              child: AutoSizeText(
                                'Clean your \nhands often. \nUse soap and \nwater, or an \nalcohol-based \nhand rub.',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                                presetFontSizes: [13, 10, 9, 7 , 5 ,3 ,1],
                                textAlign: TextAlign.right,
                                maxLines: 6,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  children: <Widget>[
                    Container(
                      width: screenWidth * .45, // screenWidth,
                      height: screenHeight * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 5,
                            color: Colors.black54,
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(-1.0, -2.0),
                            end: Alignment(1.0, 2.0),
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(52, 127, 172, 1),
                              Color.fromRGBO(48, 24, 108, 1),
                            ]
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            child: Image.asset(
                              'assets/images/3r.gif',
                              scale: 8,
                              fit: BoxFit.fitWidth,
                              //alignment: Alignment.topRight,
                            ),
                          ),

                          Positioned(
                            left: 83.0,
                            child: AutoSizeText(
                              'Cover your nose '
                                  '\nand mouth when '
                                  '\nyou cough or '
                                  '\nsneeze or'
                                  '\nwear a mask.',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              presetFontSizes: [13, 10, 9, 7 , 5 ,3 ,1],
                              textAlign: TextAlign.right,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]
          ),
          SizedBox(height: screenHeight * 0.0125),
          Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: screenWidth * .45, // screenWidth,
                      height: screenHeight * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 5,
                            color: Colors.black54,
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(-1.0, -2.0),
                            end: Alignment(1.0, 2.0),
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(52, 127, 172, 1),
                              Color.fromRGBO(48, 24, 108, 1),
                            ]
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned(
                            left: 0,
                            child: Image.asset(
                              'assets/images/6.gif',
                              scale: 8,
                              //fit: BoxFit.fitHeight,
                              //alignment: Alignment.topRight,
                            ),
                          ),

                          Positioned(
                            left: 100.0,
                            child: AutoSizeText(
                              'Maintain your \n'
                                  'Social '
                                  '\nDistancing',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              presetFontSizes: [13, 10, 9, 7 , 5 ,3 ,1],
                              textAlign: TextAlign.right,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Stack(
                  children: <Widget>[
                    Container(
                      width: screenWidth * .45, // screenWidth,
                      height: screenHeight * 0.12,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 5,
                            color: Colors.black54,
                          ),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment(-1.0, -2.0),
                            end: Alignment(1.0, 2.0),
                            colors: [
                              Color.fromRGBO(255, 255, 255, 1),
                              Color.fromRGBO(52, 127, 172, 1),
                              Color.fromRGBO(48, 24, 108, 1),
                            ]
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Positioned(
                            left: -7,
                            child: Image.asset(
                              'assets/images/2.gif',
                              scale: 8,
                              //fit: BoxFit.fitHeight,
                              //alignment: Alignment.topRight,
                            ),
                          ),

                          Positioned(
                            left: 88.0,
                            child: AutoSizeText(
                              'Be informed and'
                                  '\n follow the'
                                  '\ndirections of'
                                  '\nyour local'
                                  '\n health authority.',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                              ),
                              presetFontSizes: [13, 10, 9, 7 , 5 ,3 ,1],
                              textAlign: TextAlign.right,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ],
      )
    ),
  );
}

SliverToBoxAdapter _buildCallSMS(double screenHeight, double screenWidth){
  return SliverToBoxAdapter(
    child: Container(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AutoSizeText (
            'Do you need any assistance?',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 25.0,
            ),
            presetFontSizes: [25, 24, 23, 22, 21, 20,],
            textAlign: TextAlign.left,
            maxLines: 5,
          ),
          SizedBox(height: screenHeight * 0.01),
          AutoSizeText (
            'The Department of Health is providing telemedicine consultations for patients who need COVID-19 medical advice or other non-COVID-19 primary care consultations.',
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 17.0,
            ),
            presetFontSizes: [16, 15, 14,],
            textAlign: TextAlign.left,
            maxLines: 5,

          ),
          SizedBox(height: screenHeight * 0.01),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 50,
                width: screenWidth * .43, // screenWidth,
                child: FlatButton.icon(
                  onPressed: () {},
                  color: Color.fromRGBO(255, 76, 88, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  icon: const Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Call Now',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 19.0,
                    ),
                  ),
                  textColor: Colors.white,
                ),
              ),

              SizedBox(width: screenWidth * .019), //screenWidth

              Container(
                height: 50,
                width: screenWidth * .43, // screenWidth,
                child: FlatButton.icon(
                  onPressed: () {},
                  color: Color.fromRGBO(124, 221, 149, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  icon: const Icon(
                    Icons.message,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Send SMS',
                    style: const TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 19.0,
                    ),
                  ),
                  textColor: Colors.white,
                ),
              ),
            ],
          )
        ]
      ),
    ),
  );
}


class MyClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height-40);
    path.cubicTo(size.width/1550, size.height+40, 3*size.width/3, size.height*0.7, size.width, size.height*1);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
  
}
