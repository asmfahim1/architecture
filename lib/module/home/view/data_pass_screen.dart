import 'package:architecture_getx/core/widgets/exports.dart';
import 'package:flutter/material.dart';

class DataPassScreen extends StatelessWidget {
  final Map<String, dynamic> map;
  const DataPassScreen({super.key, required this.map});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Column(
        children: [
          TextWidget(map['name']),
          TextWidget(map['email']),
          TextWidget(map['id']),
        ],
      ),
    );
  }
}
