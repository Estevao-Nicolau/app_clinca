import 'dart:math' as math;

import 'package:app_clinica/pages/auth/login/components/widget/center_widget.dart';
import 'package:flutter/material.dart';

import 'login_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Topo da tela
  Widget topWiget(double screenWidth) {
    return Transform.rotate(
      angle: -25 * math.pi / 180,
      child: Container(
        width: 1.2 * screenWidth,
        height: 1.2 * screenWidth,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(150),
          gradient: const LinearGradient(
            begin: Alignment(-0.2, -0.8),
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(0, 9, 241, 229),
              Color.fromARGB(179, 6, 114, 191),
            ],
          ),
        ),
      ),
    );
  }

// Baixo da Tela
  Widget bottomWiget(double screenWidth) {
    return Container(
      width: 1.5 * screenWidth,
      height: 1.5 * screenWidth,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
            begin: Alignment(0.6, -1.1),
            end: Alignment(0.7, 0.8),
            colors: [
              Color.fromARGB(179, 2, 247, 234),
              Color.fromARGB(179, 144, 43, 233),
            ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -160,
            left: -30,
            child: topWiget(screenSize.width),
          ),
          Positioned(
            bottom: -180,
            left: -25,
            child: bottomWiget(screenSize.width),
          ),
          CenterWidget(size: screenSize),
           const LoginContent(), 
        ],
      ),
    );
  }
}
