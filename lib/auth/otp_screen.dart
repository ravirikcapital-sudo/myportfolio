import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../main.dart';

class OtpScreen extends StatelessWidget {
  final String verificationId;
  final String password;

  OtpScreen({super.key, required this.verificationId, required this.password});

  final otp = TextEditingController();

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
              "Verify OTP",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: otp,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: "Enter OTP",
                filled: true,
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () async {
                try {
                  PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: verificationId,
                    smsCode: otp.text,
                  );

                  await FirebaseAuth.instance.signInWithCredential(credential);

                  // ✅ OTP Verified
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(const SnackBar(content: Text("Invalid OTP")));
                }
              },
              child: const Text("Verify"),
            ),
          ],
        ),
      ),
    );
  }
}
