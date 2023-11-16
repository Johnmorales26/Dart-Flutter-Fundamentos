import 'package:flutter/material.dart';

class RoundedSearchBar extends StatelessWidget {
  const RoundedSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFE3E1EC),
        borderRadius: BorderRadius.all(Radius.circular(24.0))
      ),
      width: double.infinity,
      height: 48,
      child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Icon(Icons.search, color: Color(0xFF46464F)),
              SizedBox(width: 16),
              Text('Search Pokemon, Move, Ability, etc',
                  style: TextStyle(fontSize: 14, color: Color(0xFF46464F)))
            ],
          )),
    );
  }
}
