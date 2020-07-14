import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lifeline/screens/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'bottom_nav_screen.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;

import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  void initState() {
    super.initState();
    isSignIn();
  }

  //Facebook Login
  FacebookLogin fbLogin = new FacebookLogin();

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
                padding: const EdgeInsets.fromLTRB(20, 13, 20, 5),
                height: screenHeight * .3,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(5, 96, 144, 1),
                    Color.fromRGBO(81, 159, 199, 1),
                  ]),
                ),
                child: Center(
                  child: Image.asset(
                    'assets/images/Lifeline1.png',
                    //scale: 1,
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Welcome to Lifeline',
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
                                if (input.isEmpty) {
                                  return 'Provide an email';
                                }
                              },
                              decoration: InputDecoration(labelText: 'Email'),
                              onSaved: (input) => _email = input.trim(),
                            ),
                            TextFormField(
                              validator: (input) {
                                if (input.length < 6) {
                                  return 'Longer password please';
                                }
                              },
                              decoration:
                                  InputDecoration(labelText: 'Password'),
                              onSaved: (input) => _password = input.trim(),
                              obscureText: true,
                            ),
                            //SizedBox(height: screenHeight * 0.02,),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 12, 10, 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "Forgot Password?",
                                    style: TextStyle(
                                        color:
                                            Color.fromRGBO(143, 148, 251, 1)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(colors: [
                              Color.fromRGBO(81, 159, 199, 1),
                              Color.fromRGBO(5, 96, 144, 1),
                              Color.fromRGBO(81, 159, 199, 1),
                            ])),
                        child: FlatButton(
                          onPressed: signIn,
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0),
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
                                  onPressed: () {
                                    signInFB();
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 8, 0, 8),
                                        child: Center(
                                          child: ImageIcon(AssetImage(
                                              'assets/images/facebook-64.png')),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * .029),
                                      Text(
                                        'Facebook',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'Montserrat'),
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
                                  onPressed: googleSignIn,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8, 8, 0, 8),
                                        child: Center(
                                          child: ImageIcon(AssetImage(
                                              'assets/images/google.png')),
                                        ),
                                      ),
                                      SizedBox(width: screenWidth * .029),
                                      Text(
                                        'Google',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                            fontFamily: 'Montserrat'),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'New to Lifeline ?',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                            child: Text(
                              'Register',
                              style: TextStyle(
                                  color: Colors.lightBlue[900],
                                  fontFamily: 'Montserrat',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        AuthResult result = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);

        FirebaseUser user = result.user;

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => BottomNavScreen()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  FlutterToast flutterToast;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signInFB() async {
    FacebookLogin _facebookLogin = FacebookLogin();

    final result = await _facebookLogin.logIn(['email']);
    final token = result.accessToken.token;
    final graphResponse = await http.get(
        'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name&access_token=${token}');
    print(graphResponse.body);
    print(result.status);
    if (result.status == FacebookLoginStatus.loggedIn) {
      final credential = FacebookAuthProvider.getCredential(accessToken: token);
      _auth.signInWithCredential(credential);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
    }
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();
  bool isLoading = false;
  bool isLoggedIn = false;

  SharedPreferences prefs;
  FirebaseUser currentUser;

  void isSignIn() async {
    setState(() {
      isLoading = true;
    });
    prefs = await SharedPreferences.getInstance();

    isLoggedIn = await _googleSignIn.isSignedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<FirebaseUser> googleSignIn() async {
    print('testing');
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    AuthCredential credential = GoogleAuthProvider.getCredential(
      idToken: googleAuth.idToken,
      accessToken: googleAuth.accessToken,
    );
    final FirebaseUser firebaseUser =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    print("signed in " + firebaseUser.displayName);
     print('testing1');
    if (firebaseUser != null) {
       print('testing2');
      final QuerySnapshot result = await Firestore.instance
          .collection('user')
          .where('id', isEqualTo: firebaseUser.uid)
          .getDocuments();

      List<DocumentSnapshot> docuemnts =  result.documents;

      if (docuemnts.length == 0){
         print('testing3');
        Firestore.instance.collection('user').document(firebaseUser.uid).setData({
          'id': firebaseUser.uid,
          'username': firebaseUser.displayName,
          'photoUrl': firebaseUser.photoUrl,
        });

        //Data to Local
        currentUser = firebaseUser;
        await prefs.setString('id', currentUser.uid);
        await prefs.setString('username', currentUser.displayName);
        await prefs.setString('photoUrl', currentUser.photoUrl);
      }
      else {
        await prefs.setString('id', docuemnts[0]['id']);
        await prefs.setString('username', docuemnts[0]['username']);
        await prefs.setString('PhotoUrl', docuemnts[0]['photoUrl']);
      }
      
       setState(() {
        isLoading = false;
         print('testing4');
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => BottomNavScreen()));
    }
    else{
       print('testing5');
      setState(() {
        isLoading = false;
      });
    }
    return firebaseUser;
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);
    path.cubicTo(size.width / 1550, size.height + 40, 3 * size.width / 3,
        size.height * 0.7, size.width, size.height * 1);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
