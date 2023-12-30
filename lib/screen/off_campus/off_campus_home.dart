import 'package:flutter/material.dart';
import 'package:starting_block/constants/constants.dart';

class OffCampus extends StatefulWidget {
  const OffCampus({super.key});

  @override
  State<OffCampus> createState() => _OffCampusState();
}

class _OffCampusState extends State<OffCampus> {
  bool newAlarmState = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        newAlarm: newAlarmState,
      ),
    );
  }
}
