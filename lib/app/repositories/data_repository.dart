

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:lifeline/app/repositories/endpoints_data.dart';
import 'package:lifeline/app/services/api.dart';
import 'package:lifeline/app/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:lifeline/app/services/endpoint_data.dart';

class DataRepository {
  DataRepository({@required this.apiService});
  final APIService apiService;

  String _accessToken;

  Future<EndpointData> getEndpointData(Endpoint endpoint) async =>
    await _getDataRefreshingToken<EndpointData>(
      onGetData: () => apiService.getEndpointData(
        accessToken: _accessToken, endpoint: endpoint)
    );


  Future<EndpointsData> getAllEndpointsData() async =>
    await _getDataRefreshingToken<EndpointsData>(
      onGetData: _getAllEndpointsData,
    );


  Future<T> _getDataRefreshingToken<T>({Future<T> Function() onGetData}) async {
    try {
      if (_accessToken == null){
      _accessToken = await apiService.getAccessToken();
    }
    
    return await onGetData(); 
    } on Response catch (response) {
      // if unauthorized, get access token again
      if (response.statusCode == 401) {
        _accessToken = await apiService.getAccessToken();
        return await onGetData(); 
      }
      rethrow;
    }
  }


  Future<EndpointsData> _getAllEndpointsData() async {
   final values =  await Future.wait([
      apiService.getEndpointData(
        accessToken: _accessToken, endpoint: Endpoint.cases),
      apiService.getEndpointData(
        accessToken: _accessToken, endpoint: Endpoint.deaths),
      apiService.getEndpointData(
        accessToken: _accessToken, endpoint: Endpoint.recovered),
      apiService.getEndpointData(
        accessToken: _accessToken, endpoint: Endpoint.active),
      apiService.getEndpointData(
        accessToken: _accessToken, endpoint: Endpoint.critical),
    ]);
    return EndpointsData(
      values: {
        Endpoint.cases: values[0],
        Endpoint.deaths: values[1],
        Endpoint.recovered: values[2],
        Endpoint.active: values[3],
        Endpoint.critical: values[4],
      }
    );
  }
}