import 'package:flutter/material.dart';
import 'package:lifeline/app/repositories/data_repository.dart';
import 'package:lifeline/app/repositories/endpoints_data.dart';
import 'package:lifeline/app/services/api.dart';
import 'package:lifeline/widgets/stats_grid.dart';
import 'package:provider/provider.dart';

import 'custom_app_bar.dart';
import 'last_updated.dart';

class GlobalData extends StatefulWidget {
  @override
  _GlobalDataState createState() => _GlobalDataState();
}

class _GlobalDataState extends State<GlobalData> {
  EndpointsData _endpointsData;

  void initState(){
    super.initState();
    _updateData();
  }

  Future<void> _updateData() async {
    final dataRepository = Provider.of<DataRepository>(context, listen: false);
    final endpointsData = await dataRepository.getAllEndpointsData();
    setState(() {
      _endpointsData = endpointsData;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          for (var endpoint in Endpoint.values)
            StatsGrid(
              endpoint: endpoint,
              value: _endpointsData != null
                  ? _endpointsData.values[endpoint].value
                  : null,
            ),
        ],
      ),
    );
  }
}


