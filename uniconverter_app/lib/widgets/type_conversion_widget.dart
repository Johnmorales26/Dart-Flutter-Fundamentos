import 'package:flutter/material.dart';

class TypeConversionWidget extends StatelessWidget {
  const TypeConversionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xffFCB9B2),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                Image.asset('assets/icons/ic_punch.png', width: 56, height: 56),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          "Fuerza",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
