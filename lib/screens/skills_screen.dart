import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text(
          "KEY SKILLS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF111827),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            SkillRow(
              title: "Languages & Frameworks:",
              value: "Flutter, Dart, React.js, HTML, CSS, PHP",
            ),
            SizedBox(height: 10),

            SkillRow(
              title: "APIs & Tools:",
              value: "JSON, Postman, Git, GitHub, VS Code, Android Studio",
            ),
            SizedBox(height: 10),

            SkillRow(
              title: "Concepts:",
              value:
                  "Cross-platform development, UI/UX design, Project Management",
            ),
            SizedBox(height: 10),

            SkillRow(title: "Other Skills:", value: "Debugging"),
          ],
        ),
      ),
    );
  }
}

class SkillRow extends StatelessWidget {
  final String title;
  final String value;

  const SkillRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: "$title ",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
          TextSpan(
            text: value,
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
