import 'package:flutter/material.dart';

class OffCampusSearch extends StatefulWidget {
  const OffCampusSearch({super.key});

  @override
  State<OffCampusSearch> createState() => _OffCampusSearchState();
}

class _OffCampusSearchState extends State<OffCampusSearch> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('여기는 검색화면'),
      ),
    );
  }
}
