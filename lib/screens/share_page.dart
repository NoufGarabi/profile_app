import 'package:flutter/material.dart';

// ==========| Reem Code |==========
class SharePage extends StatelessWidget {
  const SharePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),
          IconButton(
            padding: const EdgeInsets.only(top: 20.0, left: 28.0),
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
              color: Colors.black,
            ),
          ),
          const Center(
            child: Text(
              'Share Screen',
              style: TextStyle(fontSize: 24.0),
            ),
          ),
        ],
      ),
    );
  }
}
