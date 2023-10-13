import 'package:app_clinica/pages/auth/login/login_content.dart';
import 'package:flutter/material.dart';

class ChangePage {
  static late final AnimationController topTextController;
  static late final Animation<Offset> topTextAnimation;

  static late final AnimationController bottomTextController;
  static late final Animation<Offset> bottomTextAnimation;

  static final List<AnimationController> createAccountController = [];
  static final List<Animation<Offset>> createAccountAnimations = [];

  static final List<AnimationController> loginController = [];
  static final List<Animation<Offset>> loginAnimations = [];

  static var isPlaying = false;
  static var currentScreen = Screens.createAccount;

  static Animation<Offset> _createAnimation({
    required Offset begin,
    required Offset end,
    required AnimationController parent,
  }) {
    return Tween(begin: begin, end: end).animate(
      CurvedAnimation(
        parent: parent,
        curve: Curves.easeInOut,
      ),
    );
  }

  static void initialize({
    required TickerProvider vsync,
    required int createAccountItems,
    required int loginItems,
  }) {
    topTextController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );
    topTextAnimation = _createAnimation(
        begin: Offset.zero,
        end: const Offset(-1.2, 0),
        parent: topTextController);
    bottomTextController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 200),
    );
    bottomTextAnimation = _createAnimation(
      begin: Offset.zero,
      end: const Offset(0, 1.7),
      parent: bottomTextController,
    );

    for (var i = 0; i < createAccountItems; i++) {
      createAccountController.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(microseconds: 200),
        ),
      );
      createAccountAnimations.add(
        _createAnimation(
          begin: Offset.zero,
          end: const Offset(-1, 9),
          parent: createAccountController[i],
        ),
      );
    }

    for (var i = 0; i < loginItems; i++) {
      loginController.add(
        AnimationController(
          vsync: vsync,
          duration: const Duration(microseconds: 200),
        ),
      );
      loginAnimations.add(
        _createAnimation(
          begin: const Offset(5, 0),
          end: Offset.zero,
          parent: loginController[i],
        ),
      );
    }
  }

  static void dispose() {
    topTextController.dispose();
    bottomTextController.dispose();

    for (final controller in [
      topTextController,
      bottomTextController,
      ...createAccountController,
      ...loginController,
    ]) {
      controller.dispose();
    }
  }

  static Future<void> forward() async {
    isPlaying = true;
    topTextController.forward();
    await bottomTextController.forward();

    for (final controller in [
      ...createAccountController,
      ...loginController,
    ]) {
      controller.forward();
      await Future.delayed(const Duration(milliseconds: 100));
    }

    bottomTextController.reverse();
    await topTextController.reverse();

    isPlaying = false;
  }

  static Future<void> reverse() async {
    isPlaying = true;
    topTextController.forward();
    await bottomTextController.forward();

    for (final controller in [
      ...loginController.reversed,
      ...createAccountController.reversed,
    ]) {
      controller.reverse();
      await Future.delayed(const Duration(milliseconds: 100));
    }

    bottomTextController.reverse();
    await topTextController.reverse();

    isPlaying = false;
  }
}
