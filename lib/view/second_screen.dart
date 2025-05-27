import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final String serviceName;

  const SecondScreen({super.key, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Service'),
      ),
      body: Center(
        child: Text('You tapped on: $serviceName'),
      ),
    );
  }
}
