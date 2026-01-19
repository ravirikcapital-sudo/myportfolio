import 'package:flutter/material.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("Experience"),
        backgroundColor: const Color(0xFF111827),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ExperienceTile(
              role: "Flutter Developer (Freelance)",
              company: "Self Employed",
              duration: "2023 – 2024",
              points: [
                "Delivered multiple Flutter applications",
                "Integrated REST APIs",
                "Improved UI/UX performance",
              ],
            ),
            SizedBox(height: 16),
            ExperienceTile(
              role: "Flutter Intern (Dart)",
              company: "PeaceInfotech Pvt Ltd",
              duration: "Sep 2025 – Nov 2025",
              points: [
                "Developed APIs using Dart",
                "Client-side integration",
                "Worked in agile sprints",
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExperienceTile extends StatelessWidget {
  final String role;
  final String company;
  final String duration;
  final List<String> points;

  const ExperienceTile({
    super.key,
    required this.role,
    required this.company,
    required this.duration,
    required this.points,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(16),
        border: Border(left: BorderSide(color: Color(0xFF38BDF8), width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            role,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            company,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 4),
          Text(
            duration,
            style: const TextStyle(fontSize: 11, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          ...points.map(
            (e) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.circle, size: 6, color: Color(0xFF38BDF8)),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    e,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
