import 'package:app_clinica/constants/animation/change_page_animation.dart';
import 'package:app_clinica/constants/theme.dart';
import 'package:app_clinica/pages/auth/login/login_content.dart';
import 'package:flutter/material.dart';

import '../../../../constants/support_functions.dart';

class BottomText extends StatefulWidget {
  const BottomText({Key? key}) : super(key: key);

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  @override
  void initState() {
    ChangePage.bottomTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SupportFunctions.wrapWithAnimatedBuilder(
      animation: ChangePage.bottomTextAnimation,
      child: GestureDetector(
        onTap: () {
          if (!ChangePage.isPlaying) {
            ChangePage.currentScreen == Screens.createAccount
                ? ChangePage.forward()
                : ChangePage.reverse();

            ChangePage.currentScreen =
                Screens.values[1 - ChangePage.currentScreen.index];
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              children: [
                TextSpan(
                  text: ChangePage.currentScreen == Screens.createAccount
                      ? 'Já tem conta?'
                      : 'Não tenho conta',
                  style: const TextStyle(
                    color: tPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextSpan(
                  text: ChangePage.currentScreen == Screens.createAccount
                      ? ' Login'
                      : '  Cadastrar',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
