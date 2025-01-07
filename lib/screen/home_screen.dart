import 'package:flutter/material.dart';
import 'package:sticker/component/main_app_bar.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sticker/component/footer.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          renderBody(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MainAppBar(
                onPickImage: onPickImage,
                onSaveImage: onSaveImage,
                onDeleteImage: onDeleteImage),
          ),
          if (image != null) // ➌ image가 선택되면 Footer 위치하기
            Positioned(
              // 맨 아래에 Footer 위젯 위치하기
              bottom: 0,
              left: 0, // left와 right를 모두 0을 주면 좌우로 최대 크기를 차지함
              right: 0,
              child: Footer(
                onEmoticonTap: onEmoticonTap,
              ),
            ),
        ],
      ),
    );
  }

  void onEmoticonTap(int index) {}

  Widget renderBody() {
    if (image != null) {
      return Positioned.fill(
        child: Image.file(File(image!.path), fit: BoxFit.cover),
      );
    } else {
      return Center(
        child: TextButton(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey,
          ),
          onPressed: onPickImage,
          child: Text('이미지 선택하기'),
        ),
      );
    }
  }

  void onPickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      this.image = image;
    });
  }

  void onSaveImage() {}
  void onDeleteImage() {}
}
