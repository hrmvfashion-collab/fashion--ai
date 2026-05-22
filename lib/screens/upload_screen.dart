import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../database/database_helper.dart';
import '../models/clothing_item.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? imageFile;

  Future pickImage() async {
    final picked = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (picked == null) return;

    setState(() {
      imageFile = File(picked.path);
    });
  }

  Future saveCloth() async {
    if (imageFile == null) return;

    final item = ClothingItem(
      imagePath: imageFile!.path,
      category: 'Shirt',
      color: 'Black',
    );

    await DatabaseHelper.instance.insertClothing(item);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upload')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Take Photo'),
            ),
            const SizedBox(height: 20),
            if (imageFile != null)
              Image.file(
                imageFile!,
                height: 250,
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveCloth,
              child: const Text('Save Cloth'),
            ),
          ],
        ),
      ),
    );
  }
}
