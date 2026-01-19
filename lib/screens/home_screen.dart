import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'skills_screen.dart';
import 'projects_screen.dart';
import 'experience_screen.dart';
import 'contact_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final screens = const [
    ProfileScreen(),
    SkillsScreen(),
    ProjectsScreen(),
    ExperienceScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() => currentIndex = index);
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.code), label: "Skills"),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: "Projects"),
          BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "Exp"),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            label: "Contact",
          ),
        ],
      ),
    );
  }
}
