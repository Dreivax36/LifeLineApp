
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:lifeline/screens/bottom_nav_screen.dart';
import 'package:lifeline/screens/login_screen.dart';
import 'package:lifeline/widgets/sidebar.dart';

class SideNavBar extends StatefulWidget {
  
  final Function onTap;

  SideNavBar({
    this.onTap
  });

  @override
  _SideNavBarState createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  bool isLoading = false;

  Future<Null> handleSignOut() async {
    this.setState(() {
      isLoading = true;
    });

    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();

    this.setState(() {
      isLoading = false;
    });
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false);
  }




  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(5, 96, 144, 1),
                      Color.fromRGBO(81, 159, 199, 1),
                    ]
                  ),
                ),
              child: Row(
                children: <Widget>[
                  Text(
                    'This is the Drawer',
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_left,
                      size: 65.0,
                      color: Colors.black,
                    ), 
                  ), 
                ],
              ),
            ),
            ListTile(
              title: Text('This is the list'),
            ),
            ListTile(
              title: Text('This is the list'),
            ),
            ListTile(
              title: Text('This is the list'),
            ),
            FlatButton(
              onPressed: handleSignOut,
              child: Text(
                'Sign Out',
                style: TextStyle(fontSize: 16.0),
              ),
              color: Color(0xffdd4b39),
              textColor: Colors.white,
              padding: const EdgeInsets.all(20.0),
        ),
          ],
        ),
      );
  }
}

/*
class DrawerPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
      Paint paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
      Path path = Path();
      path.moveTo(-size.width, 0);
      path.moveTo(size.width, 0);
      path.moveTo(size.width, size.height);
      path.moveTo(-size.width, size.height);
      path.close();

      canvas.drawPath(path,paint);
    }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
  */
  
//}