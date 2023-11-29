import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemData extends StatelessWidget {
  final String category;
  final String value;

  const ItemData({super.key, required this.category, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(category, style: GoogleFonts.sora(fontSize: 16)),
        const SizedBox(height: 8),
        Text(value,
            style: GoogleFonts.sora(fontSize: 20, fontWeight: FontWeight.bold))
      ],
    );
  }
}
