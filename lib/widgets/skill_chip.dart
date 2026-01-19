import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String text;
  const SkillChip({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text, style: const TextStyle(color: Color(0xFF38BDF8))),
      backgroundColor: Colors.transparent,
      shape: StadiumBorder(
        side: BorderSide(color: Color(0xFF38BDF8)),
      ),
    );
  }
}
