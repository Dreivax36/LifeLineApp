import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lifeline/screens/signup_page.dart';
import 'bottom_nav_screen.dart';
import 'login_screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return new Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                height: screenHeight * .15,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromRGBO(5, 96, 144, 1),
                      Color.fromRGBO(81, 159, 199, 1),
                    ]
                  ),
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 20,
                      left: -18,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(
                          Icons.arrow_left,
                          size: 65.0,
                          color: Colors.white,
                        ), 
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        'assets/images/Lifeline1.png',
                        //scale: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * .02),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Sign Up to Lifeline',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 10.0,
                              offset: Offset(0, 10),
                            ),
                          ],
                        ),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide your Lastname';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Last Name'
                            ),
                            onSaved: (input) => _email = input.trim(),
                          ),
                          TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide your First Name';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'First Name'
                            ),
                            onSaved: (input) => _email = input.trim(),
                          ),
                          TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide your Middle Initial';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Middle Initial'
                            ),
                            onSaved: (input) => _email = input.trim(),
                          ),

                          TextFormField(
                            validator: (input) {
                              if(input.isEmpty){
                                return 'Provide an email';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Email'
                            ),
                            onSaved: (input) => _email = input.trim(),
                          ),
                          TextFormField(
                            validator: (input) {
                              if(input.length < 6){
                                return 'Longer password please';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Password'
                            ),
                            onSaved: (input) => _password = input.trim(),
                            obscureText: true,
                          ),

                          TextFormField(
                            validator: (input) {
                              if(input.length < 6){
                                return 'Longer password please';
                              }
                            },
                            decoration: InputDecoration(
                                labelText: 'Confirm Password'
                            ),
                            onSaved: (input) => _password = input.trim(),
                            obscureText: true,
                          ),
                          //SizedBox(height: screenHeight * 0.02,),
                        ],
                      ),
                      ),
                      SizedBox(height: 25,),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [
                                  Color.fromRGBO(81, 159, 199, 1),
                                  Color.fromRGBO(5, 96, 144, 1),
                                  Color.fromRGBO(81, 159, 199, 1),
                                ]
                            )
                        ),
                        child: FlatButton(
                          onPressed: signUp,
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                            'or Sign Up using',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: screenWidth * .42,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                                color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                child: FlatButton(
                                  onPressed: signUp,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                        child: Center(
                                          child:
                                            ImageIcon(AssetImage('assets/images/facebook-64.png')),
                                          ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Text( 'Facebook',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Montserrat'
                                        ),
                                      ),
                                    ],  
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Container(
                            height: 40.0,
                            width: screenWidth * .42,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 2.0),
                                color: Colors.transparent,
                              borderRadius: BorderRadius.circular(20.0)),
                              child: Center(
                                child: FlatButton(
                                  onPressed: signUp,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                        child: Center(
                                          child:
                                            ImageIcon(AssetImage('assets/images/google.png')),
                                          ),
                                      ),
                                      SizedBox(width: 10.0),
                                      Text( 'Google',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontFamily: 'Montserrat'
                                        ),
                                      ),
                                    ],  
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        //user.sendEmailVerification();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
      }catch(e){
        print(e.message);
      }
    }
  }
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
