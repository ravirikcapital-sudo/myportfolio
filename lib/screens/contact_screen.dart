import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        title: const Text("Contact"),
        backgroundColor: const Color(0xFF111827),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ContactCard(
              icon: Icons.email,
              title: "Email",
              value: "ravi.raushan.13101@gmail.com",
              onTap: () =>
                  launchUrl(Uri.parse("mailto:ravi.raushan.13101@gmail.com")),
            ),
            const SizedBox(height: 12),
            ContactCard(
              icon: Icons.code,
              title: "GitHub",
              value: "github.com/ravi3333sudo",
              onTap: () =>
                  launchUrl(Uri.parse("https://github.com/ravi3333sudo")),
            ),
            const SizedBox(height: 12),
            ContactCard(
              icon: Icons.person,
              title: "LinkedIn",
              value: "linkedin.com/in/ravi-raushan13",
              onTap: () => launchUrl(
                Uri.parse("https://www.linkedin.com/in/ravi-raushan13/"),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF38BDF8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
                onPressed: () async {
                  final Uri resumeUrl = Uri.parse(
                    "https://drive.google.com/uc?export=download&id=1LbsNStqqJ4cKuQ8eXjPuAcJahebOquu0",
                  );

                  await launchUrl(
                    resumeUrl,
                    mode: LaunchMode.externalApplication,
                  );
                },

                child: const Text(
                  "Hire Me",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const ContactCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF38BDF8)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  value,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
