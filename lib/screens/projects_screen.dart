import 'package:flutter/material.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text(
          "PROJECTS",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF111827),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Project 1
            ProjectItem(
              title: "DharmaBookingApp (Flutter)",
              points: [
                "Developed complete UI and backend integration with authentication and dynamic pages.",
                "Implemented responsive design and optimized performance for Android and iOS.",
              ],
            ),

            SizedBox(height: 16),

            // Project 2
            ProjectItem(
              title: "MLM App (Flutter)",
              points: [
                "Integrated multiple REST APIs and built a responsive, user-friendly interface.",
                "Ensured data synchronization and secure authentication.",
              ],
            ),

            SizedBox(height: 16),

            // Project 3
            ProjectItem(
              title: "ERP / Business Management App (Flutter)",
              points: [
                "Combined multiple business modules into a single Flutter project.",
                "Focused on scalability and maintainable architecture.",
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String title;
  final List<String> points;

  const ProjectItem({super.key, required this.title, required this.points});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        ...points.map(
          (point) => Padding(
            padding: const EdgeInsets.only(left: 8, bottom: 6),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("• ", style: TextStyle(color: Colors.white70)),
                Expanded(
                  child: Text(
                    point,
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
