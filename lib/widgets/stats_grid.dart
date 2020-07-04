import 'package:flutter/material.dart';
import 'package:lifeline/app/services/api.dart';

class EndpointCardData {
  EndpointCardData(this.title, this.assetName, this.color);
  final String title;
  final String assetName;
  final Color color;
}

class StatsGrid extends StatelessWidget {

  const StatsGrid({Key key, this.endpoint, this.value,}) : super(key: key);
  
  final Endpoint endpoint;
  final int value;

  static Map<Endpoint, EndpointCardData> _cardsData = {
    Endpoint.cases: 
      EndpointCardData('Cases:', 'assets/ico/count.png', Color(0xFFFFF492)),
    Endpoint.deaths:
      EndpointCardData('Deaths:', 'assets/ico/death.png', Color(0xFFE40000)),
    Endpoint.recovered:
      EndpointCardData('Recovered:', 'assets/ico/patient.png', Color(0xFF70A901)),
    Endpoint.active:
      EndpointCardData('Active:', 'assets/ico/fever.png', Color(0xFFEEDA92)),
    Endpoint.critical:
      EndpointCardData('Critical:', 'assets/ico/suspect.png', Color(0xFFE99600)),
    };

  Widget build(BuildContext context){
    final cardData = _cardsData[endpoint];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Container(
        decoration: BoxDecoration(
            boxShadow: [
                          BoxShadow(
                            offset: Offset(0,4),
                            blurRadius: 4,
                            color: Colors.black54,
                          ),
                        ],
           gradient: LinearGradient(
             begin: Alignment.topLeft,
              end: Alignment.bottomRight,
                colors: [
                  Color.fromRGBO(76, 91, 124, 1),
                  Color.fromRGBO(141, 107, 197, 10),
                ]
            ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding (
           padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.8),
        child: Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
             Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                    cardData.title,
                    style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: cardData.color),
                  ),
              SizedBox(height: 4,),
                  Image.asset(
                    cardData.assetName,
                    scale: 1.8,
                    color: cardData.color,
                    ),
            ],
          ),
            Text(
                    value != null ? value.toString() : '',
                    style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(
                        color: cardData.color, 
                        fontWeight: FontWeight.bold,
                        fontSize: 27, 
                        )
                  ),
          ],
        ),
        )
        ),
    );
  }
}
