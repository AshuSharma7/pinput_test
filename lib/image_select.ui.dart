import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class PickImagePage extends StatefulWidget {
  const PickImagePage({super.key});

  @override
  State<PickImagePage> createState() => _PickImagePageState();
}

class _PickImagePageState extends State<PickImagePage> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            image == null
                ? Placeholder()
                : Container(
                    width: 200,
                    height: 200,
                    child: Image.file(File(image?.path ?? '')),
                  ),
            ElevatedButton(
              onPressed: () async {
                final a =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {
                  image = a;
                });
              },
              child: Text('Pick Image'),
            ),
          ],
        ),
      ),
    );
  }
}
