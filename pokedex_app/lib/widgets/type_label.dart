import 'package:flutter/material.dart';

class TypeLabel extends StatelessWidget {
  final String type;

  const TypeLabel({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(24)),
        border: Border.all()
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Text(type),
    );
  }

}