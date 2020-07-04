import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateFormatter {
  DateFormatter({@required this.lastUpdated});
  final DateTime lastUpdated;


  String lastUpdatedText(){
    if (lastUpdated != null) {
         DateFormat.yMEd();
      final formatter = new DateFormat('EEEE, MMMM d, y');
      final formatted = formatter.format(lastUpdated);
      return 'Last Updated: $formatted';
    }
    return '';
  }
}

class LastUpdated extends StatelessWidget {
  const LastUpdated({Key key, this.text}) : super(key: key);
  final String text;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0), 
          child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  )
      ),
    );
  }
}