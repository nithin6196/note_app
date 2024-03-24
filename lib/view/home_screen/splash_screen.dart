import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app/core/constants/color_constants.dart';
import 'package:note_app/core/constants/image_constants.dart';
import 'package:note_app/view/home_screen/notes_screen/notes_screen.dart';

class SplashkScreen extends StatefulWidget {
  const SplashkScreen({super.key});

  @override
  State<SplashkScreen> createState() => _SplashkScreenState();
}

class _SplashkScreenState extends State<SplashkScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const NotesScreen(),
          ));
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: ColorConstants.lightRed,
          image: DecorationImage(
            image: AssetImage(ImageConstants.noteAppLogo),
          ),
        ),
      ),
    );
  }
}
