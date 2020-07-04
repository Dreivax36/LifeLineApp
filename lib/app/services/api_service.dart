import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import "package:lifeline/app/services/api.dart";
import 'package:lifeline/app/services/endpoint_data.dart';

class APIService {
  APIService(this.api);
  final API api;

  Future<String> getAccessToken() async {
    final response = await http.post(
      api.tokenUri().toString(),
      headers: {'Authorization': 'Basic ${api.apiKey}'}
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final accessToken = data['access_token'];
      print ('Sucess Token');
      if (accessToken != null){

        print ('Sucess Token' + accessToken.toString());
        return accessToken;
      }
    }
    print('Request ${api.tokenUri()} failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
    throw response;
  }

  Future<EndpointData> getEndpointData({
    @required String accessToken,
    @required Endpoint endpoint,
    
  }) async {
    print ('Sucess Auto ' + accessToken);
    final uri = api.endpointUri(endpoint);
    final response = await http.get(
      uri.toString(),
       headers: {'Authorization': 'Bearer $accessToken'},
    );
    print ('Sucess Auto ' + response.toString());
    if (response.statusCode == 200) {
      print ('Sucess eyyyyyy');
      final List<dynamic> data = json.decode(response.body);
        if (data.isNotEmpty){
          final Map<String, dynamic> endpointData = data[0];
          final String responseJsonKey = _responseJsonKeys[endpoint];
          final int value = endpointData[responseJsonKey];
          final String dateString = endpointData['date'];
          final date = DateTime.tryParse(dateString);
          if (value != null){
            return EndpointData(value: value, date: date);
          }
        }
      }
      print('Request $uri failed\nResponse: ${response.statusCode} ${response.reasonPhrase}');
      throw response;
    }



   static Map<Endpoint, String> _responseJsonKeys = {
    Endpoint.cases: 'data',
    Endpoint.active: 'data',
    Endpoint.critical: 'data',
    Endpoint.deaths: 'data',
    Endpoint.recovered: 'data',
  };
  
  
}