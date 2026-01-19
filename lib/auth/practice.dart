import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void showMsg(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0172A),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "create Account",
              style: const TextStyle(color: Colors.white, fontSize: 30),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: phoneController,
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
            const SizedBox(height: 16),

            TextField(
              controller: passwordController,
              obscureText: true,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Enter your password",
                hintStyle: TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Color(0xFF1E293B),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () {
                String phone = phoneController.text;
                String password = passwordController.text;

                //empty check
                if (phone.isEmpty || password.isEmpty) {
                  showMsg(context, "All fields are required");
                  return;
                }
                if (phone.length != 10) {
                  showMsg(context, "Phone must be 10 digits");
                  return;
                }
                if (password.length < 6) {
                  showMsg(context, "Password too short");
                }
                if (!password.contains("@")) {
                  showMsg(context, "password must contain @");
                  return;
                }
                if (!RegExp(r'^[0-9]+$').hasMatch(phone)) {
                  showMsg(context, "Phone must contain only digits");
                  return;
                }
                showMsg(context, "Login successful");
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text("Register", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}
