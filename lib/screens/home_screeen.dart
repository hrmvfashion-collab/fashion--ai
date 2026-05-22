import 'package:flutter/material.dart';
import 'closet_screen.dart';
import 'upload_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fashion AI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const UploadScreen(),
                  ),
                );
              },
              child: const Text('Upload Clothes'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ClosetScreen(),
                  ),
                );
              },
              child: const Text('My Closet'),
            ),
          ],
        ),
      ),
    );
  }
}
