import 'package:flutter/cupertino.dart';
import 'package:lifeline/app/services/api.dart';
import 'package:lifeline/app/services/endpoint_data.dart';


class EndpointsData{
  EndpointsData({@required this.values});
  final Map<Endpoint, EndpointData> values;

  EndpointData get cases => values[Endpoint.cases];
  EndpointData get deaths => values[Endpoint.deaths];
  EndpointData get recovered => values[Endpoint.recovered];
  EndpointData get active => values[Endpoint.active];
  EndpointData get critical => values[Endpoint.critical];

  @override
  String toString() =>
    'cases: $cases, deaths: $deaths, recovered: $recovered, active: $active, critical: $critical';
}