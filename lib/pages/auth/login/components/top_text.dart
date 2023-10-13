import 'package:flutter/material.dart';

import '../../../../constants/animation/change_page_animation.dart';
import '../../../../constants/support_functions.dart';
import '../login_content.dart';

class TopText extends StatefulWidget {
  const TopText({Key? key}) : super(key: key);

  @override
  State<TopText> createState() => _TopTextState();
}

class _TopTextState extends State<TopText> {
  @override
  void initState() {
    ChangePage.topTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SupportFunctions.wrapWithAnimatedBuilder(
      animation: ChangePage.topTextAnimation,
      child: Text(
        ChangePage.currentScreen == Screens.createAccount
            ? 'Cadastro \n  Clinica'
            : 'Bem-Vindo \n  Clinica',
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white70,
        ),
      ),
    );
  }
}
