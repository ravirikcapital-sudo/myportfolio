import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'signup_screen.dart';
import '../screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isLoading = false;

  @override
  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    final phoneText = phone.text.trim();
    final passwordText = password.text.trim();

    if (phoneText.isEmpty || passwordText.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("All fields required")));
      return;
    }

    setState(() => isLoading = true);

    try {
      final doc = await FirebaseFirestore.instance
          .collection('users')
          .doc(phoneText)
          .get();

      if (!doc.exists) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("User not found")));
        setState(() => isLoading = false);
        return;
      }

      if (doc['password'] != passwordText) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Wrong password")));
        setState(() => isLoading = false);
        return;
      }

      // ✅ LOGIN SUCCESS
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Login successful")));

      await Future.delayed(const Duration(milliseconds: 400));

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $e")));
      setState(() => isLoading = false);
    }
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
              "Login",
              style: TextStyle(fontSize: 26, color: Colors.white),
            ),

            const SizedBox(height: 24),

            TextField(
              controller: phone,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Mobile Number",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF1E293B),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: password,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF1E293B),
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: isLoading ? null : loginUser,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Login"),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SignupScreen()),
                );
              },
              child: const Text(
                "Create Account",
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
