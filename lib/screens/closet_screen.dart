import 'dart:io';

import 'package:flutter/material.dart';
import '../database/database_helper.dart';

class ClosetScreen extends StatefulWidget {
  const ClosetScreen({super.key});

  @override
  State<ClosetScreen> createState() => _ClosetScreenState();
}

class _ClosetScreenState extends State<ClosetScreen> {
  List<Map<String, dynamic>> clothes = [];

  @override
  void initState() {
    super.initState();
    loadClothes();
  }

  Future loadClothes() async {
    clothes = await DatabaseHelper.instance.getClothes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Closet')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: clothes.length,
        itemBuilder: (context, index) {
          final item = clothes[index];

          return Card(
            child: Column(
              children: [
                Expanded(
                  child: Image.file(
                    File(item['imagePath']),
                    fit: BoxFit.cover,
                  ),
                ),
                Text(item['category']),
                Text(item['color']),
              ],
            ),
          );
        },
      ),
    );
  }
}
