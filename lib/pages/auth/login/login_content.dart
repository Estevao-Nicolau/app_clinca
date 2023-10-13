import 'package:app_clinica/constants/animation/change_page_animation.dart';
import 'package:app_clinica/constants/theme.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../constants/support_functions.dart';
import '../../base/base_page.dart';
import 'components/bottom_text.dart';
import 'components/top_text.dart';

enum Screens {
  createAccount,
  welcomeBack,
}

class LoginContent extends StatefulWidget {
  const LoginContent({Key? key}) : super(key: key);

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent>
    with TickerProviderStateMixin {
  late final List<Widget> createAccountContent;
  late final List<Widget> loginContent;
  Widget inputField(String element, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 8),
      child: Material(
        elevation: 8,
        shadowColor: Colors.black,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
        child: TextField(
          textAlignVertical: TextAlignVertical.bottom,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white70,
            hintText: element,
            prefixIcon: Icon(iconData),
          ),
        ),
      ),
    );
  }

  Widget loginButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 135, vertical: 16),
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const BasePage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 14), backgroundColor: tSecondaryColor,
          shape: const StadiumBorder(),
          elevation: 8,
          shadowColor: Colors.black87,
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget orDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 130, vertical: 8),
      child: Row(
        children: [
          Flexible(
            child: Container(
              height: 1,
              color: tPrimaryColor,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'ou',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 1,
              color: tPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget iconLogos() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: Image.asset('assets/google.png'),
          ),
        ],
      ),
    );
  }

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 110),
      child: TextButton(
        onPressed: () {},
        child: const Text(
          'Esqueci minha senha',
          style: TextStyle(
            color: tPrimaryColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    createAccountContent = [
      inputField('Name', Ionicons.person_outline),
      inputField('Email', Ionicons.mail_outline),
      inputField('Password', Ionicons.lock_closed_outline),
      loginButton('Cadastrar'),
      orDivider(),
      iconLogos(),
    ];

    loginContent = [
      inputField('Name', Ionicons.person_outline),
      inputField('Email', Ionicons.mail_outline),
      loginButton('Entra'),
      forgotPassword(),
    ];

    ChangePage.initialize(
      vsync: this,
      createAccountItems: createAccountContent.length,
      loginItems: loginContent.length,
    );

    for (var i = 0; i < createAccountContent.length; i++) {
      createAccountContent[i] = SupportFunctions.wrapWithAnimatedBuilder(
        animation: ChangePage.createAccountAnimations[i],
        child: createAccountContent[i],
      );
    }

    for (var i = 0; i < loginContent.length; i++) {
      loginContent[i] = SupportFunctions.wrapWithAnimatedBuilder(
        animation: ChangePage.loginAnimations[i],
        child: loginContent[i],
      );
    }

    super.initState();
  }

  @override
  void dispose() {
    ChangePage.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned(
          top: 140,
          left: 50,
          child: TopText(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: createAccountContent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: loginContent,
              ),
            ],
          ),
        ),
        const Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: BottomText(),
          ),
        )
      ],
    );
  }
}
