import 'package:lifeline/app/services/api_keys.dart';
import 'package:flutter/foundation.dart';

enum Endpoint {
  cases,
  deaths,
  recovered,
  active,
  critical,
}

abstract class API {
  String get apiKey;
  Uri tokenUri();
  Uri endpointUri(Endpoint endpoint);
}

class AdminAPI implements API {
  AdminAPI({@required this.apiKey});
  final String apiKey;

  factory AdminAPI.sandbox() => AdminAPI(apiKey: APIKeys.covidSandBoxKey);

  static final String host = 'apigw.nubentos.com';
  static final int port = 443;
  static final String basePath = 't/nubentos.com/ncovapi/2.0.0';

  Uri tokenUri() => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: 'token',
        queryParameters: {'grant_type': 'client_credentials'},
      );

  Uri endpointUri(Endpoint endpoint) => Uri(
        scheme: 'https',
        host: host,
        port: port,
        path: '$basePath/${_paths[endpoint]}',
      );

  static Map<Endpoint, String> _paths = {
    Endpoint.cases: 'cases',
    Endpoint.active: 'active',
    Endpoint.critical: 'critical',
    Endpoint.deaths: 'deaths',
    Endpoint.recovered: 'recovered',
  };
}
