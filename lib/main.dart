import 'package:flutter/material.dart';
import 'package:lifeline/screens/splashscreen.dart';
import 'package:provider/provider.dart';

import 'app/repositories/data_repository.dart';
import 'app/services/api.dart';
import 'app/services/api_service.dart';

void main() {
  runApp(Load());
}

class Load extends StatefulWidget {
  @override
  _LoadState createState() => _LoadState();
}

class _LoadState extends State<Load> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider<DataRepository>(
      create: (_) => DataRepository(
        apiService: APIService(AdminAPI.sandbox()),
        ),
          child: MaterialApp(
            title: 'Lifeline - COVID-19 Alert',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            home: SplashScreen(),
          )
    );
  }
}
