import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),

            const SizedBox(height: 24),

            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Mobile Number",
                filled: true,
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: password,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Password",
                filled: true,
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () async {
                if (phone.text.isEmpty || password.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("All fields required")),
                  );
                  return;
                }

                // 1. Firestore mein data save karein
                await FirebaseFirestore.instance
                    .collection('users')
                    .doc(phone.text)
                    .set({'password': password.text});

                // 2. Message dikhayein
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Completed register successfully"),
                    duration: Duration(seconds: 2), // Message 2 second dikhega
                  ),
                );

                // 3. YAHAN EDIT KIYA: 2 second ruko taaki user message padh sake
                await Future.delayed(const Duration(seconds: 2));

                // 4. Ab Login screen par bhejein
                if (!mounted) return;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text("Register"),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
              child: const Text(
                "Already have an account? Login",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
