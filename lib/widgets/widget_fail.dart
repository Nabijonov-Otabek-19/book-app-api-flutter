import 'package:flutter/material.dart';

class WidgetFail extends StatelessWidget {
  final String message;

  const WidgetFail({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message, style: const TextStyle(fontSize: 32)),
    );
  }
}
