import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryRoute extends StatefulWidget {
  @override
  _BatteryRouteState createState() {
    return _BatteryRouteState();
  }
}

class _BatteryRouteState extends State<BatteryRoute> {
  static const platform = const MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = 'Unknown battery level.';
  // Get battery level.
  Future<Null> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: FlatButton(
              child: Text('电量信息'),
              color: Colors.grey[300],
              onPressed: _getBatteryLevel,
            ),
          ),
          Text(_batteryLevel),
        ],
      ),
    );
  }
}
