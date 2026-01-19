import 'package:flutter/material.dart';
import '../../widgets/stat_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: const Color(0xFF111827),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/profile.png"),
            ),
            const SizedBox(height: 12),
            const Text(
              "Ravi Raushan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Flutter Developer | CSE (AI-ML)",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                StatCard(title: "Projects", value: "3+"),
                StatCard(title: "Experience", value: "3 Month"),
                StatCard(title: "Role", value: "Flutter"),
              ],
            ),

            const SizedBox(height: 20),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF111827),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Text(
                "Highly motivated Flutter Developer with hands-on experience "
                "in mobile app development, API integration, and cross-platform UI.",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
