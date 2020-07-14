import 'package:flutter/material.dart';
import 'package:lifeline/widgets/custom_app_bar.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

 
class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: MapBody(),
    );
  }
}
 
class MapBody extends StatefulWidget {
  @override
  _MapBodyState createState() => new _MapBodyState();
}
 
class _MapBodyState extends State<MapBody> {
 
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: new FlutterMap(
          options: new MapOptions(
            center: new LatLng(13.6218, 123.1948), minZoom: 15.0),
            layers: [
              new TileLayerOptions(
                urlTemplate:
                  "https://api.mapbox.com/styles/v1/dreivax36/ckclwe9zt12951iomvo07biy2/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZHJlaXZheDM2IiwiYSI6ImNrY2x2YXA0YTBjMm4zNG04b3RjeGRmNWcifQ.JXjEp8-d-qqnQzF3hgqCKA",
                additionalOptions: {
                  'accessToken':
                      'pk.eyJ1IjoiZHJlaXZheDM2IiwiYSI6ImNrY2x6OWZhajJhYWkzNW54NjVqN2duMHYifQ.7Q0G0ETN0mS_QpLVtJmCrw',
                  'id': 'mapbox.mapbox.satellite'
                }
              ),
              new MarkerLayerOptions(
                markers: [
                  new Marker(
                    width: 45.0,
                    height: 45.0,
                    point: new LatLng(13.6218, 123.1948),
                    builder: (context) => new Container(
                      child: IconButton(
                        icon: Icon(Icons.location_on),
                        color: Colors.red,
                        iconSize: 45.0,
                        onPressed: () {
                          print('Marker tapped');
                        },
                      ),
                    )
                  )
                ]
              )
            ]));
  }
}