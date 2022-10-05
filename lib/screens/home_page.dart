import 'package:flutter/material.dart';

// ==========| Reem Code |==========
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Edit Information',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
              onPressed: () => Navigator.pushNamed(context, 'profile'),
              child: const Text(
                'Go to my Profile Page',
                style: TextStyle(fontSize: 18),
              ),
            )
          ],
        ),
      ),
    );
  }
}
