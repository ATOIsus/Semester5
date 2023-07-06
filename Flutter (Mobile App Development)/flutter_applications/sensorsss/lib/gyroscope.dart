import 'dart:async';

import 'package:all_sensors2/all_sensors2.dart';
import 'package:flutter/material.dart';

class GyroscopeScreen extends StatefulWidget {
  const GyroscopeScreen({super.key});

  @override
  State<GyroscopeScreen> createState() => _GyroscopeScreenState();
}

class _GyroscopeScreenState extends State<GyroscopeScreen> {
  List<double> _gyroValue = <double>[];
  final List<StreamSubscription<dynamic>> _streamSubscriptions = [];

  @override
  void initState() {
    _streamSubscriptions.add(gyroscopeEvents!.listen((event) {
      setState(() {
        _gyroValue = <double>[event.x, event.y, event.z];
      });
    }));
    super.initState();
  }

  @override
  void dispose() {
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gyroscope'),
      ),
      body: Center(
        child: Text(
            'Accelerometer values:\n \n X: ${_gyroValue[0]} , Y : ${_gyroValue[0]} , Z : ${_gyroValue[0]}'),
      ),
    );
  }
}
